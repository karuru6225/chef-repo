case platform
	when "centos", "amazon"
		default['basic-packages']['packages'] = [
			{ :name =>  "man", :arch => nil },
			{ :name =>  "wget", :arch => nil },
			{ :name =>  "unzip", :arch => nil },
		]
	when "debian", "ubuntu"
		default['basic-packages']['packages'] = [
		]
end
