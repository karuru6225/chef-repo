#
# Cookbook Name:: maven2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

params = node['maven2']['default']

if !File.exists?("#{params['target']}/#{params['name']}")
	file_path = "#{Chef::Config[:file_cache_path]}/#{params['name']}.tar.gz"
	remote_file file_path do
		source params['url']
		action :create_if_missing
	end

	execute 'jboss_unarchive' do
		command "tar -xz -C \"#{params['target']}\" -f \"#{file_path}\""
	end

end

template '/etc/profile.d/maven.sh' do
	owner "root"
	group "root"
	mode "0755"
	action :create
	source 'maven.sh.erb'
	variables({
		:maven2_home => params['target'] << params['name']
	})
end
