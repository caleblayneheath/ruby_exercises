def neutralize(sentence)
  words = sentence.split(' ')
  words.reject { |elem| negative?(elem) }.join(' ')
end

def negative?(word)
  [ 'dull',
    'boring',
    'annoying',
    'chaotic'
  ].include?(word)
end

puts neutralize('These dull boring cards are part of a chaotic board game.')
# Expected: These cards are part of a board game.
# Actual: These boring cards are part of a board game.
=begin
Problem is that elements are being removed from an array while it is being
iterated through. This can produced unexpected behavior.
=end