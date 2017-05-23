class Board
  attr_reader :grid

  def initialize(grid = Board.default_grid)
    # According to spec file, grid is equal to the argument passed in Board.new(arg).
    @grid = grid
  end

  def Board.default_grid
    Array.new(10) { Array.new(10) }
  end

  def count
    # based on specs, ship is represented as ":s"
    @grid.flatten.count(:s)
  end

  def empty?(pos = [])
    row = pos[0]
    col = pos[1]
    # when pos is passed
    if pos != []
      if @grid[row][col] == nil
        # if position is empty
        true
      elsif @grid[row][col] == :s
        # if position is occupied
        false
      end

    elsif pos == []
      # when pos is not passed
      if @grid.flatten.all? { |coord| coord == nil }
        # if grid has no ships on board
        true
      elsif @grid.flatten.any? { |coord| coord == :s }
        # if grid contains any ships on board
        false
      end
    end
  end

  def full?
    if @grid.flatten.all? { |pos| pos == :s }
      true
    else
      false
    end
  end

  def place_random_ship
    # I can't fall instance method full? in @grid.full?...
    raise "error" if @grid.flatten.all? { |pos| pos == :s }

    if @grid.flatten.all? { |pos| pos == nil } # when board is empty
      coord = [rand(0...@grid.length), rand(0...@grid.length)]
      @grid[coord.first][coord.last] = :s
    end
  end

  def won?
    if @grid.flatten.all? { |pos| pos == nil } # if no ships remain
      true
    else # when at least one ship remains
      false
    end
  end

end
