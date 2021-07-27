class Cat
  @@total = 0
  def self.total
    puts @@total
  end
  
  COLOR = 'black'
  attr_accessor :name

  def initialize(name='')
    @name = name
    @@total += 1
  end

  def rename(new_name)
    self.name = new_name
  end

  def self.generic_greeting
    puts "Hello! I'm a cat!"
  end

  def personal_greeting
    puts "Hello! I'm #{name}!"
  end

  def greet
    puts "Hello! I'm #{name}, a #{COLOR} cat!"
  end

  def to_s
    "I'm #{name}!"
  end
  
  def identify
    self
  end
end

# kitty = Cat.new('Sophie')
# puts kitty.to_s


class Person
  attr_writer :secret

  def compare_secret(person)
    secret == person.secret
  end

  protected

  attr_reader :secret

end

person1 = Person.new
person1.secret = 'Shh.. this is a secret!'

person2 = Person.new
person2.secret = 'Shh.. this is a different secret!'

puts person1.compare_secret(person2)