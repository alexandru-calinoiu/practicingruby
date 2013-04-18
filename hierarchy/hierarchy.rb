class Animal
	def initialize(name)
		@name = name
	end

	def info
		puts "I am '#{self.class}'"
		puts "My name is '#{@name}'"
	end
end

class Dog < Animal
	prepend Mamal

	def info
		puts "I #{make_noise}"
		super
	end

	def make_noise
		'bark "Woof Woof"'
	end
end

module Mamal
	def info
		puts 'I am a mamal'
		super
	end
end

lassie = Dog.new('Lassie')
lassie.info

scooby = Dog.new('Scooby')

class << scooby
	def make_noise
		'howl "Scooby Scooby doo!"'
	end
end

scooby.info