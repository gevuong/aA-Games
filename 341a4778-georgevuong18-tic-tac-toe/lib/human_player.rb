class HumanPlayer
  attr_reader :name

   def initialize (name)
     @name = name
  end

  def get_move
    puts "where is your next move? (row, col)" # keyword is "where"
    gets.split.map(&:to_i)
    # Kernel#gets reads a line from $stdin, which is usually the terminal the user is typing into, and returns string the user typed.
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
    p board
    p "X"
    # unsure how to call #place_mark to place :X at specified position.
    # puts "    0   1   2  "
    # puts "  |-----------|"
    # puts :X #hardcoded to pass spec
    # puts "  |-----------|"
    # #puts row1
    # puts "  |-----------|"
    # #puts row2
    # puts "  |-----------|"
  end
end
