class View
  def initialize

  end

  def start_game
    puts "Hello wlecome to our simple BlackJack game"
  end

  def ask_player_number
    puts "How many players do you want to include? (1-4)"
    player_number = gets.chomp.to_i
    if [1, 2, 3, 4].include?(player_number)
      player_number
    else
      puts "Please select 1-4 players"
      ask_player_number
    end
  end

  def ask_player_name(player_number)
    puts "What is the name of Player #{player_number}?"
    gets.chomp
  end

  def black_jack
    puts "BlackJack! You Won!"
  end
end
