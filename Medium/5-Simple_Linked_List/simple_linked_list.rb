class Element
  attr_reader :value, :next_val
  def initialize(value=nil, next_val=nil)
    @value = value
    @next_val = next_val
  end

  def datum
    value
  end

  def tail?
    next_val.nil?
  end

  def next
    next_val
  end
end

class SimpleLinkedList
  attr_accessor :head

  def size
    size = 0
    
    element = head
    while element != nil
      size += 1
      element = element.next
    end
    size
  end

  def empty?
    head.nil?
  end

  def push(value)
    element = Element.new(value, head)
    self.head = element
  end

  def pop
    value = peek
    self.head = head.next
    value
  end

  def peek
    head.datum if head
  end

  def self.from_a(array)
    list = new
    return list unless array.is_a? Array
 
    array.reverse.each do |value|
      list.push(value)
    end
    list
  end

  def to_a
    array = []
    element = head
    while element != nil
      array << element.datum
      element = element.next
    end
    array
  end

  def reverse
    reversed_list = SimpleLinkedList.new
    element = head
    while element != nil
      reversed_list.push(element.datum)
      element = element.next
    end
    reversed_list
  end
end

