require_relative "deck.rb"
require_relative "card.rb"

class Hand
  attr_reader :cards, :natural
  def initialize(deck)
    @cards = []
    @deck = deck
    @score = 0
    @natural = false
  end

  def draw_first_hand
    @cards << @deck.draw
    @cards << @deck.draw
  end

  def split?
    c1 = @cards[0].name.split("_")[0]
    c2 = @cards[1].name.split("_")[0]
    c1 == c2 ? true : false
  end

  def natural?
    score == 21 ? @natural = true : @natural = false
  end

  def score
    @score = 0
    ace_number = 0
    @cards.each do |card|
      card.card_value == 1 ? (@score += 1) && (ace_number += 1) : @score += card.card_value
    end
    (@score <= 11) && (ace_number != 0) ? @score += 10 : @score
  end

  def split(card)
    @cards << card
  end

  def add_card_to_hand
    card = @deck.draw
    @cards << card
  end
end
