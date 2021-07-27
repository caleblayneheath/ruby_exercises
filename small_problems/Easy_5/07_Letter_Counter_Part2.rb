def word_sizes(string)
  size_count = Hash.new(0)
  string.split.each { |word| size_count[word.gsub(/[^a-zA-Z]+/, '').length] += 1 }
  size_count
end

p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
p word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
p word_sizes('') == {}