class SecretHandshake
  HANDSHAKE = {
    '1' => 'wink', # 1
    '10' => 'double blink', # 2
    '100' => 'close your eyes', # 4
    '1000' => 'jump', # 8
    '10000' => 'reverse' # 16
  }.freeze

  # takes either binary string or decimal int
  # invalid binary is value 0, or no command
  # define invalid binary? (string only has 1s and 0s)
  # how should number be stored?
  #   either as string or as decimal or both
  # CHOOSE store everything as a decimal
  def initialize(number)
    @binary = binarize(number)
  end

  def binarize(number)
    number = 0 if number.is_a?(String) && number =~ /[^01]/
    number.to_i.to_s(2)
  end
  # returns an array of commands based on the values
  # reverse order of return if binary value 10000 or greater

  # split digits of binary string into array,
  #   so 11001 would be [10000, 1000, 0, 0, 1] or exclude 0 values
  #   then map over array, transforming elem into instruction by lookup table
  #   so ['reverse', 'jump', nil, nil, 'wink']
  #   then eliminate any nils
  #   then see if 'reverse' in array
  #     if so, reverse the array
  #   delete all instances of 'reverse'
  # return array

  def commands
    digits = split_digits
    list = digits.map do |digit|
      HANDSHAKE[digit]
    end
    list.reverse! unless list.include?('reverse')
    list.delete('reverse')
    list
  end

  # input: binary string
  # output: array of digits, such that
  #   11001 would be [10000, 1000, 0, 0, 1] or exclude 0 values
  #   for each char in binarystring, transform such that
  #     (digit.to_i * (10 ** (number_of_chars - index))).to_s
  def split_digits
    result = @binary.chars.map.with_index do |digit, index|
      (digit.to_i * (10**(@binary.size - 1 - index))).to_s
    end
    result.delete('0')
    result
  end
end
