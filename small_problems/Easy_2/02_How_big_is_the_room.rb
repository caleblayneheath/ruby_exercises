SQUARE_METERS_TO_FEET = 10.7639
INCHES_TO_CENTIMETERS = 2.54
puts 'Please enter the length of the room in meters:'
length_meters = gets.chomp.to_f

puts 'Please enter the width of the room in meters:'
width_meters = gets.chomp.to_f

area = length_meters * width_meters

puts "The area of the room is #{area} square meters."
puts "(Or #{format('%.2f', area * SQUARE_METERS_TO_FEET)} square feet.)"

puts
puts '---------------------------------------------'
puts

puts 'Please enter the length of the room in feet:'
length_feet = gets.chomp.to_f

puts 'Please enter the width of the room in feet:'
width_feet = gets.chomp.to_f

area = length_feet * width_feet

puts "The area of the room is #{area} square feet."
puts "(Or #{area * 144} square inches.)"
puts "(Or #{area * 144 * INCHES_TO_CENTIMETERS**2} square centimeters.)"

