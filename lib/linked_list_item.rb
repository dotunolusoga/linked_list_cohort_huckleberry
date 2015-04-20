class LinkedListItem
  include Comparable

  attr_accessor :payload
  attr_reader :next_item

  def initialize(payload)
  	@payload = payload
  end

  def <=> (other)

  	if self.payload.class == other.payload.class
  		return self.payload <=> other.payload
  	end
  	#Option 1: self.payload.class.to_s <=> other.payload.class.to_s
  	if self.payload.is_a? Symbol
  		1
  	elsif self.payload.is_a? Fixnum
  		-1
  	else # I am a String
  		if other.payload.is_a? Symbol
  			-1
  		else
  			1
  		end
  	end
  end

  def === (other)
  	self.equal? other
  end

  def next_item=(lli)
    raise ArgumentError, "cant set self as next item" if self === lli
  	@next_item = lli
  end

  def last?
  	next_item.nil?
  end

end
