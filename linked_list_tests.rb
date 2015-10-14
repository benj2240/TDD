require 'test/unit'
require_relative 'linked_list.rb'

class LinkedListTests < Test::Unit::TestCase
	def test_empty_list_to_a
		list = LinkedList.new
		assert_equal [], list.to_a
	end

	def test_emptied_list_to_a
		list = LinkedList.new [:delete]
		list.delete :delete
		assert_equal [], list.to_a
	end

	def test_single_element_to_a
		list = LinkedList.new
		list.insert "f"
		assert_equal ["f"], list.to_a
	end

	def test_linked_list_to_a
		list = LinkedList.new [1,2,3]
		expected = [1,2,3]
		result = list.to_a
		assert_equal expected, result
	end

	def test_link_insert_returns_self
		orig = Node.new 3, EmptyNode.instance
		newb = orig.insert 1

		# essentially pointer comparison
		assert orig.equal?(newb)
	end

	def test_full_list_insert
		list = LinkedList.new [1,2,3]
		list.insert 4
		expected = [1,2,3,4]
		result = list.to_a
		assert_equal expected, result
	end

	def test_list_get_index_too_large
		list = LinkedList.new [0,1,2]
		assert_raise RuntimeError do
			list.get 5
		end
	end

	def test_empty_list_get_negative_index
		list = LinkedList.new
		assert_raise ArgumentError do
			list.get -1
		end
	end

	def test_full_list_get_negative_index
		list = LinkedList.new [1,2,3]
		assert_raise ArgumentError do
			list.get -1
		end
	end

	def test_linked_list_get_middle_element
		list = LinkedList.new
		list.insert :zero
		list.insert :one
		list.insert :two
		result = list.get 1
		assert_equal :one, result
	end

	def test_delete_item_not_in_list
		list = LinkedList.new [1,2,3,4]
		assert_raise RuntimeError do
			list.delete 5
		end
	end

	def test_delete_from_end_of_list
		list = LinkedList.new [1,2,3,4]
		list.delete 4
		assert_equal [1,2,3], list.to_a
	end

	def test_delete_from_middle_of_list
		list = LinkedList.new [1,2,3]
		list.delete 2
		assert_equal [1,3], list.to_a
	end

	def test_delete_from_start_of_list
		list = LinkedList.new [1,2,3]
		list.delete 1
		assert_equal [2,3], list.to_a
	end
end