require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'text.rb'

# class TextTest < Minitest::Test
#   def setup
#     @file = File.open('sample_text.txt', 'r')
#   end

#   def test_swap
#     example = Text.new(@file.read)
#     output = <<~OUTPUT.chomp
#     Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
#     Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
#     quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
#     nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
#     dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
#     et verius meuris, et pheretre mi.
#     OUTPUT
#     first, second = 'a', 'e'
#     assert_equal(output, example.swap(first, second))
#   end

#   def teardown
#     @file.close
#   end
# end

class TextTest < Minitest::Test
  def setup
    @contents = File.open('sample_text.txt'){ |file| file.readlines }.join
    @example = Text.new(@contents)
  end

  def test_swap
    first, second = 'a', 'e'
    assert_equal(@contents.gsub(first, second), @example.swap(first, second))
  end

  def test_word_count
    assert_equal(72, @example.word_count)
  end
end