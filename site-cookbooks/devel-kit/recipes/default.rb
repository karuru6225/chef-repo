#
# Cookbook Name:: devel-kit
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node[:platform]
when "centos", "amazon"
	node['devel-kit']['packages'].each{|value|
		yum_package value[:name] do
			arch value[:arch]
			action :install
		end
	}
end

