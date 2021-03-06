#
# Cookbook Name:: apache2
# Attributes:: apache
#
# Copyright 2008-2009, Opscode, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

case platform
	when "centos", "amazon"
		default['apache']['package']	= "httpd"
		default['apache']['home']		= "/etc/httpd"
		default['apache']['docroot']		= "/var/www/html"
		default['apache']['confdir']		= "conf.d"
		default['apache']['conffile']		= "conf/httpd.conf"
	when "debian", "ubuntu"
		default['apache']['package']	= "apache2"
		default['apache']['home']		= "/etc/apache2"
		default['apache']['docroot']		= "/var/www"
		default['apache']['confdir']		= "sites-enabled"
		default['apache']['conffile']		= "apache2.conf"
end

