class Timer
	MissingTimestampError = Class.new(StandardError)

	def initialize(dir = Turbine::Application.config_dir)
		@file = "#{dir}/timestamp"
	end
end

t = Timer.new