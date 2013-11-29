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

	node['java']['from_file']['packages'].each{|name, url|
		file_path = "#{Chef::Config[:file_cache_path]}/" << name
		remote_file file_path do
			source url
			action :create_if_missing
		end
		rpm_package file_path do
			action :install
		end
	}
end

