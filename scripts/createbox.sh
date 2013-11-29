#!/bin/bash

echo 'Please setting sudoers and selinux before running this script.'
echo -n 'OK ? >'
read

set -ex

mount /dev/cdrom /mnt
if yum check-update; then
	echo 'Please execute yum-update and reboot before running this script.'
	exit 1
fi
if [[ ! -f /mnt/VBoxLinuxAdditions.run ]];then
	echo 'Please mount Guest Additions CD Image' 1>&2
	exit 1
fi

#install for building guest addition
yum install -y gcc gcc-c++ automake autoconf make kernel-devel

#install guest addition
sh /mnt/VBoxLinuxAdditions.run

#setting for vagrant
adduser vagrant
echo "vagrant" | passwd --stdin vagrant
gpasswd -a vagrant wheel
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
curl 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' > authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

echo 'UseDNS no' >> /etc/ssh/sshd_config

#install chef
curl -L https://www.opscode.com/chef/install.sh | bash -s -v 11.6.2

yum remove -y gcc gcc-c++ automake autoconf make kernel-devel kernel-headers
rm -f /var/lib/dhclient/*

rm -f /etc/udev/rules.d/70-persistent-net.rules
mkdir /etc/udev/rules.d/70-persistent-net.rules

dd if=/dev/zero of=empty
rm -f empty

echo 'done'