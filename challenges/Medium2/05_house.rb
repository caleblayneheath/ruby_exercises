class House
  FIRST_WORDS = 'This is '.freeze

  def self.recite
    new.recite
  end

  def recite
    (0...pieces.size).each_with_object([]) do |idx, poem|
      stanza = FIRST_WORDS
      stanza += pieces[idx..-1].map { |elem| elem.join("\n") }.join(' ')
      stanza << '.'
      poem << stanza
    end.reverse.join("\n\n") << "\n"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end
