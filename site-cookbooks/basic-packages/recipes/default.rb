#
# Cookbook Name:: basic-packages
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "centos", "amazon"
	node['basic-packages']['packages'].each{|value|
		yum_package value[:name] do
			arch value[:arch]
			action :install
		end
	}
end

