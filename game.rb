require './player'
require './question'

class Game
  attr_accessor :p1, :p2, :current_player, :game_on
  def initialize 
    @p1 = Player.new("1")
    @p2 = Player.new("2")
    @current_player = p1
    @game_on = true
    self.new_turn
  end

  def new_turn
    puts "----- NEW TURN -----"
    question = Question.new
    puts "Player #{self.current_player.name}: #{question.ask}"
    answer = gets.chomp.to_i

    if answer == question.result
      puts "Player #{self.current_player.name}: Wow.. Amaaazing, you are correct!!!"
    else 
      self.current_player.lose_life
      puts  "Player #{self.current_player.name}: Oh nooo! You were wrong this time!"
    end

    self.display_score
    self.change_player
  end

  def display_score
    puts "P#{self.p1.name}: #{self.p1.lives}/3 vs P#{self.p2.name}: #{self.p2.lives}/3"
  end

  def change_player 
    if self.current_player == self.p1
      self.current_player = self.p2
    else
      self.current_player = self.p1
    end
    self.check_game
  end

  def check_game
    if self.p1.lives < 1 || self.p2.lives < 1
      self.game_on = false
    end

    if self.game_on 
      self.new_turn
    else
      if self.p1.lives > self.p2.lives
        puts "Contragts!! Player #{self.p1.name} wins with with a score of #{self.p1.lives}/3"
        puts "-----GAME OVER-----"
        puts "Thanks for playing!"
      else
        puts "Contragts!! Player #{self.p2.name} wins with with a score of #{self.p2.lives}/3"
        puts "-----GAME OVER-----"
        puts "Thanks for playing!"
      end
    end
  end
end