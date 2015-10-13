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

LinkNode = Struct.new :value, :child