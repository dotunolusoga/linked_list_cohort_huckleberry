require_relative 'linked_list_item'

class LinkedList
	attr_accessor :size, :last, :payload


	def initialize(*payload)
		@size = 0
		@last
		payload.each { |payload| push(payload) }
	end

	def push(payload)
		new_item = LinkedListItem.new(payload)
		if @first_item.nil?
			@first_item = new_item
			@last_item = @first_item
		else
			@last_item.next_item = new_item
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
			return current_node.payload
		end
	end

	#def to_s
		#str = ""
		#if @size == 0
			#{}"| |"
		#elsif @size == 1
			#{}"| #{@first_item.payload} |"
		#else
			#(@size - 1).times do |i|
				#str << "#{get(i)}, "
			#end
				#str << "#{@last_item.payload} "
			#return "| #{str}|"
		#end
	#end

	def to_s
		str = "| "
		current_item = @first_item
		until current_item.nil?
			str << current_item.payload
			punctuation = current_item.last? ? " " : ", "
			str << punctuation
			current_item = current_item.next_item
		end
		str << "|"
		str
	end

	alias [] get

	#def [] (index)
		#get(index)
	#end

	def []=(index, data)
		current_node = @first_item
		index.times do
			current_node = current_node.next_item
		end
		current_node.payload = data
	end

	def delete(index)
		raise IndexError if @first_item.nil? || index < 0
		@size -= 1
		current_node = @first_item
		if index > 0
			(index - 1).times do
				current_node = current_node.next_item
			end
			 current_node.next_item = current_node.next_item.next_item
		elsif index <= 0
			@first_item = current_node.next_item
		end
	end

	def index(data)
			current_item = @first_item
			if @size == 0
				nil
			else
				count = 0
				if current_item.payload == data
					return count
				end
				until current_item.last?
					current_item = current_item.next_item
					count += 1
					if current_item.payload == data
						return count
					end
				end
			end
		end

end

