require "fiber"
require_relative "fake_enumerable"

class FakeEnumerator
	include FakeEnumerable

	def initialize(target, iterator)
		@target = target
		@iterator = iterator
	end

	def each(&block)
		@target.send(@iterator, &block)
	end

	def next
		@fiber ||= Fiber.new do
			each { |e| Fiber.yield(e) }

			raise StopIteration
		end

		if @fiber.alive?
			@fiber.resume
		else
			raise StopIteration
		end
	end

	def with_index
		i = 0
		map do |e|
			out = yield(e, i)
			i += 1
			out
		end
	end

	def rewind
		@fiber = nil
	end
end