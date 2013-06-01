#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/root/.bashrc" do
	owner "root"
	group "root"
	mode "0644"
	source "bashrc"
end