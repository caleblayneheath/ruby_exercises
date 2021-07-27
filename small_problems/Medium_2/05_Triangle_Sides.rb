def triangle(s1, s2, s3)
  triangle = [s1, s2, s3].sort
  if valid_triangle?(triangle)
    return any_sides_same?(triangle) ? equilateral_or_isosceles(triangle) : :scalene
  else
    return :invalid
  end
end

def valid_triangle?(triangle)
  triangle.include?(0) || triangle[0..1].sum < triangle.last ? false : true
end

def any_sides_same?(triangle)
  triangle.size > triangle.uniq.size
end

def equilateral_or_isosceles(triangle)
  triangle.uniq.size == 1 ? :equilateral : :isosceles
end

def all_sides_same?(triangle)
  triangle.uniq.size == 1
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid