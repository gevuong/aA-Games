class Board
  # Instance variables are only directly accessible from inside the object. The getter and setter methods are used to share instance variables with other objects.
  attr_accessor :grid

  def initialize(grid = [])
    @grid = grid
    @grid = Array.new(3) { Array.new(3) } if grid.empty?
  end

  def place_mark(pos, mark)
    @grid[pos.first][pos.last] = mark
  end

  def empty?(pos)
    @grid[pos.first][pos.last] == nil # nil means square is not marked, so returns true
  end

  def diagonal
    left_diagonal = []
    right_diagonal = []
    (0...@grid.length).each do |idx|
      left_diagonal << @grid[idx][idx]
      right_diagonal << @grid[idx][2 - idx]
    end
    [left_diagonal, right_diagonal]

  end

  def winner
    (@grid + @grid.transpose + diagonal).each do |idx|
      if idx == [:X, :X, :X]
        return :X
      elsif idx == [:O, :O, :O]
        return :O
      end
    end

    return nil
  end

  def over?
    # none? method returns true if block never returns a truthy value
    return true if winner == :X || winner == :O || @grid.flatten.none? { |pos| pos == nil }
  end

end
