#
# Cookbook Name:: ruby
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "libsqlite3-dev" do
	action :install
end

package "libmysql-ruby1.9.1" do
	action :install
end

package "libmysqlclient-dev" do
	action :install
end
