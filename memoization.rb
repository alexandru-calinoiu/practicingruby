class Fib
	@@memo = { 0 => 0,  1 => 1 }

	def self.calculate(n)
		@@memo[n] ||= calculate(n - 2) + calculate(n - 1)
	end
end

p Fib.calculate(7)
