require 'set'
require 'pry-byebug'

class String
  def numeric?
    Float(self) != nil rescue false
  end
end

class MinilangError < StandardError; end
class BadTokenError < MinilangError; end
class EmptyStackError < MinilangError; end

class Minilang
  VALID_OPERATIONS = Set.new(%w(PUSH ADD SUB MULT DIV MOD POP PRINT))
  
  attr_reader :instructions, :register, :stack
  
  def initialize(input_string)
    @instructions = input_string
  end

  def eval(hash)
    @register = 0
    @stack = []
    # binding.pry
    format(instructions, hash).split.each { |token| eval_token(token) }
  rescue MinilangError => error
    puts error.message
  end

  private

  def eval_token(token)
    if token.numeric?
      @register = token.to_i 
    elsif VALID_OPERATIONS.include?(token)
      send(token.downcase)
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def push
    stack.push(register)
  end

  def add
    @register += remove_value_at_top_of_stack
  end

  def sub
    @register -= remove_value_at_top_of_stack
  end

  def mult
    @register *= remove_value_at_top_of_stack
  end

  def div
    @register /= remove_value_at_top_of_stack
  end

  def mod
    @register %= remove_value_at_top_of_stack
  end

  def pop
    @register = remove_value_at_top_of_stack
  end

  def remove_value_at_top_of_stack
    raise EmptyStackError, 'Empty stack!' if stack.empty?
    stack.pop
  end

  def print
    puts register
  end
end

# CENTIGRADE_TO_FAHRENHEIT =
#   '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
# minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
# minilang.eval(degrees_c: 100)
# # 212
# minilang.eval(degrees_c: 0)
# # 32
# minilang.eval(degrees_c: -40)
# # -40

# FAHRENHEIT_TO_CENTIGRADE =
#   '9 PUSH 32 PUSH %<degrees_f>d SUB PUSH 5 MULT DIV PRINT'
# minilang = Minilang.new(FAHRENHEIT_TO_CENTIGRADE)
# minilang.eval(degrees_f: 212) # 100
# minilang.eval(degrees_f: 32) # 0
# minilang.eval(degrees_f: -40) # -40

MILES_TO_KILOMETERS = '3 PUSH %<miles>d PUSH 5 MULT DIV PRINT'
minilang = Minilang.new(MILES_TO_KILOMETERS)
minilang.eval(miles: 30) # 50

RECTANGLE_AREA = '%<length>d PUSH %<width>d MULT PRINT'
minilang = Minilang.new(RECTANGLE_AREA)
minilang.eval(width: 5, length: 3)