case platform
	when "centos", "amazon"
		default['mysql']['from_file']['packages'] = {
				"MySQL-shared-5.6.14-1.el6.x86_64.rpm" => 'https://www.dropbox.com/sh/pzl1m9mdy0241ko/QM8JwyyqLB/centos/MySQL-shared-5.6.14-1.el6.x86_64.rpm?dl=1',
				"MySQL-shared-compat-5.6.14-1.el6.x86_64.rpm" => 'https://www.dropbox.com/sh/pzl1m9mdy0241ko/0d7s9GmCj8/centos/MySQL-shared-compat-5.6.14-1.el6.x86_64.rpm?dl=1',
				"MySQL-client-5.6.14-1.el6.x86_64.rpm" => 'https://www.dropbox.com/sh/pzl1m9mdy0241ko/mxZUvq2Zio/centos/MySQL-client-5.6.14-1.el6.x86_64.rpm?dl=1',
				"MySQL-devel-5.6.14-1.el6.x86_64.rpm" => 'https://www.dropbox.com/sh/pzl1m9mdy0241ko/5PW7msYGCQ/centos/MySQL-devel-5.6.14-1.el6.x86_64.rpm?dl=1',
				"MySQL-server-5.6.14-1.el6.x86_64.rpm" => 'https://www.dropbox.com/sh/pzl1m9mdy0241ko/0YSo8sx1iG/centos/MySQL-server-5.6.14-1.el6.x86_64.rpm?dl=1'
			}
	when "debian", "ubuntu"
		default['mysql']['from_file']['packages'] = [
		]
end
