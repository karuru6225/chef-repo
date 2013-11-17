case platform
	when "centos", "amazon"
		default['devel-kit']['packages'] = [
			{ :name =>  "gcc", :arch => nil },
			{ :name =>  "gcc-c++", :arch => nil },
			{ :name =>  "automake", :arch => nil },
			{ :name =>  "autoconf", :arch => nil },
			{ :name =>  "make", :arch => nil },
		]
	when "debian", "ubuntu"
		default['devel-kit']['packages'] = [
		]
end
