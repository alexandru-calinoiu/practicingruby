module Memo
	def memoize(method)
		old_method = instance_method(method)
		memo = {}

		define_method(method) do |*args|
			memo[args] ||= old_method.bind(self).call(*args)
		end
	end
end

class Fib
	extend Memo

	def calculate(n)
		return n if n < 2
		return calculate(n - 2) + calculate(n - 1)
	end

	memoize :calculate
end


require "benchmark"

result = Benchmark.measure do
	puts Fib.new.calculate(4056)
end

puts result
