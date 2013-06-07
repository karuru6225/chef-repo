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
	action [:enable]
end

cookbook_file node['apache']['home'] + '/' + node['apache']['conffile'] do
	owner 'root'
	group 'root'
	mode '0644'
	source 'httpd.conf'
	action :create
	notifies :restart, "service[apache2]"
end

cookbook_file node['apache']['home'] + '/' + node['apache']['confdir'] + '/000-main.conf' do
	owner 'root'
	group 'root'
	mode '0644'
	source '000-main.conf'
	action :create
	notifies :restart, "service[apache2]"
end
