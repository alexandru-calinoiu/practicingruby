require "ostruct"

class Document
	attr_accessor :id

	def ==(other)
		p "in Document"		
		self.id == other.id
	end
end

class DocumentDecorator < Struct.new(:source)
	def ==(other)
		p "in Decorator"
		source.extend(Decorator::Equality) == other
	end
end

module Decorator
	module Equality
		def ==(other)
			p "in Equality"
		end
	end
end

doc1 = DocumentDecorator.new(source: Document.new)
doc2 = DocumentDecorator.new(source: Document.new)

doc1 == doc2