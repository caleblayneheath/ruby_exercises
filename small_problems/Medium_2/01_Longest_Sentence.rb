require 'open-uri'

def split_sentences(string)
  string.split(/(?<=[.!?])/)
  # string.split(/\.|\?|!/)
end

def print_longest_sentence(text)
  sentences = split_sentences(text)
  # longest_sentence = ''

  longest_sentence = sentences.max_by { |sent| sent.split.size }

  # sentences.each do |sent|
  #   if sent.split.size >= longest_sentence.split.size
  #     longest_sentence = sent
  #   end
  # end
  puts longest_sentence.strip
  puts longest_sentence.split.size
end

def split_paragraphs(string)
  # string.split(/(?=[.!?][\n|\r])/)
  string.split(/^\s*$/)

end

def print_longest_paragraph(text)
  paragraphs = split_paragraphs(text)
  longest_paragraph = paragraphs.max_by { |para| para.split.size }
  puts longest_paragraph
  puts longest_paragraph.split.size
end

def print_longest_word(text)
  longest_word = text.split.max_by { |word| word.chars.size }
  
  puts longest_word
  puts longest_word.chars.size
end

# text = File.read('/home/clh/LS_exercises/RB101-109-Small_Problems/Medium_2/01_broke_example.txt')
text = open('https://www.gutenberg.org/cache/epub/84/pg84.txt') #{ |f| f.read }
text = text.read

# print_longest_sentence(text)
# print_longest_paragraph(text)
print_longest_word(text)