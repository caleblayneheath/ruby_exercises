def bubble_sort!(arry)
  last = arry.size - 1
  loop do
    swapped = false
    (0..last).each do |idx|
      if (arry[idx] <=> arry[idx + 1]) == 1
        arry[idx], arry[idx + 1] = arry[idx + 1], arry[idx]
        swapped = true
      end
    end  
    last -= 1
    break unless swapped 
  end
end


p array = [5, 3]
bubble_sort!(array)
p array == [3, 5]

p array = [6, 2, 7, 1, 4]
bubble_sort!(array)
p array == [1, 2, 4, 6, 7]

p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)