class ComputerPlayer
  # getter and setter methods are used to share instance variables with other objects.
  attr_reader :board
  attr_writer :mark
  #attr_accessor :marks
  def initialize(name)
    @name = name
  end

  def display(board)
    @board = board
  end

  def get_move
    row_win = [[[0, 0], [0, 1], [0, 2]],
              [[1, 0], [1, 1], [1, 2]],
              [[2, 0], [2, 1], [2, 2]]]

    col_win = [[[0, 0], [1, 0], [2, 0]],
              [[0, 1], [1, 1], [2, 1]],
              [[0, 2], [1, 2], [2, 2]]]

    diag_win = [[[0, 0], [1, 1], [2, 2]],
              [[0, 2], [1, 1], [2, 0]]]

    # find indices where :X or :O is located and store in arr using double iterator
    empty_pos = []
    filled_pos = []
    @board.grid.each_with_index do |row, idx|
      row.each_with_index do |col_el, idx2|
        if col_el == nil
          empty_pos << [idx, idx2]
        elsif col_el == :O
          filled_pos << [idx, idx2]
        end
      end
    end
    p empty_pos
    p filled_pos

    (row_win + col_win + diag_win).each do |arr_win|
      empty_pos.each do |pos|
        return pos if (filled_pos + [pos]).sort == arr_win
      end
    end

    empty_pos.sample
  end

  # def winning_indices
  #
  # end

end
