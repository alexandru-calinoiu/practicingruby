require 'delegate'
require 'ostruct'

class Displayer < SimpleDelegator
	def name_with_location
		"#{object.name} of #{object.city}"
	end
end

displayer = Displayer.new(OpenStruct.new(name: 'ion', city: 'Sibiu'))

puts displayer.name_with_location
