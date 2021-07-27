=begin
ciricular buffer starts empty and has predefiend length

elements are added to buffer
when the buffer is read or an element removed, it is the oldest
  element, the one added longest ago

a full buffer returns an error if a write  is attempted
a forced overwrite of a full buffer effectively removes
  the oldest element of the buffer then adds the newest element to end

so this is best represented with a queue

 [oldest, older, old, young, younger, youngest]
=end

class CircularBuffer
  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end

  attr_reader :buffer, :max_size

  def initialize(max_size)
    @buffer = []
    @max_size = max_size
  end

  def read
    raise BufferEmptyException if buffer.empty?

    buffer.shift
  end

  def write(value)
    return if value.nil?

    raise BufferFullException if buffer.size >= max_size

    buffer.push(value)
  end

  def write!(value)
    return if value.nil?

    buffer.push(value)

    buffer.shift if buffer.size > max_size
  end

  def clear
    @buffer = []
  end
end
