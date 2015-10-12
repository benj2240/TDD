class EmptyNode
	def insert value
		LeafNode.new value
	end
end

LeafNode = Struct.new :value

LinkNode = Struct.new :value, :child