case platform
	when "centos", "amazon"
		default['ruby']['packages'] = [
			"sqlite-devel",
			"ruby-mysql",
			"mysql-devel"
		]
	when "debian"
		default['ruby']['packages'] = [
			"libsqlite3-dev",
			"libmysql-ruby1.9.1",
			"libmysqlclient-dev"
		]
end
