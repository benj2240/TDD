class EmptyNode
	def insert value
		LeafNode.new value
	end

	def get index
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
		self.value
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

	def to_a
		[self.value] + self.child.to_a
	end
end

class LinkedList
	def initialize values = []
		@root = EmptyNode.new

		values.each do |value|
			@root = @root.insert value
		end
	end

	def insert value
		@root = @root.insert value
	end

	def to_a
		@root.to_a
	end
end