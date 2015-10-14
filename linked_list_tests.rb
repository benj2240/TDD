require 'test/unit'
require_relative 'linked_list.rb'

class LinkedListTests < Test::Unit::TestCase
	def test_empty_insert_returns_node
		empty = EmptyNode.instance
		expected = Node.new :a, EmptyNode.instance
		result = empty.insert :a
		assert_equal expected, result
	end

	def test_link_insert_returns_self
		leaf = Node.new 3, EmptyNode.instance
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

	def test_single_element_to_a
		list = LinkedList.new
		list.insert "f"
		assert_equal ["f"], list.to_a
	end

	def test_link_node_to_a
		link = Node.new :link, EmptyNode.instance
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

	def test_list_get_index_too_large
		list = LinkedList.new [0,1,2]
		assert_raise RuntimeError do
			list.get 5
		end
	end

	def test_link_node_get_zero
		link = Node.new([{}], Node.new(nil, EmptyNode.instance))
		result = link.get 0
		assert_equal [{}], result
	end

	def test_link_node_get_positive
		link = Node.new([{}], Node.new(nil, EmptyNode.instance))
		result = link.get 1
		assert_equal nil, result
	end

	def test_link_node_get_negative
		link = Node.new([{}], Node.new(nil, EmptyNode.instance))
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

	def test_link_node_delete_match
		leaf = Node.new "wow", EmptyNode.instance
		link = leaf.insert "omg"
		result = link.delete "wow"
		expected = Node.new "omg", EmptyNode.instance
		assert_equal expected, result
	end

	def test_link_node_delete_non_match
		leaf = Node.new "wow", EmptyNode.instance
		link = leaf.insert "omg"
		result = link.delete "omg"
		expected = Node.new "wow", EmptyNode.instance
		assert_equal expected, result
	end

	def test_delete_link_in_chain
		# [1,2,3] - 1 => [1,3]
		link = Node.new 1, EmptyNode.instance
		link = link.insert 2
		link = link.insert 3
		result = link.delete 2

		expected = Node.new 1, EmptyNode.instance
		expected = expected.insert 3

		assert_equal expected, result
	end

	def test_delete_from_list
		list = LinkedList.new [1,2,3,4]
		assert_raise RuntimeError do
			list.delete 5
		end
		assert_equal [1,2,3,4], list.to_a
		list.delete 4
		assert_equal [1,2,3], list.to_a
		list.delete 2
		assert_equal [1,3], list.to_a
	end
end