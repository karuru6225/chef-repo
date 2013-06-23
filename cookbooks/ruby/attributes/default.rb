case platform
	when "centos"
		default['ruby']['packages'] = [
			"sqlite-devel",
			"ruby-mysql"
		]
	when "debian"
		default['ruby']['packages'] = [
			"libsqlite3-dev",
			"libmysql-ruby1.9.1",
			"libmysqlclient-dev"
		]
end
