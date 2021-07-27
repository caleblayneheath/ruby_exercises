
=begin
replace continuous sequences of same char with {number_of_occurances,char}
chars include letters, spaces, unicode emojis,
numbers appear to be excluded
single values have no number
=end

class RunLengthEncoding
  def self.encode(input)
    regex_string = input.chars.uniq.map { |str| "#{str}+" }.join('|')
    input.scan(Regexp.new(regex_string)).map do |substr|
      substr.size > 1 ? [substr.size, substr[0]] : [substr[0]]
    end.flatten.join
  end

  def self.decode(input)
    input.scan(/\d*\D/).map do |cluster|
      count, char = cluster.scan(/(\d*)(\D)/).flatten
      count = 1 if count == ''
      char * count.to_i
    end.join
  end
end
