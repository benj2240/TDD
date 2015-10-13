require 'test/unit'
require_relative 'linked_list.rb'

class LinkedListTests < Test::Unit::TestCase
	def test_initialize_empty_node
		empty = EmptyNode.new
	end

	def test_initialize_leaf_node
		leaf = LeafNode.new 8
	end

	def test_initialize_link_node
		leaf = LeafNode.new "j"
		link = LinkNode.new "i", leaf
	end

	def test_empty_insert_returns_leaf
		empty = EmptyNode.new
		expected = LeafNode.new :a
		result = empty.insert :a
		assert_equal expected, result
	end

	def test_leaf_insert_returns_link
		leaf = LeafNode.new -2
		expected = LinkNode.new(-2, LeafNode.new([]))
		result = leaf.insert []
		assert_equal expected, result
	end
end