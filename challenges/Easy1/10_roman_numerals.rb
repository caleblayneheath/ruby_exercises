class Fixnum
  ROMAN_NUMERALS = {
    'M' => 1000,
    'CM' => 900, 
    'D' => 500,
    'CD' => 400,
    'C' => 100, 
    'XC' => 90,
    'L' => 50,
    'XL'=> 40,
    'X' => 10,
    'IX' => 9, 
    'V' => 5,
    'IV' => 4,
    'I' => 1
  }
  
  def to_roman
    result = ''
    number = self
    ROMAN_NUMERALS.each do |roman, decimal|
      quotient, remainder = number.divmod(decimal)
      quotient.times{ result << roman }
      number = remainder
    end
    result
  end
end

# class Fixnum
#   def to_roman
#     number = self
#     roman_numerals = {1000 => 'M', 500 => 'D', 100 => 'C',
#     50 => 'L', 10 => 'X', 5 => 'V', 1 => 'I'}

#     results = []
#     roman_numerals.keys.each_with_index do |divisor, idx|  
#       quotient = number/divisor
#       if quotient == 0
#         next
#       # elsif quotient == 4 || quotient == 9
#       #   results << roman_numerals[divisor]
#       #   results << roman_numerals[roman_numerals.keys[idx-1]]
#       else
#         quotient.times { results << roman_numerals[divisor] }
#       end
#       number = number - ((quotient) * divisor)
#     end
#     string = results.join
#     string.gsub('IIII', 'IV')
#           .gsub('XXXX', 'XL')
#           .gsub('LXXXX', 'XC')
#           .gsub('CCCC', 'CD')
#   end
# end