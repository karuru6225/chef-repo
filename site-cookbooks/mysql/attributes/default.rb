case platform
	when "centos", "amazon"
		default['mysql']['from_file']['packages'] = {
				"MySQL-shared-5.6.14-1.el6.x86_64.rpm" =>			'http://test.ncdc.co.jp/packages/centos/MySQL-shared-5.6.14-1.el6.x86_64.rpm',
				"MySQL-shared-compat-5.6.14-1.el6.x86_64.rpm" =>	'http://test.ncdc.co.jp/packages/centos/MySQL-shared-compat-5.6.14-1.el6.x86_64.rpm',
				"MySQL-client-5.6.14-1.el6.x86_64.rpm" =>			'http://test.ncdc.co.jp/packages/centos/MySQL-client-5.6.14-1.el6.x86_64.rpm',
				"MySQL-devel-5.6.14-1.el6.x86_64.rpm" =>			'http://test.ncdc.co.jp/packages/centos/MySQL-devel-5.6.14-1.el6.x86_64.rpm',
				"MySQL-server-5.6.14-1.el6.x86_64.rpm" =>			'http://test.ncdc.co.jp/packages/centos/MySQL-server-5.6.14-1.el6.x86_64.rpm'
			}
	when "debian", "ubuntu"
		default['mysql']['from_file']['packages'] = [
		]
end
