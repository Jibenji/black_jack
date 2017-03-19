require_relative "deck.rb"
require_relative "card.rb"

class Hand
  attr_reader :cards
  def initialize(deck)
    @cards = []
    @deck = deck
  end

  def draw_first_hand
    @cards << @deck.draw
    @cards << @deck.draw
  end

  def split?
    p c1 = @cards[0].name.split("_")[0]
    p c2 = @cards[1].name.split("_")[0]
    c1 == c2 ? true : false
  end

  def split(card)
    @cards << card
  end

  def add_card_to_hand(card)
    @cards << card
  end
end
