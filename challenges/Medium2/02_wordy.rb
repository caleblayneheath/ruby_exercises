# this version takes advantage of a strange way
#   ruby parses numeric expressions

# class WordProblem
#   # takes string representing word problem
#   # eg. what is 53 + 2
#   # need to tokenize string
#   # somehow search through string looking for numbers and operations
#   # idea: create sometype of buffer, number operation number
#   #   when buffer is full perform operaton and store result in first slot
#   # alternative: strip away everything but numbers and operations,
#   #   store result in array, walk through array storing operations  
#   def initialize(string)
#     numbers_operations_regex = /-?\d+|plus|minus|multiplied|divided/
#     @tokens = string.scan(numbers_operations_regex)
#     raise ArgumentError unless @tokens.size > 2
#   end

#   # provide answer to computation described in string
#   # should raise ArgumentError if either
#   #   string contains no numbers
#   #   string does not contain added, subtracted, etc
#   def answer
#     operations = { 'plus' => '.+', 'minus' => '.-', 
#                    'multiplied' => '.*', 'divided' => './' }
#     problem = @tokens.map do |token|
#       operations[token] ? operations[token] : "(#{token})"
#     end.join
#     eval(problem)
#   end
# end

# class WordProblem
#    def initialize(string)
#     numbers_operations_regex = /-?\d+|plus|minus|multiplied|divided/
#     @tokens = string.scan(numbers_operations_regex)
#     raise ArgumentError unless @tokens.size >= 3
#   end

#    def answer
#     operations = { 'plus' => '+', 'minus' => '-', 
#                    'multiplied' => '*', 'divided' => '/' }
#     tokens = @tokens[1..-1].clone
    
#     accum = @tokens.first
#     until tokens.empty?
#       buffer = [accum, operations[tokens.shift], tokens.shift]
#       accum = eval(buffer.join).to_s
#     end
#     accum.to_i
#   end
# end

class WordProblem
  OPERATIONS = { 'plus' => '+', 'minus' => '-',
                 'multiplied' => '*', 'divided' => '/' }.freeze

  def initialize(string)
    @numbers = string.scan(/-?\d+/).map(&:to_i)
    @operators = string.scan(/plus|minus|multiplied|divided/)
    raise ArgumentError if invalid?
  end

  def invalid?
    @numbers.empty? || @operators.empty? ||
      (@numbers.size != (@operators.size + 1))
  end

  def answer
    # numbers = @numbers.clone.map(&:to_i)
    # operators = @operators.map { |ops| OPERATIONS[ops] }

    # accum = numbers.shift
    # accum = accum.send(operators.shift, numbers.shift) until numbers.empty?
    # accum

    numbers = @numbers[1..-1]
    operators = @operators.map { |ops| OPERATIONS[ops] }
    numbers.each_with_index.reduce(@numbers.first) do |total, (num, idx)|
      total.send(operators[idx], num)
    end
  end
end
