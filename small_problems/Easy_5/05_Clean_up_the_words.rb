def cleanup(string)
  string.gsub(/[^a-zA-Z]+/ , ' ')
end

p cleanup("---what's my +*& line?") == ' what s my line '
