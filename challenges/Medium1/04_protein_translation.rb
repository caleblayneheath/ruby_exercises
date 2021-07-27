=begin
AUG	Methionine
UUU, UUC	Phenylalanine
UUA, UUG	Leucine
UCU, UCC, UCA, UCG	Serine
UAU, UAC	Tyrosine
UGU, UGC	Cysteine
UGG	Tryptophan
UAA, UAG, UGA	STOP

store info in hash
  protein name => array of sequences
  default value of INVALID PROTEIN ERROR?
=end
class InvalidCodonError < StandardError; end

class Translation
  AMINO_ACIDS = {
    'Methionine' => %w(AUG),
    'Phenylalanine' => %w(UUU UUC),
    'Leucine' => %w(UUA UUG),
    'Serine' => %w(UCU UCC UCA UCG),
    'Tyrosine' => %w(UAU UAC),
    'Cysteine' => %w(UGU UGC),
    'Tryptophan' => %w(UGG),	
    'STOP' => %w(UAA UAG UGA)
  }.freeze
  
  # input: 3 letter string representing codon
  # output: name of the amino acid
  # for each element in reference hash
  #   if codon in values,
  #      return key
  #   else
  #     don't know, error conditions not described
  #     'amino acid not found'?
  def self.of_codon(string)
    AMINO_ACIDS.each do |acid, codons| 
      return acid if codons.include?(string)
    end
    raise InvalidCodonError
  end

  # input: string of letters repping potetial acids
  # output: array of amino acids in order of appropriate codon
  # seperate string into collection of substrings of 3 letters
  #   use string.scan(/.../)
  # create empty results array
  # iterate through substring collection
  #   determine value of of_codon(substring)
  #   if value == STOP
  #     break and stop iterating
  #   elsif valid codon
  #     result << of_codon(substring)
  #   else
  #     raise InvalidCodonError
  # return results array 
  def self.of_rna(string)
    sequences = string.scan(/.../)
    result = []
    sequences.each do |substring|
      acid = of_codon(substring)
      break if acid == 'STOP'

      result << acid
    end
    result
  end
end
