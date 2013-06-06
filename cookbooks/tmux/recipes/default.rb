#
# Cookbook Name:: tmux
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "tmux" do
	action :install
end

cookbook_file "/etc/tmux.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "tmux.conf"
end
