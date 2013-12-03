case platform
when "centos", "amazon"
	default['maven2']['default']['name'] = "apache-maven-2.2.1"
	default['maven2']['default']['url'] = "http://test.ncdc.co.jp/packages/centos/apache-maven-2.2.1-bin.tar.gz"
	default['maven2']['default']['target'] = '/usr/share/'
end
