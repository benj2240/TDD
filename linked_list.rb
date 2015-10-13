class EmptyNode
	def insert value
		LeafNode.new value
	end
end

LeafNode = Struct.new :value do
	def insert value
		LinkNode.new(self.value, LeafNode.new(value))
	end
end

LinkNode = Struct.new :value, :child do
	def insert value
		self.child = self.child.insert value
		self
	end
end