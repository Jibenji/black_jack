require_relative "card.rb"
require_relative "hand.rb"
require_relative "deck.rb"

class Player
  attr_reader :name, :score, :bet, :hand1
  def initialize(params = {})
    @name = params[:player_name]
    @score = 0
    @account = 1_000
    @bet = 0
    @hand1 = Hand.new(params[:deck])
    @deck = params[:deck]
  end

  def hit
    new_card = @deck.draw
    @hand1.add_card_to_hand(new_card)
  end

  def stand
    return false
  end

  def bet(amount)
    @account - amount
  end

  # def split
  #   Hand.new
  # end

  def player_score
    @score = 0
    @hand1.cards.each do |card|
      if card.card_value == 12 && (@score + card.card_value) > 21
        @score += 1
      elsif card.card_value == 12 && (@score + card.card_value) <= 21
        @score += 11
      else
        @score += card.card_value
      end
    end
    @score
  end
end


 first_deck = Deck.new

jib = Player.new({player_name: "jibenji", deck: first_deck})

# bib = Player.new({player_name: "zozo", deck: first_deck})


jib.hit
p jib.hand1


jib.player_score
p jib.score
