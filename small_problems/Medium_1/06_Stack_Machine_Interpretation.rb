require 'pry-byebug'

COMMANDS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

def minilang(command)
  stack = []
  register = 0
  instructions = command.split

  instructions.each do |method|
    validate_input(method)
    case 
    when is_int?(method)
      register = lang_n(method)
    when method == 'PUSH'
      lang_push(stack, register)
    when method == 'ADD'
      register = lang_add(stack, register)
    when method == 'SUB'
      register = lang_subtract(stack, register)
    when method == 'MULT'
      register = lang_multi(stack, register)
    when method == 'DIV'
      register = lang_div(stack, register)
    when method == 'MOD'
      register = lang_mod(stack, register)
    when method == 'POP'
      register = lang_pop(stack)
    when method == 'PRINT'
      lang_print(register)
    end
  end
  nil
end

# not perfect, would allow 3.-8 as valid number
def is_int?(string)
  # !string.match?(/[^0-9+-.]/)
  string.to_i.to_s == string
end

def validate_input(string)
  return if valid_command?(string)
  if is_int?(string)
    return
  else
    puts "INVALID TOKEN : #{string}"
    exit
  end
end

# def verify_num(string)
#   if !is_int?(string) && !valid_command?(string)
#     p 'INVALID NUMBER ENTRY'
#     exit(-2)
#   end
# end

def valid_command?(string)
  COMMANDS.include?(string)
end

def verify_stack(stack)
  if stack.empty?
    p ('ERROR - EMPTY STACK')
    exit(-1) #('ERROR. STACK EMPTY')
  end
end

def lang_n(input)
  input.to_i
end

def lang_push(stack, register)
  stack.push(register)
end

def lang_print(register)
  puts register
end

def lang_add(stack, register)
  verify_stack(stack)
  stack.pop + register
end

def lang_subtract(stack, register)
  verify_stack(stack)
  register - stack.pop
end

def lang_pop(stack)
  verify_stack(stack)
  stack.pop
end

def lang_multi(stack, register)
  verify_stack(stack)
  stack.pop * register
end

def lang_div(stack, register)
  verify_stack(stack)
  register / stack.pop
end

def lang_mod(stack, register)
  verify_stack(stack)
  register % stack.pop
end

minilang('4 PUSH 5 MULT PUSH 3 ADD PUSH -7 ADD PRINT')
minilang('3 PUSH 5 MOD PRINT')

minilang('3 PUSH 5 MOD PUSH 4 PUSH 5 MULT PUSH 3 ADD PUSH -7 ADD DIV PRINT')





