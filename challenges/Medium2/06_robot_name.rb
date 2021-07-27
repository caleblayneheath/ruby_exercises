class Robot
  attr_reader :name
  @@used_names = []

  def initialize
    reset
  end  

  def reset
    @@used_names.delete(name) if name
    loop do
      @name = generate_name
      break unless name_used?
    end
    @@used_names << name
  end

  def self.used_names
    @@used_names  
  end

  private

  def name_used?
    self.class.used_names.include?(name)
  end

  def generate_name
    str = ''
    2.times { str << random_letter }
    3.times { str << random_digit }
    str
  end

  def random_letter
    ('A'..'Z').to_a.sample
  end

  def random_digit
    ('0'..'9').to_a.sample
  end
end
