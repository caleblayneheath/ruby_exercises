def get_grade(*scores)
  letter_grade(scores.sum / scores.size)
end

def letter_grade(score)
  score = 100 if score > 100
  case score
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else 'F'
  end
end

p get_grade(95, 90, 93) == "A"
p get_grade(50, 50, 95) == "D"
p get_grade(101, 99, 110) == "A"
