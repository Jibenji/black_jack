require_relative "player.rb"
require_relative "bank.rb"
require_relative "deck.rb"
require_relative "view.rb"

class Controller
  attr_reader :players
  def initialize
    @view = View.new
    @deck = Deck.new
    @bank = Bank.new(@deck)
    @players = []
  end

  def ask_player_number
    player_number = @view.ask_player_number
    ask_player_name(player_number)
  end

  def ask_player_name(player_number)
    player_number.times do |i|
      player_name = @view.ask_player_name(i + 1)
      create_player(player_name)
    end
  end

  def create_player(player_name)
    params = {
      deck: @deck,
      player_name: player_name,
    }
    @players << Player.new(params)
  end

  def players_draw_first_hand
    @players.each do |player|
      player.draw_first_hand
      natural?(player)
    end
  end

  def bank_draw_first_hand
    @bank.draw_first_hand
  end

  def natural?(player)
    if player.natural?(player.hand) == true
      @view.black_jack
    end
  end
end

game = Controller.new
game.ask_player_number



