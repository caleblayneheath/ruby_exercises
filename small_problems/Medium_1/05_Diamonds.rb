require 'pry-byebug'

# def diamond(width)
#   1.step(by: 2, to: width - 1) { |num| puts ('*' * num).center(width) }
#   width.step(by: -2, to: 1) { |num| puts ('*' * num).center(width) }
# end

def hollow_diamond(width)
  blank_line = ' ' * width
  max_distance = (width - 1) / 2
  max_distance.downto(0) do |dist|
    new_line = blank_line.dup
    new_line[dist] = '*'
    new_line[-dist - 1] = '*'
    puts new_line
  end

  1.upto(max_distance) do |dist|
    new_line = blank_line.dup
    new_line[dist] = '*'
    new_line[-dist - 1] = '*'
    puts new_line
  end
end

hollow_diamond(5)