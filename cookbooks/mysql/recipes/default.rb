#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "mysql-server" do
	action :install
end

service "mysql" do
	case node['platform_family']
	when "rhel"
		service_name "mysqld"
	when "debian"
		service_name "mysql"
	end
	action [:enable]
end
