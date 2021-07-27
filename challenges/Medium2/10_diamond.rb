class Diamond
  def self.make_diamond(last_letter)
    letters = ('A'..last_letter).to_a + ('A'...last_letter).to_a.reverse

    letters.map { |letter| create_lines(letter, last_letter) }.join
  end

  class << self
    private

    def create_lines(current_letter, last_letter)
      last_letter_position = last_letter.ord - 'A'.ord
      line = ' ' * (last_letter_position + 1)
      line[last_letter.ord - current_letter.ord] = current_letter
      line + line.slice(0, last_letter_position).reverse + "\n"
    end
  end
end
