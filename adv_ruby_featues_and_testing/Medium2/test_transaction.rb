require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'transaction.rb'

class TransactionTest < Minitest::Test
  def test_prompt_for_payment
    transaction = Transaction.new(30)

    # input = StringIO.new("-20\n10\n30\n")
    input = StringIO.new('30\n')
    
    # not being used
    output = <<~OUTPUT.chomp
      You owe $30.
      How much are you paying?
      That is not the correct amount. Please make sure to pay the full cost.
      You owe $30.
      How much are you paying?
      That is not the correct amount. Please make sure to pay the full cost.
      You owe $30.
      How much are you paying?

    OUTPUT

    # assert_output(output) { transaction.prompt_for_payment(input: input) }
    out = StringIO.new
    transaction.prompt_for_payment(input: input, output: out)
    assert_equal(30, transaction.amount_paid)

  end
  
end