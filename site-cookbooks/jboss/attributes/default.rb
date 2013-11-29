case platform
	when "centos", "amazon"
		default['jboss']['default']['name'] = "jboss-as-7.1.1.Final"
		default['jboss']['default']['url'] = "https://www.dropbox.com/sh/pzl1m9mdy0241ko/xp6kxxH_L1/centos/jboss-as-7.1.1.Final.zip?dl=1"
		default['jboss']['default']['target'] = '/usr/share/'
	when "debian", "ubuntu"
end
