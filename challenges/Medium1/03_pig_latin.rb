# Rule 1: If a word begins with a vowel sound, 
# add an "ay" sound to the end of the word.
# Rule 2: If a word begins with a consonant sound, 
# move it to the end of the word, and then add an "ay" 
# sound to the end of the word.
# Rule 2 addendum: consonant clusters at beginning 
# of word should be removed together
#   this includes 'qu' at the begginning of a word

=begin
take input string
split string into words
for each word, transform such that
  if word begins with vowel
  (vowels are aeiou, and x or y when it is the first letter 
                                and precedes a consonant)
    append 'ay' to word
  if word begins with one or more consonants, 
  (and this cluster includes 'qu')
    remove consonant cluster from front of word
    append cluster to end of word
    append 'ay' to word
join transformed array and return
=end

class PigLatin
  STARTS_WITH_VOWEL = /^(([aeiou])|([xy][b-df-hj-np-tv-z]+))/i
  STARTS_WITH_CONSONANT_CLUSTERS = /^([b-df-hj-np-tv-z]*(qu))|(^[b-df-hj-np-tv-z]+)/i
  
  def self.translate(string)
    string.split.map { |word| pig_latinize(word) }.join(' ')
  end

  def self.pig_latinize(word)
    if starts_with_vowel_sound?(word)
      word + 'ay'
    else
      word_parts = word.partition(STARTS_WITH_CONSONANT_CLUSTERS)
      word_parts.reject! { |substr| substr.empty? }    
      word_parts.last + word_parts.first + 'ay'
    end
  end

  def self.starts_with_vowel_sound?(word)
    !!(word =~ STARTS_WITH_VOWEL)
  end
end