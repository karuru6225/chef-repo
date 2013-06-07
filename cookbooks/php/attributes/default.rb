case platform
	when "centos"
		default['php']['packages'] = [
			"php",
			"php-mbstring",
			"php-mysql"
		]
	when "debian"
		default['php']['packages'] = [
			"php5",
			"php5-mysql"
		]
end
