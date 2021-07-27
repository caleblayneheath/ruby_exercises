# def triangle(side_length, quadrant = 4)
#   spaces = side_length - 1
#   stars = 1
#   side_length.times do
#     puts "#{' ' * spaces}#{'*' * stars}"
#     spaces -= 1
#     stars += 1
#   end

# end

def triangle(side_length, quadrant = 4)
  spaces = side_length - 1
  stars = 1
  plot = []
  side_length.times do
    plot << ["#{' ' * spaces}#{'*' * stars}".chars]
    spaces -= 1
    stars += 1
  end
  
  case quadrant
  when 1
    plot.each { |line| puts line.join.reverse }
  when 2
    plot.reverse_each { |line| puts line.join.reverse }
  when 3
    plot.reverse_each { |line| puts line.join }
  when 4
    plot.each { |line| puts line.join }
  end
end

# Dylan Jones solution
# def triangle(n, corner)
#   # topleft = :tl, topright = :tr, bottomleft = :bl, bottomright = :br
#   if corner == :tl
#     stars = n
#     n.times { puts ("*" * stars).ljust(n); stars -= 1 }
#   elsif corner == :tr
#     stars = n
#     n.times { puts ("*" * stars).rjust(n); stars -= 1 }
#   elsif corner == :bl
#     stars = 1
#     n.times { puts ("*" * stars).ljust(n); stars += 1 }
#   elsif corner == :br
#     stars = 1
#     n.times { puts ("*" * stars).rjust(n); stars += 1 }
#   end
# end

triangle(5, 1)
puts
triangle(5, 2)
puts
triangle(5, 3)
puts
triangle(5, 4)


