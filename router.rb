require_relative "controller.rb"

class Router

  def initialize
    @run = true
    @game = Controller.new
  end

  def play_a_game
    game_setup
    while @run == true
      @game.players_draw_first_hand
      @game.players.each do |player|
        puts "test"
        @game.player_turn(player)
      end
      @run = false
    end
  end

  def game_setup
    @game.ask_player_number
    @game.bank_draw_first_hand
  end
end

test_router = Router.new
test_router.play_a_game
