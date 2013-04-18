class FakeMail
	def self.deliver(&block)
		message = Message.new(&block)
		message.deliver
	end

	class Message
		def initialize(&block)
			instance_eval(&block) if block
		end

		attr_writer :from, :to

		def from(text = nil)
			return @from if text.nil?

			@from = text
		end

		def to(text = nil)
			return @to if text.nil?

			@to = text
		end

		def deliver
			puts "Deliver mail from: #{from} to: #{to}"
		end
	end
end

FakeMail.deliver do
	from 'ion'
	to 'gheo'
end