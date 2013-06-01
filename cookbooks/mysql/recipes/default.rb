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

service "mysqld" do
	pattern "mysqld"
	action [:enable]
end
