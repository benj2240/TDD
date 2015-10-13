require 'singleton'

class EmptyNode
	include Singleton

	def insert value
		LeafNode.new value
	end

	def get index
		raise "List is empty"
	end

	def delete value
		raise "List is empty"
	end

	def to_a
		[]
	end
end

LeafNode = Struct.new :value do
	def insert value
		LinkNode.new(self.value, LeafNode.new(value))
	end

	def get index
		raise "Index out of range" if index != 0
		self.value
	end

	def delete value
		if value == self.value
			EmptyNode.instance
		else
			self
		end
	end

	def to_a
		[self.value]
	end
end

LinkNode = Struct.new :value, :child do
	def insert value
		self.child = self.child.insert value
		self
	end

	def get index
		case index <=> 0
		when -1
			raise ArgumentError.new "Negative index"
		when 0
			self.value
		when 1
			self.child.get index - 1
		end
	end

	def delete value
		if value == self.value
			self.child
		else
			self.child = self.child.delete value
			if self.child == EmptyNode.instance
				LeafNode.new self.value
			else
				self
			end
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