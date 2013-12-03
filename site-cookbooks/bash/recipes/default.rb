#
# Cookbook Name:: bash
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

cookbook_file "/etc/profile.d/my_bash_setting.sh" do
	owner "root"
	group "root"
	mode "0644"
	source "my_bash_setting.sh"
end

file "/etc/skel/.bash_history" do
	owner "root"
	group "root"
	mode "0644"
	content ""
end
