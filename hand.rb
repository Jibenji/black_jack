require_relative "deck.rb"
require_relative "card.rb"

class Hand
  attr_reader :cards
  def initialize(deck)
    @cards = []
    draw_first_hand(deck)
  end

  def draw_first_hand(deck)
    @cards << deck.draw
    @cards << deck.draw
  end

  def add_card_to_hand(card)
    @cards << card
  end
end
