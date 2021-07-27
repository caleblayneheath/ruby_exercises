class BeerSong
  BEER_VERSE = "START_BOTTLES of beer on the wall, START_BOTTLES of beer.\n" \
  "Take one down and pass it around, END_BOTTLES of beer on the wall.\n"
  
  LAST_VERSE = "1 bottle of beer on the wall, 1 bottle of beer.\n" \
  "Take it down and pass it around, no more bottles of beer on the wall.\n"

  REPRISE_VERSE = "No more bottles of beer on the wall, no more bottles of beer.\n" \
  "Go to the store and buy some more, 99 bottles of beer on the wall.\n"

  def verse(number)
    if number == 1
      LAST_VERSE
    elsif number == 0
      REPRISE_VERSE
    else
      base_verse(number)
    end
  end

  def verses(start_verse, end_verse)
    (end_verse..start_verse).map do |number| 
      verse(number)
    end.reverse.join("\n")
  end

  def base_verse(number)
    BEER_VERSE.gsub('START_BOTTLES', bottle_phrase(number))
              .gsub('END_BOTTLES', bottle_phrase(number - 1))
  end

  def bottle_phrase(number)
    str = "#{number} bottle#{'s' if number > 1}"
  end

  def lyrics
    verses(99, 0)
  end
end