def reverse_sentence(sentence)
  words = sentence.split(' ')
  reversed_words = []

  reversed_words << words.pop until words.empty?

  reversed_words.join(' ')
end

=begin
The problem is that on line 7, we are attempting to add words[i], which is a string object element in an array
to an array. The + method invoked by the string objects accessed by words[i] cannot take an array as an argument.



=end

p reverse_sentence('how are you doing') # expected output: 'doing you are how'