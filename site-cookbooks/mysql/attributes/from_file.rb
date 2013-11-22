case platform
	when "centos", "amazon"
		default['myql::from_file']['packages'] = [
				"rpms/MySQL-client-5.6.14-1.el6.x86_64.rpm",
				"rpms/MySQL-devel-5.6.14-1.el6.x86_64.rpm",
				"rpms/MySQL-server-5.6.14-1.el6.x86_64.rpm",
				"rpms/MySQL-shared-5.6.14-1.el6.x86_64.rpm",
				"rpms/MySQL-shared-compat-5.6.14-1.el6.x86_64.rpm"
			]
	when "debian", "ubuntu"
		default['myql::from_file']['packages'] = [
		]
end
