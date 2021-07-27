class Luhn
  def initialize(number)
    @digits = number.to_s.chars.map(&:to_i)
  end

  # input: number
  # output: array of addended digits
  # formula
  #   start from right most digit
  #   every second digit is doubled
  #   if doubled digit > 10, subtract 9
  # 1111 is 2121 [0, 2] even
  # 11111 is 12121 [1, 3] odd
  def addends
    @digits.reverse.map.with_index do |digit, index|
      index.odd? ? luhnify_digit(digit) : digit
    end.reverse
  end

  def luhnify_digit(number)
    number *= 2
    number > 10 ? number - 9 : number
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  # more elegant
  def self.create(number)
    new_digit = (10 - Luhn.new(number * 10).checksum) % 10
    (number.to_s + new_digit.to_s).to_i
  end

  # brute force
  # def self.create(number)
  #   result = nil
  #   (0..9).each do |digit|
  #     new_number = (number.to_s + digit.to_s).to_i
  #     if Luhn.new(new_number).valid?
  #       result = new_number
  #       break
  #     end
  #   end
  #   result
  # end
end
