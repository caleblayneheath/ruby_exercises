class Crypto
  attr_reader :string, :size

  def initialize(string)
    @string = string
    @normalized_plaintext = string.downcase.gsub(/[^a-z0-9]/, '')
    @size = Math.sqrt(normalize_plaintext.size).ceil
  end

  def normalize_plaintext
    @normalized_plaintext
  end

  def plaintext_segments
    text = normalize_plaintext
    segments = []
    segments << text.slice!(0, size) until text.empty?
    segments
  end

  def ciphertext
    normalize_ciphertext.delete(' ')
  end

  def normalize_ciphertext
    text = plaintext_segments
    message = ''
    (0...size).each do |idx|
      text.each do |row|
        message << row[idx] if row[idx]
      end
      message << ' '
    end
    message.chop
  end
end
