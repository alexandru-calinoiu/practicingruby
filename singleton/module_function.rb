module A
	def x
		10
	end

	module_function :x

	def x
		12
	end
end

p A.x # 10

class B
	include A
end

p B.new.x # 12