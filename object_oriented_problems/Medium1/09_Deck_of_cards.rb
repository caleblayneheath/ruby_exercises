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

  private

  def <=>(other)
    if rank_value == other.rank_value
      suit_value <=> other.suit_value
    else
      rank_value <=> other.rank_value
    end
  end

  protected

  def rank_value
    RANK_VALUES.fetch(rank, rank) # second is default if not found in hash
  end

  def suit_value
    SUIT_VALUES.fetch(suit)
  end
end

deck = Deck.new
drawn = []
52.times { drawn << deck.draw }
puts drawn.count { |card| card.rank == 5 } == 4
puts drawn.count { |card| card.suit == 'Hearts' } == 13

drawn2 = []
52.times { drawn2 << deck.draw }
puts drawn != drawn2 # Almost always.
