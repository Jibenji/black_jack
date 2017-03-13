require_relative "player.rb"
require_relative "bank.rb"
require_relative "deck.rb"
require_relative "view.rb"

class Controller

  def initialize()

    @view = View.new

  end

  first_deck = Deck.new

jib = Player.new({player_name: "jibenji", deck: first_deck})

bib = Player.new({player_name: "zozo", deck: first_deck})

jib.hit
bib.hit

p jib.hand1
p bib.hand1

p first_deck

end
