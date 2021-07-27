=begin
singly linked list
each element has data field and field pointing to next element
used for push-down LIFO stacks (last in is first out)
=end

class Element
  attr_accessor :datum, :next

  def initialize(datum, next_element = nil)
    @datum = datum
    @next = next_element
  end

  # tail is a special node because it points to nil
  def tail?
    @next.nil?
  end
end

class SimpleLinkedList
  attr_reader :size, :head

  def initialize
    @head = nil
    @size = 0
  end

  def pop
    result = @head&.datum
    (@size - 1).negative? ? @size = 0 : @size -= 1
    @head = @head&.next
    result
  end

  def push(datum)
    @head = Element.new(datum, @head)
    @size += 1
  end

  def empty?
    size.zero?
  end

  def peek
    @head&.datum
  end

  def self.from_a(array)
    list = new
    array&.reverse_each { |elem| list.push(elem) }
    list
  end

  def to_a
    array = []
    current_node = @head
    until current_node.nil?
      array << current_node&.datum
      current_node = current_node.next
    end
    array
  end

  def reverse
    SimpleLinkedList.from_a(to_a.reverse)
  end
end
