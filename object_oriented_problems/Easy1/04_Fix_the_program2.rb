class Book
  attr_accessor :title, :author
  
  def to_s
    %("#{title}", by #{author})
  end
end

book = Book.new
book.author = "Neil Stephenson"
book.title = "Snow Crash"
puts %(The author of "#{book.title}" is #{book.author}.) # The author of "Snow Crash" is Neil Stephenson.
puts %(book = #{book}.) # book = "Snow Crash", by Neil Stephenson.