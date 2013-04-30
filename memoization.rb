module Memo
	@@memo = {0 => 1, 1 => 1}

	def memoize(method)
		alias_method "old_#{method}".to_sym, method

		define_method(method) do |*args|
			@@memo[args] ||= self.send("old_#{method}".to_sym, *args)
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

p Fib.new.calculate(7)
