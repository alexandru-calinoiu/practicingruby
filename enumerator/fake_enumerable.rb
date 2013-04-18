module FakeEnumerable
	def map
		if block_given?
			result = []
			each { |e| result << yield(e) }
		else
			result = FakeEnumerator.new(self, :map)
		end

		result
	end

	def cycle
		if block_given?
			loop { each { |e| yield(e) } }
		else
			FakeEnumerator.new(self, :cycle)
		end
	end

	def sort_by		
		map { |e| [yield(e), e] }.sort.map { |e| e[1] }
	end

	def select
		result = []

		each { |e| result << e if yield(e) }

		result
	end

	def reduce(operation_or_value = nil)
		case operation_or_value
		when Symbol
			return reduce { |s, e| s.send(operation_or_value, e) }
		when nil
			acc = nil
		else
			acc = operation_or_value
		end

		each do |e|
			if acc.nil?
				acc = e
			else
				acc = yield(acc, e)
			end
		end

		acc
	end
end