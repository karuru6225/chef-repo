case platform
	when "centos", "amazon"
		default['java']['from_file']['packages'] = [
				"jdk-7u40-linux-x64.rpm" => 'https://www.dropbox.com/sh/pzl1m9mdy0241ko/GjvdVpbeC_/centos/jdk-7u40-linux-x64.rpm',
			]
	when "debian", "ubuntu"
		default['java']['from_file']['packages'] = [
		]
end
