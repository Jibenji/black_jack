require_relative "card.rb"
require_relative "hand.rb"
require_relative "deck.rb"

class Player
  attr_reader :name, :score, :bet, :hand, :hand1, :hand2
  def initialize(params = {})
    @name = params[:player_name]
    @account = 1_000
    @bet = 0
    @hand = Hand.new(params[:deck])
    @deck = params[:deck]
    @hand1 = Hand.new(@deck)
    @hand2 = Hand.new(@deck)
    @natural = false
  end

  def draw_first_hand
    @hand.draw_first_hand
  end

  def natural?
    @natural = @hand.natural?
  end

  def split
    @hand1.split(@hand.cards[0])
    @hand2.split(@hand.cards[1])
    @hand = 0
  end

  def bet(amount)
    @account - amount
  end


end


