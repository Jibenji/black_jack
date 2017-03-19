class Router

  def initialize
    @run = true
    @game = Controller.new
  end

  def play_a_game
    game_setup
    while @run == true
      game.players_draw_first_hand
      game.bank_draw_first_hand
    end
  end

  def turn
    while run = true
      game.natural?
      game.push?
    end
  end

  def game_setup
    @game.ask_player_number
  end
end
