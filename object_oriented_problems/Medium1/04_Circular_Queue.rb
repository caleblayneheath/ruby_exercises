#
class CircularQueue
  def initialize(size)
    @buffer = Array.new(size)
    @indexes = (0...size).to_a
    @active_index = indexes.first
  end

  def dequeue
    return nil if queue_empty?

    update_active_index while current_element.nil?

    return_object = current_element
    self.current_element = nil

    loop do
      update_active_index
      break if current_element.nil?
    end

    return_object
  end

  def enqueue(object)
    self.current_element = object
    update_active_index
  end

  def to_s
    buffer.to_s
  end

  private

  attr_reader :buffer, :indexes
  attr_accessor :active_index

  def queue_empty?
    buffer.all?(&:nil?)
  end

  def update_active_index
    indexes.rotate!
    self.active_index = indexes.first
  end

  def current_element
    buffer[active_index]
  end

  def current_element=(object)
    buffer[active_index] = object
  end
end

# class CircularQueue
#   def initialize(size)
#     @max_size = size
#     @buffer = []
#   end

#   def enqueue(object)
#     buffer.push(object)
#     dequeue if buffer.size > max_size
#   end

#   def dequeue
#     buffer.shift
#   end

#   private 
  
#   attr_reader :buffer, :max_size
# end

queue = CircularQueue.new(3)
puts queue.dequeue.nil?

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)

puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue.nil?

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue.nil?
