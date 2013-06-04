#
# Cookbook Name:: ssh
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "openssh-server" do
	action :install
end



service "openssh" do
	case node['platform_family']
	when "rhel"
		service_name "sshd"
	when "debian"
		service_name "ssh"
	end
	action [:enable, :restart]
end