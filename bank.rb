require_relative "card.rb"
require_relative "hand.rb"
require_relative "deck.rb"

class Bank
  attr_reader :name, :score, :account, :hand
  def initialize(params = {})
    @name = "The Bank"
    @score = 0
    @account = 100_000
    @hand = Hand.new(params[:deck])
    @deck = params[:deck]
  end

  def draw_first_hand
    @hand = Hand.new(@deck)
  end

  def hit
    new_card = @deck.draw
    @hand.add_card_to_hand(new_card)
  end

  def draw_first_hand
    @hand.draw_first_hand
  end

  def bank_score
    @score = 0
    ace_number = 0
    @hand.cards.each do |card|
      card.card_value == 1 ? (@score += 1) && (ace_number += 1) : @score += card.card_value
    end
    (@score <= 11) && (ace_number != 0) ? @score += 10 : @score
  end
end

# first_deck = Deck.new

# bib = Bank.new({player_name: "zozo", deck: first_deck})

# bib.hit
# bib.hit

# p bib.hand
# p bib.bank_score
# p bib.stand
