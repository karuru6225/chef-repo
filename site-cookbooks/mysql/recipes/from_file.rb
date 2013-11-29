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

	node['mysql']['from_file']['packages'].each{|name, url|
		file_path = "#{Chef::Config[:file_cache_path]}/" << name

		remote_file file_path do
			source url
			action :create_if_missing
			not_if "rpm -qa | grep -q '#{name}'"
			notifies :install, "rpm_package[#{file_path}]", :immediately
		end

		rpm_package file_path do
			action :nothing
		end
	}
end

service "mysql" do
	case node['platform']
	when "centos"
		service_name "mysql"
	end
	action [:enable, :restart]
end
