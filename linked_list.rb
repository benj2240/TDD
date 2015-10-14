require 'singleton'

class EmptyNode
	include Singleton

	def insert value
		Node.new value, EmptyNode.instance
	end

	def get index
		case index >= 0
		when true
			raise "Index out of bounds"
		when false
			raise ArgumentError.new "Negative index"
		end
	end

	def delete value
		raise "Value not found"
	end

	def to_a
		[]
	end
end

Node = Struct.new :value, :child do
	def insert value
		self.child = self.child.insert value
		self
	end

	def get index
		case index <=> 0
		when 1
			self.child.get index - 1
		when 0
			self.value
		when -1
			raise ArgumentError.new "Negative index"
		end
	end

	def delete value
		if value == self.value
			self.child
		else
			self.child = self.child.delete value
			self
		end
	end

	def to_a
		[self.value] + self.child.to_a
	end
end

class LinkedList
	def initialize values = []
		@root = EmptyNode.instance

		values.each do |value|
			@root = @root.insert value
		end
	end

	def insert value
		@root = @root.insert value
	end

	def get index
		@root.get index
	end

	def delete value
		@root = @root.delete value
	end

	def to_a
		@root.to_a
	end
end