case platform
	when "centos", "amazon"
		default['basic-packages']['packages'] = [
			{ :name =>  "man", :arch => nil },
		]
	when "debian", "ubuntu"
		default['basic-packages']['packages'] = [
		]
end
