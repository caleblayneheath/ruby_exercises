=begin
add/alter no more than 5 lines
=end

class Student
  def initialize(name, year, parking = false)
    @name = name
    @year = year
    @parking = parking
  end
end

class Graduate < Student
  def initialize(name, year, parking = true)
    super
  end
end

class Undergraduate < Student
  def initialize(name, year)
    super
  end
end

p Graduate.new('Bob', 96)
p Undergraduate.new('Rob', 99)