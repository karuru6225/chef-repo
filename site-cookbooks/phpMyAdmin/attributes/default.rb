case platform
	when "centos"
		default['phpMyAdmin']['directory'] = "/var/www/html/phpmyadmin"
		default['phpMyAdmin']['conf'] = "/etc/httpd/conf.d/phpmyadmin.conf"
	when "debian", "ubuntu"
		default['phpMyAdmin']['directory'] = "/var/www/phpmyadmin"
		default['phpMyAdmin']['conf'] = "/etc/apache2/sites-enabled/phpmyadmin.conf"
end