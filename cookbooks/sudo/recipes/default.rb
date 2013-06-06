#
# Cookbook Name:: sudo
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "sudo" do
	action :install
end

cookbook_file "/etc/sudoers" do
	owner "root"
	group "root"
	mode "0440"
	source "sudoers"
end

directory "/etc/sudoers.d" do
	owner "root"
	group "root"
	mode "0750"
	action :create
end
