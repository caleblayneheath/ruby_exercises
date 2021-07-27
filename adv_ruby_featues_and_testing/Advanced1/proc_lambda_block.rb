# Kernal#proc, equivalent to Proc.new, create a proc from a block
my_proc = proc { |thing| puts "This is a #{thing}." } 
# will output string representation of proc object
puts my_proc
# will output Proc
puts my_proc.class
# will output "This is a ." because thing is nil
my_proc.call
# will output "This is a cat." because of the argument used for call.
my_proc.call('cat')
# Proc#call can also be called as proc.() for syntactical sugar

# Lambda is a special kind of proc
# they have the strict arity of methods
# use Kernel#lambda
my_lambda = lambda { |thing| puts "This is a #{thing}." }
# or ambda literal syntas -> (block param)
my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# outputs proc object id, shows line lambda was declared on
puts my_lambda
puts my_second_lambda
# Proc
puts my_lambda.class
# if no args, error produced
my_lambda.('bat')

# takes an arg, does nothing with it, yields to block
def block_method_1(animal)
  yield
end

# output: "This is a ." because seal is nil, nothing is evere passed to shield
block_method_1('seal') { |seal| puts "This is a #{seal}." }
# error because yield is used but there's no block to yield too
# block_method_1('seal')

# yield now takes animal as an argument
def block_method_2(animal)
  yield(animal)
end

# output "This is a turtle."
block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
# output "This is a turtle and ." bc seal will be nil (yield only takes 'turtle')
block_method_2('turtle') { |turtle, seal| puts "This is a #{turtle} and #{seal}." }
# output "This is a ." because no plock parameter to match animal too
# or error because animal undefined local variable
block_method_2('turtle') { puts "This is a #{animal}." }