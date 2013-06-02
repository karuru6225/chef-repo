#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "vim" do
	action :install
end

cookbook_file "/root/.vimrc" do
	owner "root"
	group "root"
	mode "0644"
	source "vimrc"
end