class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_move
    # asks for a move, checks if "where" is in string
    puts "where to place mark? (row, col)"
    gets.chomp.split.map(&:to_i) # Kernel#gets reads a line from $stdin, which is usually the terminal the user is typing into. It returns the string the user typed.
  end

#   def display(board)
#     row
#
#     puts " row/col  0  1  2  "
#     puts "    0  ------------"
#     puts "    1  ------------"
#     puts "    2  ------------"
#   end
#
# end

  def display(board)
    # row0 = "0 |"
    # (0..2).each do |col|
    #   row0 << (board.empty?([0, col]) ? "   |" : " " + board[[0, col]].to_s + " |")
    # end
    # row1 = "1 |"
    # (0..2).each do |col|
    #   row1 << (board.empty?([1, col]) ? "   |" : " " + board[[1, col]].to_s + " |")
    # end
    # row2 = "2 |"
    # (0..2).each do |col|
    #   row2 << (board.empty?([2, col]) ? "   |" : " " + board[[2, col]].to_s + " |")
    # end

    puts "    0   1   2  "
    puts "  |-----------|"
    puts :X
    puts "  |-----------|"
    #puts row1
    puts "  |-----------|"
    #puts row2
    puts "  |-----------|"
  end
end
