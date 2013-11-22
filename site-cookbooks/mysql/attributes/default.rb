case platform
	when "centos", "amazon"
		default['mysql']['from_file']['packages'] = [
				"MySQL-client-5.6.14-1.el6.x86_64.rpm",
				"MySQL-devel-5.6.14-1.el6.x86_64.rpm",
				"MySQL-server-5.6.14-1.el6.x86_64.rpm",
				"MySQL-shared-5.6.14-1.el6.x86_64.rpm",
				"MySQL-shared-compat-5.6.14-1.el6.x86_64.rpm"
			]
	when "debian", "ubuntu"
		default['mysql']['from_file']['packages'] = [
		]
end
