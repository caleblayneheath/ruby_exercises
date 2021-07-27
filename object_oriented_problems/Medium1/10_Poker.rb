require 'pry-byebug'
class PokerHand
  attr_reader :hand, :sorted_hand
  
  def initialize(deck)
    @hand = []
    5.times{ hand << deck.draw }
    @sorted_hand = hand.sort
  end

  def print
    puts hand
  end

  def evaluate
    case
    when royal_flush?     then 'Royal flush'
    when straight_flush?  then 'Straight flush'
    when four_of_a_kind?  then 'Four of a kind'
    when full_house?      then 'Full house'
    when flush?           then 'Flush'
    when straight?        then 'Straight'
    when three_of_a_kind? then 'Three of a kind'
    when two_pair?        then 'Two pair'
    when pair?            then 'Pair'
    else                       'High card'
    end
  end

  private

  def suits
    sorted_hand.map(&:suit)
  end

  def ranks
    sorted_hand.map(&:rank)
  end

  def rank_values
    sorted_hand.map(&:rank_value)
  end

  def royal_flush?
    straight_flush? && ranks.first == 10
  end

  def straight_flush?
    flush? && straight?
  end

  def four_of_a_kind?
    count_of_group_size?(group_size: 4, group_count: 1)
  end

  def full_house?
    pair? && three_of_a_kind?
  end

  def flush?
    suits.uniq.size == 1
  end

  def straight?
    return true if ranks == [2, 3, 4, 5, 'Ace'] # for ace lows
    rank_values == (rank_values.min..rank_values.max).to_a 
  end

  def three_of_a_kind?
    count_of_group_size?(group_size: 3, group_count: 1)
  end

  def two_pair?
    count_of_group_size?(group_size: 2, group_count: 2)
  end

  def pair?
    count_of_group_size?(group_size: 2, group_count: 1)
  end

  def count_of_group_size?(group_size: nil, group_count: nil)
    ranks.uniq.select { |card| ranks.count(card) == group_size }.size == group_count
  end
end

class Deck
  RANKS = ((2..10).to_a + %w(Jack Queen King Ace)).freeze
  SUITS = %w(Hearts Clubs Diamonds Spades).freeze

  def initialize
    reset
  end

  def draw
    reset if deck.empty?
    deck.pop
  end

  private

  attr_reader :deck

  def reset
    @deck = create_deck.shuffle
  end

  def create_deck
    # deck = []
    # RANKS.each do |rank|
    #   SUITS.each do |suit|
    #     deck << Card.new(rank, suit)
    #   end
    # end
    # deck
    RANKS.product(SUITS).map do |rank, suit|
      Card.new(rank, suit)
    end
  end

  def to_s
    @deck.map(&:to_s).to_s
  end
end

class Card
  include Comparable

  RANK_VALUES = { 'Jack' => 11, 'Queen' => 12, 'King' => 13, 'Ace' => 14 }
  SUIT_VALUES = { 'Diamonds' => 1, 'Clubs' => 2, 'Hearts' => 3, 'Spades' => 4 }

  attr_reader :rank, :suit

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def to_s
    "#{rank} of #{suit}"
  end

  def rank_value
    RANK_VALUES.fetch(rank, rank) # second is default if not found in hash
  end

  def suit_value
    SUIT_VALUES.fetch(suit)
  end

  private

  def <=>(other)
    if rank_value == other.rank_value
      suit_value <=> other.suit_value
    else
      rank_value <=> other.rank_value
    end
  end
end

hand = PokerHand.new(Deck.new)
hand.print
puts hand.evaluate

# Danger danger danger: monkey
# patching for testing purposes.
class Array
  alias_method :draw, :pop
end

# Test that we can identify each PokerHand type.
hand = PokerHand.new([
  Card.new(10,      'Hearts'),
  Card.new('Ace',   'Hearts'),
  Card.new('Queen', 'Hearts'),
  Card.new('King',  'Hearts'),
  Card.new('Jack',  'Hearts')
])
puts hand.evaluate == 'Royal flush'

hand = PokerHand.new([
  Card.new(8,       'Clubs'),
  Card.new(9,       'Clubs'),
  Card.new('Queen', 'Clubs'),
  Card.new(10,      'Clubs'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight flush'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Four of a kind'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Full house'

hand = PokerHand.new([
  Card.new(10, 'Hearts'),
  Card.new('Ace', 'Hearts'),
  Card.new(2, 'Hearts'),
  Card.new('King', 'Hearts'),
  Card.new(3, 'Hearts')
])
puts hand.evaluate == 'Flush'

hand = PokerHand.new([
  Card.new(8,      'Clubs'),
  Card.new(9,      'Diamonds'),
  Card.new(10,     'Clubs'),
  Card.new(7,      'Hearts'),
  Card.new('Jack', 'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new('Queen', 'Clubs'),
  Card.new('King',  'Diamonds'),
  Card.new(10,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new('Jack',  'Clubs')
])
puts hand.evaluate == 'Straight'

hand = PokerHand.new([
  Card.new(3, 'Hearts'),
  Card.new(3, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(3, 'Spades'),
  Card.new(6, 'Diamonds')
])
puts hand.evaluate == 'Three of a kind'

hand = PokerHand.new([
  Card.new(9, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(8, 'Spades'),
  Card.new(5, 'Hearts')
])
puts hand.evaluate == 'Two pair'

hand = PokerHand.new([
  Card.new(2, 'Hearts'),
  Card.new(9, 'Clubs'),
  Card.new(5, 'Diamonds'),
  Card.new(9, 'Spades'),
  Card.new(3, 'Diamonds')
])
puts hand.evaluate == 'Pair'

hand = PokerHand.new([
  Card.new(2,      'Hearts'),
  Card.new('King', 'Clubs'),
  Card.new(5,      'Diamonds'),
  Card.new(9,      'Spades'),
  Card.new(3,      'Diamonds')
])
puts hand.evaluate == 'High card'

hand = PokerHand.new([
  Card.new(5, 'Clubs'),
  Card.new(4,  'Diamonds'),
  Card.new(3,      'Clubs'),
  Card.new('Ace',   'Hearts'),
  Card.new(2,  'Clubs')
])
puts hand.evaluate == 'Straight'