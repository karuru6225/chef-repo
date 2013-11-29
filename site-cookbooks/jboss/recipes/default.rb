#
# Cookbook Name:: jboss
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

params = node['jboss']['default']

package 'unzip' do
	action :install
end

file_path = "#{Chef::Config[:file_cache_path]}/#{params['name']}.zip"
remote_file file_path do
	source params['url']
	action :create_if_missing
end

execute 'unzip_jboss' do
	command "unzip -o -d \"#{params['target']}\" \"#{file_path}\""
end

user 'jboss' do
	action :create
end

directory "#{params['target']}/#{params['name']}" do
	owner 'jboss'
	group 'jboss'
	recursive true
end
