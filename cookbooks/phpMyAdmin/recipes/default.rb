#
# Cookbook Name:: phpMyAdmin
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "phpmyadmin" do
	action :install
end

cookbook_file "/etc/httpd/conf.d/phpmyadmin.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "phpmyadmin.conf"
	action :create
	notifies :restart, "service[apache2]"
end

