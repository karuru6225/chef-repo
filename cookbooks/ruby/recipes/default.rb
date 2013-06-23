#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

node['ruby']['packages'].each{|value|
	package value do
		action :install
	end
}

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
