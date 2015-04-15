require_relative 'linked_list_item'

class LinkedList
	attr_reader :size
	attr_accessor :last
	attr_reader :ll

	def initialize
		@size = 0
		@last
		#@ll = LinkedList.new
	end

	def push(data)
		if @first_item.nil?
			@first_item = LinkedListItem.new(data)
			@last_item = @first_item
		else
			@last_item.next_item = LinkedListItem.new(data)
			@last_item = @last_item.next_item
			@last = @last_item.payload
		end
		@size += 1
	end

	def get(index)
		raise IndexError if index < 0 || index > @size

		if index == 0
			@first_item.payload
		else
			count = 0
			current_node = @first_item
			while count < index
				current_node = current_node.next_item
				count += 1
			end
			current_node.payload
		end
	end

	def to_s
		if ll.nil?
			"| |"
		else
			#\| { ll } |\"
		end
	end
end
