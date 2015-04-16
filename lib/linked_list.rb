require_relative 'linked_list_item'

class LinkedList
	attr_accessor :size
	attr_accessor :last
	attr_accessor :ll

	def initialize
		@size = 0
		@last
	end

	def push(payload)
		if @first_item.nil?
			@first_item = LinkedListItem.new(payload)
			@last_item = @first_item
		else
			@last_item.next_item = LinkedListItem.new(payload)
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
			current_node = @first_item
			index.times do
				current_node = current_node.next_item
			end
			current_node.payload
		end
	end

	def to_s
		str = ""
		if @size == 0
			"| |"
		elsif @size == 1
			"| #{@first_item.payload} |"
		else
			(@size - 1).times do |i|
				str << "#{get(i)}, "
			end
				str << "#{@last_item.payload} "
			return "| #{str}|"
		end
	end
end

