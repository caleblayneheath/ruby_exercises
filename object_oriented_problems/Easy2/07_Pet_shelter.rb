# # MY SOLUTION
# class Pet
#   def initialize(species, name)
#     @species = species
#     @name = name
#   end

#   def to_s
#     "a #{species} named #{name}"
#   end

#   attr_reader :name, :species
# end

# class Shelter
#   def initialize
#     # hash where keys are owners and values are arrays of their pets
#     @adoptions = Hash.new([])
#   end

#   def adopt(owner, pet)
#     adoptions[owner] = adoptions[owner] + [pet]
#     owner.increment_number_of_pets
#   end

#   def print_adoptions
#     adoptions.each do |owner, pets|
#       puts "#{owner.name} has adopted the following pets:"
#       pets.each { |pet| puts pet }
#       puts ''
#     end
#   end
  
#   private

#   attr_accessor :adoptions
# end

# class Owner
#   def initialize(name)
#     @name = name
#     @number_of_pets = 0
#   end

#   def increment_number_of_pets
#     self.number_of_pets = number_of_pets + 1
#   end

#   attr_reader :name, :number_of_pets
  
#   private

#   attr_writer :number_of_pets
# end


class Pet
  attr_reader :name, :species

  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{species} named #{name}"
  end
end

class Owner
  attr_reader :name, :pets
  
  def initialize(name)
    @name = name
    @pets = []
  end

  def add_pet(pet)
    @pets << pet
  end

  def number_of_pets
    pets.size
  end
  
  def print_pets
    puts pets
  end
end

class Shelter < Owner
  def initialize(name)
    super
    @owners = {}
  end

  def adopt(owner, pet)
    owner.add_pet(pet)
    @owners[owner.name] ||= owner
  end

  def print_adoptions
    @owners.each do |name, owner|
      if owner == self
        puts "The #{name} has the following unadopted pets:"
      else
        puts "#{name} has adopted the following pets:"
      end
      owner.print_pets
      puts 
    end
  end
end

asta = Pet.new('dog', 'Asta')

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new('Animal shelter')
shelter.adopt(shelter, asta)

shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."
puts "#{shelter.name} has #{shelter.number_of_pets} unadopted pets."