class Book  
  def initialize(author, title)
    @author = author
    @title = title
  end

  def to_s
    %("#{title}", by #{author})
  end

  attr_reader :title, :author

end

book = Book.new("Neil Stephenson", "Snow Crash")
puts %(The author of "#{book.title}" is #{book.author}.) # The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.) # book = "Snow Crash", by Neil Stephenson.