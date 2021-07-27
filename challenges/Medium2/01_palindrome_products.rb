# palindromic numbers read the same backwards and forwards
# naive approach, compare string and reversed string of numbers
# 
# largest palindromic number from product of 2 digit numbers
# is 9009 = 91 * 99


# refactored based on answer #1
# is certainly more elegant to use a hash,
# but I think my original approach of sorting the palindrome array
# by max product size is about the same speed, maybe a bit faster

class Palindromes
  def initialize(min_factor: 1, max_factor: nil)
    @min_factor = min_factor
    @max_factor = max_factor
    @palindromes = Hash.new { |hash, key| hash[key] = [] }
  end

  def palindromic?(number)
    number.to_s == number.to_s.reverse
  end

  def generate
    # pairs = []

    # this is actually faster than repeated_combination
    # (@min_factor..@max_factor).each do |min|
    #   (min..@max_factor).each do |max|
    #     pairs << [min, max] if palindromic?(min * max)
    #   end
    # end
    # @palindrome_pairs = pairs.sort_by! do |num1, num2|
    #   num1 * num2
    # end

    (@min_factor..@max_factor).each do |min|
      (min..@max_factor).each do |max|
        @palindromes[max * min] << [min, max] if palindromic?(min * max)
      end
    end
  end

  def largest
    # max_value = @palindrome_pairs.last.reduce(:*)
    max_value = @palindromes.keys.max
    create_palindrome(max_value)
  end

  # returns smallest pair that makes a palindromic number
  def smallest
    # min_value = @palindrome_pairs.first.reduce(:*)
    min_value = @palindromes.keys.min
    create_palindrome(min_value)
  end

  private

  def create_palindrome(value)
    # pairs = @palindrome_pairs.select do |pair|
    #   pair.reduce(:*) == value
    # end
    # Struct.new(:factors, :value).new(pairs, value)

    Struct.new(:factors, :value).new(@palindromes[value], value)
  end
end
