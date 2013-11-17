#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

case node[:platform]
when "centos", "amazon"
	node['ruby']['packages'].each{|value|
		yum_package value[:name] do
			arch value[:arch]
			action :install
		end
	}
end

cookbook_file "/etc/profile.d/rbenv.sh" do
	owner "root"
	group "root"
	mode "0644"
	source "rbenv.sh"
end

cookbook_file "/etc/profile.d/bundler.sh" do
	owner "root"
	group "root"
	mode "0644"
	source "bundler.sh"
end

cookbook_file "/usr/local/bin/create_rails_project.sh" do
	owner "root"
	group "root"
	mode "0755"
	source "create_rails_project.sh"
end
