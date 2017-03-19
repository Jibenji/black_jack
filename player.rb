require_relative "card.rb"
require_relative "hand.rb"
require_relative "deck.rb"

class Player
  attr_reader :name, :score, :bet, :hand, :hand1, :hand2
  def initialize(params = {})
    @name = params[:player_name]
    @score = 0
    @account = 1_000
    @bet = 0
    @hand = Hand.new(params[:deck])
    @deck = params[:deck]
    @hand1 = 0
    @hand2 = 0
    @natural = false
  end

  def draw_first_hand
    @hand.draw_first_hand
  end

  def hit(hand)
    new_card = @deck.draw
    hand.add_card_to_hand(new_card)
  end

  def stand
    return false
  end

  def natural?(hand)
    self.player_score(hand) == 21 ? @natural = true : @natural = false
  end

  def split
      @hand1 = Hand.new(@deck)
      @hand2 = Hand.new(@deck)
      @hand1.split(@hand.cards[0])
      @hand2.split(@hand.cards[1])
      @hand = 0
  end

  def bet(amount)
    @account - amount
  end

  def player_score(hand)
    @score = 0
    ace_number = 0
    hand.cards.each do |card|
      card.card_value == 1 ? (@score += 1) && (ace_number += 1) : @score += card.card_value
    end
    (@score <= 11) && (ace_number != 0) ? @score += 10 : @score
  end
end


