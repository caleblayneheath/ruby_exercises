=begin
add students name sto roster for a grade
get list of all students in a grade
get sorted list of students in all grades (1, 2, 3, and alpha)
students have only one name
=end

class School
  attr_reader :school
  
  def initialize
    @school = Hash.new { |school, grade| school[grade] = [] }
  end
  
  def add(name, grade)
    school[grade] << name
  end

  def grade(number)
    school[number]
  end

  # output, hash where the keys have been sorted, 
  # then the values have been sorted
  #
  def to_h
    # my solution
    # sorted_school = {}
    # school.keys.sort.each do |grade|
    #   sorted_school[grade] = school[grade].sort
    # end
    # @school = sorted_school
    
    # clever launch school way
    # school.sort.map { |grade, roster| [grade, roster.sort] }.to_h

    # also clever, but you must also sort the roster when adding
    # school.sort.to_h
  end
end