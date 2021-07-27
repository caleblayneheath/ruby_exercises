class String
  def numeric?
    Float(self) != nil rescue false
  end
end

class Minilang
  VALID_OPERATIONS = [:add, :sub, :mult, :div, :mod, :push, :pop, :print]
  
  attr_reader :instructions, :register, :stack
  
  def initialize(input_string)
    @instructions = input_string.split
    @register = 0
    @stack = []
  end

  def eval
    # send(instructions.first)
    instructions.each do |step|
      if integer?(step)
        @register = step.to_i 
      else
        if !VALID_OPERATIONS.include?(step.downcase.to_sym)
          raise("Invalid token: #{step}")
        else 
          send(step.downcase)
        end
      end
    end
  end

  private

  def push
    stack.push(register)
  end

  def add
    @register += value_from_top_of_stack
  end

  def sub
    @register -= value_from_top_of_stack
  end

  def mult
    @register *= value_from_top_of_stack
  end

  def div
    @register /= value_from_top_of_stack
  end

  def mod
    @register %= value_from_top_of_stack
  end

  def pop
    @register = value_from_top_of_stack
  end

  def print
    puts register
  end

  def value_from_top_of_stack
    top_of_stack = stack.pop
    raise('Empty stack!') if top_of_stack.nil?
    top_of_stack
  end

  def integer?(string)
    return true if string == '0'
    string.to_i.to_s == string # lazy checking
  end
end

# Minilang.new('PRINT').eval
# # 0

# Minilang.new('5 PUSH 3 MULT PRINT').eval
# # 15

# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# # 5
# # 3
# # 8

# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# # 10
# # 5

# Minilang.new('5 PUSH POP POP PRINT').eval
# # Empty stack!

# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# # Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# # 8

Minilang.new('6 PUSH').eval
# # (nothing printed; no PRINT commands)