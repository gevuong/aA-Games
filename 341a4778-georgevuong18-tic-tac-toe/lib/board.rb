class Board
  # Instance variables are only directly accessible from inside the object. The getter and setter methods are used to share instance variables with other objects.
  attr_accessor :grid

  def initialize(grid = [])
    @grid = grid
    @grid = Array.new(3) { Array.new(3) } if grid.empty?
    # [[nil, nil, nil]
    #  [nil, nil, nil]
    #  [nil, nil, nil]]
  end

  def place_mark(pos, mark)
    @grid[pos.first][pos.last] = mark
  end

  def empty?(pos)
    @grid[pos.first][pos.last] == nil # means square is not marked
  end

  def winner
    if @grid[0][0] == :X && @grid[1][1] == :X && @grid[2][2]
      return :X
    elsif @grid[0][2] == :X && @grid[1][1] == :X && @grid[2][0]
      return :X
    elsif @grid[0][0] == :X && @grid[0][1] == :X && @grid[0][2] # row
      return :X
    elsif @grid[0][2] == :O && @grid[1][2] == :O && @grid[2][2]
      return :O
    else
      return nil
    end
  end

  def over?
    #@grid.flatten.none? { |pos| pos.nil? } || winner
    if @grid.flatten.any? { |pos| pos == :X || pos == :O }
      return false
    elsif @grid.empty?
      return false
    elsif winner == :X || winner == :O # return winner
      return true
    end
  end

end
