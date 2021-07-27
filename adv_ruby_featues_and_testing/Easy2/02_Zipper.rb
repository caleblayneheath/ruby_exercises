=begin
input: two arrays of same size
output: array of same size as input, where each elem is
 size two array of 1st vals, 2nd vals, etc

 create empty results arr
 set index to 0
 while index is less than arr1 size
  results << [arr1[idx], arr2[idx]]
return results
=end

def zip(arr1, arr2)
  results = []
  (0...arr1.size).each { |index| results << [arr1[index], arr2[index]] }
  results
end


p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]