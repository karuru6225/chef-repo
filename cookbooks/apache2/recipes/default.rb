#
# Cookbook Name:: apache2
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "apache2" do
	package_name node['apache']['package']
end

service "apache2" do
	case node['platform_family']
	when "rhel"
		service_name "httpd"
	when "debian"
		service_name "apache2"
	end
	action :enable
end