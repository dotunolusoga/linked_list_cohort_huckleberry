
#!/usr/bin/env ruby

require_relative 'lib/linked_list'

payloads = ARGV # ARGV holds the command line arguments that were passed in

# Now, build a LinkedList
ll = LinkedList.new

arrow = "* -> "
pointer = " -> "
ender = " -> nil"

if payloads.size > 0
	 item = payloads.map { |payloads| payloads.inspect }
	 print arrow + item.join(pointer) + ender
else
	 print "* -> nil"
end


# And, populate it
#
# <YOUR CODE GOES HERE>


# Then, print it out
#
#print arrow + payloads.to_s