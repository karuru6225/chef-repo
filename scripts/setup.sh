#!/bin/bash

#以下のコマンドで実行する
#curl -L https://raw.github.com/karuru6225/chef-repo/master/scripts/setup.sh | bash

set -ex

if [ -f /etc/redhat-release ]; then
	UNAME=`cat /etc/redhat-release`
	if [[ "${UNAME}" =~ .*CentOS.* ]];then
	OS="centos"
	fi
elif [ -f /etc/debian_version ]; then
	OS="debian"
else
	echo "unsupported OS"
	exit 1
fi

if [ "${OS}" == "centos" ]; then
	yum -y install git yum-plugin-priorities man gcc gcc-c++ automake autoconf make openssl-devel.x86_64
elif [ "${OS}" == "debian" ]; then
	apt-get -y install git build-essential libssl-dev libreadline5-dev
fi

cd /usr/local/
rm -rf rbenv
git clone git://github.com/sstephenson/rbenv.git rbenv

cat > /etc/profile.d/rbenv.sh << EOT
#!/bin/bash

export RBENV_ROOT=/usr/local/rbenv
export PATH="\$RBENV_ROOT/bin:\$PATH"
eval "\$(rbenv init -)"
EOT

chmod u+x /etc/profile.d/rbenv.sh
/etc/profile.d/rbenv.sh

if [ "`grep rbadmin /etc/group`" == "" ]; then
	/usr/sbin/groupadd rbadmin
fi
chgrp -R rbadmin rbenv
chmod -R g+rwxXs rbenv

mkdir /usr/local/rbenv/plugins
cd /usr/local/rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git
chgrp -R rbadmin ruby-build
chmod -R g+rwxs ruby-build

#rbenv install 1.9.3-p448
#rbenv global 1.9.3-p448
rbenv install 2.0.0-p247
rbenv global 2.0.0-p247
gem install bundler --no-rdoc --no-ri

