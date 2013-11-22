#
# Cookbook Name:: devel-kit
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "centos", "amazon"
	node['mysql::from_file']['packages'].each{|name|
		rpm_package name do
			action :install
		end
	}
end


