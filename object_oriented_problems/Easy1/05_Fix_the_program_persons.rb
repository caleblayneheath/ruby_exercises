class Person
  def first_name=(name)
    @first_name = name.capitalize
  end

  def last_name=(name)
    @last_name = name.capitalize
  end
  
  def initialize(first_name, last_name)
    self.first_name = first_name
    self.last_name = last_name
  end

  def to_s
    "#{@first_name} #{@last_name}"
  end
end

person = Person.new('john', 'doe')
puts person # John Doe

person.first_name = 'jane'
person.last_name = 'smith'
puts person # Jane Smith