require "delegate"

module DynamicFinderProxy
	extend self

	def build_proxy(record)
		proxy = SimpleDelegator.new(record)
		record.attribute_names.each do |a|
			proxy.singleton_class.instance_eval do
				define_method(a) { read_attribute(a) }
				define_method("#{a}=") { |v| write_attribute(a, v) }
			end
		end

		proxy
	end

end

class FakeActiveRecord

	class << self
		def new
			obj = allocate
			obj.send(:initialize)
			DynamicFinderProxy.build_proxy(obj)
		end

		def column_names(*names)
			@column_names = names unless names.empty?
			@column_names
		end
	end

	def attribute_names
		self.class.column_names
	end

	def read_attribute(a)
		logger.puts("Reading #{a}")
		instance_variable_get("@#{a}")
	end

	def write_attribute(a, v)
		logger.puts("Writing #{a}")
		instance_variable_set("@#{a}", v)
	end

	def logger
		STD	OUT
	end

end

class LinuxConfiguration < FakeActiveRecord
	column_names "logger", "crontab"
end

record = LinuxConfiguration.new
p record.methods.sort