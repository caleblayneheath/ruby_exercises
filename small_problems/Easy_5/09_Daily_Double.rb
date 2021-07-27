# Matthew Guilliams solution for later reference

# def crunch(str)
#   str.gsub(/(.)\1+/, '\1')
# end

# (.) looks for and captures a single character

# \1 then looks to see if the next character is the same as the captured character. 
# Each time regex captures a characters, it assigns them to a 'capture group'. 
# So, if you had a regex pattern /(.).(.)/ , it would look for 3 characters, 
# and capture the 1st and 3rd character. Running the code 'xyz'.match(/(.).(.)/) 
# would give you 'x' in capture group 1, and 'z' in capture group 2. 
# Capture groups can be used for additional matching in regex patterns 
# by invoking them with a backslash and the capture group number (i.e. \1, \2, etc.). 
# Captured values can also be used as replacements characters, as seen in the string 
# given after the regex pattern.

# + at the end of the regex looks for multiple instances of the character in the capture group


def crunch(string)
  results = ''
  prev_char = ''
  string.each_char do |char|
    results << char unless char == prev_char
    prev_char = char
  end
  results
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''