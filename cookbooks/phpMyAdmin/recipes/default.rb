#
# Cookbook Name:: phpMyAdmin
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "phpmyadmin" do
	action :purge
end

git node['phpMyAdmin']['directory'] do
	repository "https://github.com/phpmyadmin/phpmyadmin.git"
	reference "master"
	revision "RELEASE_4_0_3"
	depth 1
	action :sync
end


template node['phpMyAdmin']['conf'] do
	owner "root"
	group "root"
	mode "0644"
	source "phpmyadmin.conf.erb"
	variables({
		:confdir => node['phpMyAdmin']['conf']
	})
	action :create
	notifies :restart, "service[apache2]"
end
