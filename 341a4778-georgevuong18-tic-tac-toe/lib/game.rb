require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
  attr_reader :board, :current_player, :player_one, :player_two
  #attr_accessor :switch_Players # getter method, pulls out the board stored in @board instance variable

  # def board
  #   @board = board  # vs putting @board = Board.new in initialize
  # end

  def initialize(player_one, player_two)
    # want board method (#board) to be an instance of class Board
    @player_one = player_one
    @player_two = player_two
    @board = Board.new
    @current_player = player_one # sets current player to be first player when passed to Game.new
  end

  def play_turn
    get_pos = @player_one.get_move
    @board.place_mark(get_pos, @player_one.mark)
    self.switch_players!
  end

  def switch_players!
    if @current_player == @player_one
      @current_player = @player_two
    else
      @current_player = @player_one
    end
  end



  # +if $PROGRAM_NAME == __FILE__
  # +  print "Enter your name: "
  # +  name = gets.chomp.strip
  # +  human = HumanPlayer.new(name)
  # +  garry = ComputerPlayer.new('garry')
  # +
  # +  new_game = Game.new(human, garry)
  # +  new_game.play
end
