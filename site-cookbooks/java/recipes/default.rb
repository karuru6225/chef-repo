#
# Cookbook Name:: java
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "centos", "amazon"

	name = "jdk-7u40-linux-x64.rpm"
	file_path = "#{Chef::Config[:file_cache_path]}/" << name

	cookbook_file name do
		path file_path
		action :create_if_missing
	end

	rpm_package file_path do
		action :install
	end
end
