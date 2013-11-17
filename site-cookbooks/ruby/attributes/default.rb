case platform
	when "centos", "amazon"
		default['ruby']['packages'] = [
			{ :name =>  "sqlite-devel", :arch => nil },
			{ :name =>  "mysql-devel", :arch => nil },
			{ :name =>  "gcc", :arch => nil },
			{ :name =>  "gcc-c++", :arch => nil },
			{ :name =>  "automake", :arch => nil },
			{ :name =>  "autoconf", :arch => nil },
			{ :name =>  "make", :arch => nil },
			{ :name =>  "openssl-devel", :arch => node[:kernel][:machine] },
		]
	when "debian", "ubuntu"
		default['ruby']['packages'] = [
			"libsqlite3-dev",
			"libmysql-ruby1.9.1",
			"libmysqlclient-dev"
		]
end
