case platform
when "centos", "amazon"
	default['jboss']['default']['name'] = "jboss-as-7.1.1.Final"
	default['jboss']['default']['url'] = "http://test.ncdc.co.jp/packages/centos/jboss-as-7.1.1.Final.zip"
	default['jboss']['default']['target'] = '/usr/share/'
	default['jboss']['default']['logfile'] = '/var/log/jboss-as/console.log'
end
