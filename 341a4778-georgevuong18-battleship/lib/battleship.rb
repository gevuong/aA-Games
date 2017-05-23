class BattleshipGame
  attr_reader :board, :player # means there exists @board and @player

  # def board
  #   @board
  # end

  # def player
  #   @player
  # end

  # discuss how exactly #initialize passed after passing specs in board.rb
  def initialize(player, board)
    # player and board are attributes of the created object/instance
    # discuss how board was retrieved from class Board
    @board = board
    @player = player
  end

  def attack(pos)
    #p @board.grid
    # p row = pos[0]
    # p col = pos[1]
    # p @board.grid[]
    @board[pos] = :x
  end

  def count
    # @board is an instance of class Board, therefore you are able to call 'count' method on board instance, where @board = board
    @board.count # delegates to the board's count method
  end

  def game_over?
    @board.won?
  end

  def play_turn
    pos = @player.get_play
    self.attack(pos)
  end

end
