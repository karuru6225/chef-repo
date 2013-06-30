case platform
	when "centos"
		default['vim']['packages'] = [
			"vim-enhanced"
		]
	when "debian"
		default['vim']['packages'] = [
			"vim"
		]
end
