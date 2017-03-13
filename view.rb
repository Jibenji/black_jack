class View
  def initialize

  end

  def start_game
    puts "Hello wlecome to our simple BlackJack game"
  end

  def ask_player_number
    puts "How many players do you want to include?"
    gets.chomp.to_i
  end

  def ask_player_name(player_number)
    puts "What is the name of Player#{player_number}?"
    gets.chomp
  end
end
