class DNA
  attr_reader :sequence

  def initialize(sequence)
    @sequence = sequence
  end

  # def hamming_distance(strand_2)
  #   strand_1 = @sequence[0, strand_2.length]

  #   strand_1.chars.zip(strand_2.chars).count { |pair| pair.first != pair.last }
  # end

  def hamming_distance(other_sequence)
=begin
input: string representing gene sequence
output: integer repping hamming distance

hamming distance, the number of differences found between
identical points compared across two sequences
ex ABA & AAA have a hamming distance of 1

hamming distance is only concerned with shorter length

set hamming distance to zero
determine length of shortest sequence
use length to create range of indices to iterate over
iterate over valid indices
    compare sequence and othersequence
    if unequal, increment hamming distance
return hamming distance
=end
    hamming = 0
    min = [sequence.length, other_sequence.length].min
    0.upto(min - 1) do |index|
      hamming += 1 unless sequence[index] == other_sequence[index]
    end
    hamming
  end

end