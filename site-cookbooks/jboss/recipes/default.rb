#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

params = node['jboss']['default']
# pdata = Chef::EncryptedDataBagItem.load('jboss','user')

package 'unzip' do
	action :install
end

if !File.exists?("#{params['target']}/#{params['name']}")
	file_path = "#{Chef::Config[:file_cache_path]}/#{params['name']}.zip"
	remote_file file_path do
		source params['url']
		action :create_if_missing
	end

	execute 'jboss_unzip' do
		command "unzip -o -d \"#{params['target']}\" \"#{file_path}\""
		#notifies :run, "execute[jboss_add_user]"
		notifies :run, "execute[create_initd_file]"
		notifies :run, "ruby_block[jboss_message]", :delayed
		notifies :run, "execute[modify permissions]", :delayed
	end

	#execute 'jboss_add_user' do
	#	command "cd \"#{params['target']}#{params['name']}/bin\" && ./add-user.sh -a '#{pdata['id']}' 'test'"
	#	action :nothing
	#end

	ruby_block 'jboss_message' do
		block do
			p "[root ~]# passwd jboss"
			p "[jboss bin]$ ./add-user.sh"
			p "What type of user do you wish to add?"
			p "a) Management User (mgmt-users.properties)"
			p "b) Application User (application-users.properties)"
			p "(a): a"
			p ""
			p "Enter the details of the new user to add."
			p "Realm (ManagementRealm) :"
			p "Username : jboss"
			p "Password :"
			p "Re-enter Password :"
			p "About to add user 'jboss' for realm 'ManagementRealm'"
			p "Is this correct yes/no? yes"
			p "Added user 'jboss' to file '/usr/share/jboss-as-7.1.1.Final/standalone/configuration/mgmt-users.properties'"
			p "Added user 'jboss' to file '/usr/share/jboss-as-7.1.1.Final/domain/configuration/mgmt-users.properties'"
			p ""
		end
		action :nothing
	end
end

user 'jboss' do
	action :create
end

directory "/etc/jboss-as/" do
	action :create
end

execute 'create_initd_file' do
	command "cp \"#{params['target']}#{params['name']}/bin/init.d/jboss-as-standalone.sh\" \"/etc/init.d/jboss\""
	not_if "test -f /etc/init.d/jboss"
	action :run
end

execute "modify permissions" do
	command "chown -R jboss:jboss \"#{params['target']}#{params['name']}\""
	action :run
end

template "/etc/jboss-as/jboss-as.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "jboss-as.conf.erb"
	variables({
		:jboss_logfile => params['logfile'],
		:jboss_home => params['target'] << params['name']
	})
end

directory File.dirname(params['logfile']) do
	action :create
	owner "root"
	group "root"
	mode "0644"
end

file params['logfile'] do
	action :touch
end

service "jboss" do
	action :enable
end
