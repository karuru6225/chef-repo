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

	yum_package 'libaio' do
		action :install
	end

	node['mysql']['from_file']['packages'].each{|name|
		file_path = "#{Chef::Config[:file_cache_path]}/" << name
		remote_file file_path do
			source "http://dev.mysql.com/get/Downloads/MySQL-5.6/#{name}/from/http://cdn.mysql.com/"
			action :create_if_missing
		end
		rpm_package file_path do
			action :install
		end
	}
end


