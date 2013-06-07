#
# Cookbook Name:: php
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


php_packages = [
	"php5",
	"php5-mysql",
	
]

php_packages.each{|value|
	package value do
		action :install
	end
}

