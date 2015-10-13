require 'test/unit'
require_relative 'linked_list.rb'

class LinkedListTests < Test::Unit::TestCase
	def test_initialize_empty_node
		empty = EmptyNode.instance
	end

	def test_initialize_leaf_node
		leaf = LeafNode.new 8
	end

	def test_initialize_link_node
		leaf = LeafNode.new "j"
		link = LinkNode.new "i", leaf
	end

	def test_empty_insert_returns_leaf
		empty = EmptyNode.instance
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

	def test_initialize_empty_linked_list
		list = LinkedList.new
	end

	def test_initialize_full_linked_list
		list = LinkedList.new [:a, :b, :c]
	end

	def test_empty_node_to_a
		empty = EmptyNode.instance
		assert_equal [], empty.to_a
	end

	def test_leaf_node_to_a
		leaf = LeafNode.new "f"
		assert_equal ["f"], leaf.to_a
	end

	def test_link_node_to_a
		link = LeafNode.new :link
		link = link.insert :leaf
		expected = [:link, :leaf]
		result = link.to_a
		assert_equal expected, result
	end

	def test_linked_list_to_a
		list = LinkedList.new [1,2,3]
		expected = [1,2,3]
		result = list.to_a
		assert_equal expected, result
	end

	def test_linked_list_insert
		list = LinkedList.new [1,2,3]
		list.insert 4
		expected = [1,2,3,4]
		result = list.to_a
		assert_equal expected, result
	end

	def test_empty_node_get
		empty = EmptyNode.instance
		assert_raise RuntimeError do
			empty.get 0
		end
	end

	def test_leaf_node_get_zero
		leaf = LeafNode.new "value"
		result = leaf.get 0
		assert_equal "value", result
	end

	def test_leaf_node_get_non_zero
		leaf = LeafNode.new EmptyNode.instance
		assert_raise RuntimeError do
			leaf.get 5
		end
	end

	def test_link_node_get_zero
		link = LinkNode.new([{}], LeafNode.new(nil))
		result = link.get 0
		assert_equal [{}], result
	end

	def test_link_node_get_positive
		link = LinkNode.new([{}], LeafNode.new(nil))
		result = link.get 1
		assert_equal nil, result
	end

	def test_link_node_get_negative
		link = LinkNode.new([{}], LeafNode.new(nil))
		assert_raise ArgumentError do
			link.get -1
		end
	end

	def test_linked_list_get
		list = LinkedList.new
		list.insert :zero
		list.insert :one
		list.insert :two
		result = list.get 1
		assert_equal :one, result
	end

	def test_empty_node_delete
		empty = EmptyNode.instance
		assert_raise RuntimeError do
			empty.delete "wow"
		end
	end

	def test_leaf_node_delete_match
		leaf = LeafNode.new "wow"
		result = leaf.delete "wow"
		expected = EmptyNode.instance
		assert_equal expected, result
	end

	def test_leaf_node_delete_non_match
		leaf = LeafNode.new "wow"
		result = leaf.delete "omg"
		expected = leaf
		assert_equal expected, result
	end
end