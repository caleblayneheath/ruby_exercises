def print_in_box(string)
  results = []
  loop do
    results << string.slice!(0..75)
    break if string.length <= 0
  end

  text_width = results.first.length  

  print_top_bottom(text_width)
  print_blank(text_width)
  results.each { |line| print_box_message(line) }
  print_blank(text_width)
  print_top_bottom(text_width)
end

def print_blank(width)
  puts '|' + ' ' * (width + 2) + '|' 
end

def print_top_bottom(width)
  puts '+' + '-' * (width + 2) + '+'
end

def print_box_message(string)
  puts '| ' + string + ' |'
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')
print_in_box('To boldly go where no one has gone before.To boldly go where no one has gone before.To boldly go where no one has gone before.')

