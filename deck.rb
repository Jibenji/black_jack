require_relative "card.rb"

class Deck
  attr_reader :deck

  def initialize
  @deck = {
  ace_clubs: [1],
  two_clubs: [2],
  three_clubs: [3],
  four_clubs: [4],
  five_clubs: [5],
  six_clubs: [6],
  seven_clubs: [7],
  eight_clubs: [8],
  nine_clubs: [9],
  ten_clubs: [10],
  jack_clubs: [10],
  queen_clubs: [10],
  king_clubs:  [10],
  ace_diamonds: [1],
  two_diamonds: [2],
  three_diamonds: [3],
  four_diamonds: [4],
  five_diamonds: [5],
  six_diamonds: [6],
  seven_diamonds: [7],
  eight_diamonds: [8],
  nine_diamonds: [9],
  ten_diamonds: [10],
  jack_diamonds: [10],
  queen_diamonds: [10],
  king_diamonds: [10],
  ace_hearts: [1],
  two_hearts: [2],
  three_hearts: [3],
  four_hearts: [4],
  five_hearts: [5],
  six_hearts: [6],
  seven_hearts: [7],
  eight_hearts: [8],
  nine_hearts: [9],
  ten_hearts: [10],
  jack_hearts: [10],
  queen_hearts: [10],
  king_hearts: [10],
  ace_spades: [1],
  two_spades: [2],
  three_spades: [3],
  four_spades: [4],
  five_spades: [5],
  six_spades: [6],
  seven_spades: [7],
  eight_spades: [8],
  nine_spades: [9],
  ten_spades: [10],
  jack_spades: [10],
  queen_spades: [10],
  king_spades: [10]
  }
  end

  def draw
    card = @deck.to_a.sample
    @deck.delete(card[0])
    params = {
      card_name: card[0].to_s,
      card_value: card[1],
    }
    Card.new(params)
  end
end















