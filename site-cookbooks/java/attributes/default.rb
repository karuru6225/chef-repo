case platform
	when "centos", "amazon"
		default['java']['from_file']['packages'] = {
				"jdk-7u40-linux-x64.rpm" => 'http://test.ncdc.co.jp/packages/centos/jdk-7u40-linux-x64.rpm',
			}
	when "debian", "ubuntu"
		default['java']['from_file']['packages'] = [
		]
end
