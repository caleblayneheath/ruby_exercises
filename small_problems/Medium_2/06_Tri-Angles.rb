def triangle(a1, a2, a3)
  angles = [a1, a2, a3]

  if all_angles_valid?(angles)
    case
    when angles.all? { |angle| angle < 90 }
      return :acute
    when angles.count(90) == 1
      return :right
    when angles.max > 90
      return :obtuse
    end
  else
    return :invalid
  end
end

def all_angles_valid?(angles)
  angles.sum == 180 && angles.all? { |angle| angle > 0 }
end

p triangle(60, 70, 50) == :acute
p triangle(30, 90, 60) == :right
p triangle(120, 50, 10) == :obtuse
p triangle(0, 90, 90) == :invalid
p triangle(50, 50, 50) == :invalid