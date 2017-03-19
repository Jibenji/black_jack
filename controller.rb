require_relative "player.rb"
require_relative "bank.rb"
require_relative "deck.rb"
require_relative "view.rb"
require_relative "hand.rb"

class Controller
  attr_reader :players
  def initialize
    @view = View.new
    @deck = Deck.new
    @bank = Bank.new(params = {
      deck: @deck,
      })
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
      if player.natural?
        @view.natural
      end
    end
  end

  def player_turn(player)
    p player.hand.cards
    hands = [player.hand]
    if split?(player) == true
      player.split
      hands = [player.hand1, player.hand2]
    end
    hands_turn(hands)
  end

  def hands_turn(hands)
    hands.each do |hand|
    turn = true
    p hand.score
    hand.natural == false ? turn = true : turn = false
      while turn == true
        if @view.hit_or_stand? == "h"
          hand.add_card_to_hand
          ended?(hand) ? turn = false : turn = true
          p hand.cards[-1]
          p hand.score
        else
          turn = false
        end
      end
    puts "Your turn is ended your score is #{hand.score}"
    end
  end

  def ended?(hand)
    if hand.score == 21
      @view.black_jack
      return true
    elsif hand.score > 21
      @view.busted
      return true
    else
      return false
    end
  end

  def split?(player)
    if player.hand.split?
      @view.ask_split == "y" ? true : false
    end
  end

  def bank_draw_first_hand
    @bank.draw_first_hand
  end
end













