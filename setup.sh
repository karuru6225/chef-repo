set -ex

if [ -f /etc/redhat-release ]; then
	UNAME=`cat /etc/redhat-release`
	if [[ ${OS} =~ .*CentOS\ release\ 6.* ]];then
	OS="centos"
	VER="6"
	elif [[ ${OS} =~ .*CentOS\ release\ 5.* ]];then
	OS="centos"
	VER="5"
	fi
elif [ -f /etc/debian_version ]; then
	OS="debian"
	VER=`cat /etc/debian_version`
fi

#x86_64決め打ちなので注意
if [ ${OS} == "centos" -a ${VER} == "6" ];then
	wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
	rpm -ivh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
	rm -f rpmforge-release-*
	sed -e "/gpgkey/i priority=1" /etc/yum.repos.d/CentOS-Base.repo
elif [ ${OS} == "centos" -a ${VER} == "5" ];then
	wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm
	rpm -ivh rpmforge-release-0.5.3-1.el5.rf.x86_64.rpm
	rm -f rpmforge-release-*
	sed -e "/gpgkey/i priority=1" /etc/yum.repos.d/CentOS-Base.repo
fi

if [ "${OS}" == "centos" ]; then
	yum -y install git yum-plugin-priorities man gcc gcc-c++ automake autoconf make openssl-devel.x86_64
	yum -y install tmux
elif [ "${OS}" == "debian" ]; then
	apt-get -y install git build-essential libssl-dev libreadline5-dev
fi

cd /usr/local/
rm -rf rbenv
git clone git://github.com/sstephenson/rbenv.git rbenv

export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
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

rbenv install 1.9.3-p392
rbenv global 1.9.3-p392
gem install bundler chef --no-rdoc --no-ri

if [ ! -d ~/.ssh ];then
	mkdir ~/.ssh
	chmod 700 ~/.ssh
fi