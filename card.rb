require_relative "deck.rb"

class Card
  attr_reader :name, :value
  def initialize(params = {})
    @name = params[:card_name]
    @value = params[:card_value]
  end

  def card_value
    if self.name.include? "ace"
      card_value = 12
    else
      card_value = self.value[0]
    end
  end
end

# my_test_deck = Deck.new


# puts "Iwant a random card="

# random_card = my_test_deck.draw

# p my_random_card = Card.new(random_card)

# card_test = Card.new(card_name: "ace_spades", card_value:[11])

# value = card_test.value[0]
# p value
