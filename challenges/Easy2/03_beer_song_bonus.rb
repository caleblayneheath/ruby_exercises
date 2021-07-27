class BeerSong
  def initialize
    @verse_lookup = Hash.new(Verses::DefaultVerse)
    @verse_lookup.merge!({
      0 => Verses::ZeroVerse,
      1 => Verses::OneVerse,
      2 => Verses::TwoVerse
    })
  end
  
  def verse(number)
    @verse_lookup[number].new.verse(number)
  end

  def verses(start_verse, end_verse)
    (end_verse..start_verse).map do |number| 
      verse(number)
    end.reverse.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

module Verses
  class DefaultVerse
    def verse(number)
      "#{number} bottles of beer on the wall, #{number} bottles of beer.\n" \
      "Take one down and pass it around, #{number -1} bottles of beer on the wall.\n"
    end
  end

  class TwoVerse
    def verse(number)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class OneVerse
    def verse(number)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class ZeroVerse
    def verse(number)
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end
end