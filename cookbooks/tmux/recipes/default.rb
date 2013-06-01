#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "tmux" do
	action :install
end

cookbook_file "/root/.tmux.conf" do
	owner "root"
	group "root"
	mode "0644"
	source "tmux.conf"
end

cookbook_file "/etc/profile.d/tmux.sh" do
	owner "root"
	group "root"
	mode "0644"
	source "tmux.sh"
end