
# |X|_|X|_|X|_|X|_|
# |_|X|_|X|_|X|_|X|
# |X|_|X|_|X|_|X|_|
# |_|_|_|_|_|_|_|_|
# |_|_|_|_|_|_|_|_|
# |_|O|_|O|_|O|_|O|
# |O|_|O|_|O|_|O|_|
# |_|O|_|O|_|O|_|O|

# Rules
# 1. there are no kings
# 2. cannot jump over other pieces
# 3. "O" pieces can only move up, "X" pieces can only move down

# return an array of of sub_arrays, where first element in sub_array is the original coord, and second element being one possible move for that coord.
# Example: [[[x1, y1], [x2, y2], [x1, y1], [x3, x3]]

# Assume board is 2D array, and turn is equal to either "X" or "O" to signify whose turn it is.

# visualization purposes:
# [[x - 1, y - 1], [x - 1, y + 1],
#              [x, y],
#  [x + 1, y - 1], [x + 1, y + 1]]

# Time: O(n^2) because the length of row and col are equal to n
# Space: array is triple nested, the number of sub_arr are dependent on number of possible moves, n. The length of array is dependent on number of possible moves, n.
def find_all_moves(board, turn)

    # initialize variables
    row_count = board.length
    col_count = board[0].length
    valid_moves = []

    # iterate board, so each sub_arr represents each row
    (0...row_count).each do |row|
        (0...col_count).each do |col|

            el = board[row][col]
            
            # next if el != turn, meaning if el.empty? or el != whoever's turn it is
            next if el != turn 

            # there are only a max of two possible moves for each piece: 
            # if el == "X" then [x+1, y-1], [x+1, y+1]; if el == "O", then [x-1, y-1], [x-1, y+1]
            [-1, 1].each do |num|
                if el == "X"
                    possible_move = [row + 1, col + num]
                elsif el == "O"
                    possible_move = [row - 1, col + num]
                end 

                # this step always runs because el is either "X" or "O"
                if valid_move?(possible_move, board)
                    valid_move = [[row, col], possible_move]
                    valid_moves.push(valid_move)
                end 
            end 
        end 
    end 

    valid_moves
end

# check if indices are out of bounds, if so, then pos to check is not valid
def valid_move?(move, board)
    row = move[0]
    col = move[1]
    return false if row < 0 || row >= board.length || col < 0 || col >= board.length
    return false unless board[row][col] == " "
    true
end 



board = [["X", " ", "X", " ", "X", " ", "X", " "],
         [" ", "X", " ", "X", " ", "X", " ", "X"],
         ["X", " ", "X", " ", "X", " ", "X", " "],
         [" ", " ", " ", " ", " ", " ", " ", " "],
         [" ", " ", " ", " ", " ", " ", " ", " "],
         [" ", "O", " ", "O", " ", "O", " ", "O"],
         ["O", " ", "O", " ", "O", " ", "O", " "],
         [" ", "O", " ", "O", " ", "O", " ", "O"]]


# test cases
p find_all_moves(board, "X")
p find_all_moves(board, "O")