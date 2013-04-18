class Module
	def attribute(*attribs)
		attribs.each do |a|
			define_method(a) { instance_variable_get("@#{a}") }
			define_method("#{a}=") { |val| instance_variable_set("@#{a}", val) }
		end
	end
end

class Person
	attribute :name, :age
end

p = Person.new
p.name = "ion"
puts p.name