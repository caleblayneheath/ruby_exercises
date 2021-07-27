require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require 'simplecov'
SimpleCov.start

require_relative 'cash_register.rb'
require_relative 'transaction.rb'

class CashRegisterTest < Minitest::Test 
  def test_give_receipt
    register = CashRegister.new(0)
    price = 5
    transaction = Transaction.new(price)

    assert_output("You've paid $#{transaction.item_cost}.\n") do
      register.give_receipt(transaction)
    end
  end
  
  def test_change
    register = CashRegister.new(0)
    price = 5
    money_given = 10
    transaction = Transaction.new(price)
    transaction.amount_paid = money_given

    assert_equal(money_given - price, register.change(transaction))
  end
  
  def test_accept_money
    register = CashRegister.new(0)
    transaction = Transaction.new(5)
    transaction.amount_paid = 5

    prev_amount = register.total_money
    register.accept_money(transaction)
    current_amount = register.total_money

    assert_equal(prev_amount + 5, current_amount)
  end
end