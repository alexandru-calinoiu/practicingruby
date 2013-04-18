class Displayer < SimpleDelegator
	def name_with_location
		"#{__getobj__.name} of #{__getobj__.city}"
end

displayer = Displayer.new(OpenStruct.new(name: 'ion', city: 'Sibiu'))

puts displayer.name_with_location
