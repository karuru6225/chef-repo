site :opscode

group :jenkins do
	cookbook 'java'
	cookbook 'jenkins'
end

cookbook 'git'
cookbook 'yum'
cookbook 'yumrepo', git: 'https://github.com/atomic-penguin/cookbook-yumrepo.git'
cookbook 'rbenv', git: 'https://github.com/RiotGames/rbenv-cookbook.git'

cookbook 'apache2', path: './site-cookbooks/apache2'
cookbook 'bash', path: './site-cookbooks/bash'
cookbook 'basic-packages', path: './site-cookbooks/basic-packages'
cookbook 'devel-kit', path: './site-cookbooks/devel-kit'
cookbook 'java', path: './site-cookbooks/java'
cookbook 'jboss', path: './site-cookbooks/jboss'
cookbook 'maven2', path: './site-cookbooks/maven2'
cookbook 'mysql', path: './site-cookbooks/mysql'
cookbook 'php', path: './site-cookbooks/php'
cookbook 'phpMyAdmin', path: './site-cookbooks/phpMyAdmin'
# cookbook 'ruby', path: './site-cookbooks/ruby'
cookbook 'ssh', path: './site-cookbooks/ssh'
cookbook 'sudo', path: './site-cookbooks/sudo'
cookbook 'tmux', path: './site-cookbooks/tmux'
cookbook 'users', path: './site-cookbooks/users'
cookbook 'vim', path: './site-cookbooks/vim'
