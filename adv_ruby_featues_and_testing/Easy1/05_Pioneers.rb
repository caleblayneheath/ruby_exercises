def rot13(text)
  text.chars.map do |char|
    if ('a'..'m').include?(char.downcase)
      (char.ord + 13).chr
    elsif ('n'..'z').include?(char.downcase)
      (char.ord - 13).chr
    else
      char
    end
  end.join
end

file_data = File.open('names.txt') {|file| file.readlines}.map(&:chomp)

file_data.each do |name|
  puts rot13(name)
end
