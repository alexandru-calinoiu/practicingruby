class BasicController
	def self.before_filters
		@before_filters ||= []
	end

	def self.before_filter(callback, params = {})
		before_filters << params.merge(callback: callback)
	end

	def self.inherited(child_class)
		before_filters.each { |f| child_class.before_filters.unshift(f) }
	end

	def execute(action)
		matched_filters = self.class.before_filters.select do |f|
			f[:only].nil? || f[:only].include?(action)
		end

		matched_filters.each { |f| send f[:callback] }
		send(action)
	end
end

class ProductController < BasicController
	before_filter :auth, only: [:create, :edit]

	def index
		puts 'calls index'
	end

	def create
		puts 'calls create'
	end

	def edit
		puts 'calls edit'
	end

	private 

	def auth
		puts 'calls auth'
	end
end

ProductController.new.execute(:create)