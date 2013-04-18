class FakeEmailBuilder
	def self.deliver(&block)
		message = MessageBuilder.new(&block).message
		message.deliver
	end

	class MessageBuilder
		def initialize(&block)
			@message = Message.new
			instance_eval(&block) if block
		end

		attr_reader :message

		def from(text)
			message.from = text
		end

		def to(text)
			message.to = text
		end
	end

	class Message
		attr_accessor :from, :to

		def deliver
			puts "Deliver mail from: #{from} to: #{to}"
		end
	end
end

FakeEmailBuilder.deliver do
	from 'ion'
	to 'gheo'
end