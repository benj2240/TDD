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

	def test_link_insert_returns_self
		leaf = LeafNode.new 3
		original_link = leaf.insert 2
		new_link = original_link.insert 1

		# essentially pointer comparison
		assert original_link.equal?(new_link)
	end

	def test_initialize_linked_list
		list = LinkedList.new
	end
end