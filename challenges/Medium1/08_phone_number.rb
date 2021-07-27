class PhoneNumber
  attr_reader :number

  def initialize(number_string)
    @number = parse_number(number_string)
  end

  def area_code
    @number[0, 3]
  end

  def prefix
    @number[3, 3]
  end

  def line
    @number[6, 4]
  end

  def to_s
    "(#{area_code}) #{prefix}-#{line}"
  end

  private

  def parse_number(number_string)
    # remove all non digits from string
    # check length
    # if length 10 OR 11 and start with 1 OR have letters
    #   proceed, number is valid (trim 1 if 11)
    # else
    #   number is 0000000000
    number_string.gsub!(/[^0-9a-z]/i, '')
    number_string = '0' * 10 unless good_number?(number_string)
    number_string[-10..-1]
  end

  def good_number?(number_string)
    return false if number_string =~ /[^0-9]/

    number_string.size == 10 ||
      (number_string.size == 11 && number_string[0] == '1')
  end
end
