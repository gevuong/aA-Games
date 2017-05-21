class ComputerPlayer
  attr_reader :name, :board
  attr_writer :mark
  #attr_accessor :marks
  def initialize(name)
    @name = name
    #@board = []
  end

  def display(board)
    @board = board
  end

  def get_move
    @mark
  end

  def winning_move?

  end

end
