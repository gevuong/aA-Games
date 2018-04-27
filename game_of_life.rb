# Your task is to program Conway's Game of Life (GoL). GoL is a cellular automata simulation. It's a kind of game, with rules. 

# The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square cells, each of which is in one of two possible states, alive or dead, or "populated" or "unpopulated". Every cell interacts with its eight neighbours, which are the cells that are horizontally, vertically, or diagonally adjacent. At each step in time, the following transitions occur:

# Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
# Any live cell with two or three live neighbours lives on to the next generation.
# Any live cell with more than three live neighbours dies, as if by overpopulation.
# Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

# The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

# Assume that the grid of cells is fixed to a 9 x 9 layout.
# To confirm that your program works, start with this seed (assume alive = 1 and dead = 0):
seed = [
	[0,0,1,0,0,0,0,0,0],
	[0,0,0,1,0,0,0,0,0],
	[0,1,1,1,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0]]

seed1 = [
    [0,0,0,0,0,0,0,0,0],
	[0,1,0,1,0,0,0,0,0],
	[0,0,1,1,0,0,0,0,0],
	[0,0,1,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
	[0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0]]

expected = [
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,1,0,0,0],
    [0,0,0,1,0,1,0,0,0],
    [0,0,0,0,1,1,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0],
    [0,0,0,0,0,0,0,0,0]]


# run tick() ten times, and each time, return a new_state, which is then passed in the recursive call. When count == 10, base case will return seed_state, which in this case is the expected state after 10 ticks. What about the call stack? It should begin unwinding, but after returning expected state, the method just exits...

# Space: O(h), where h is height of call stack, which is equal to count
def game_of_life(seed_state, count = 0)
    return seed_state if count == 10
    
    new_state = tick(seed_state)
    count += 1
    game_of_life(new_state, count)
end 

# Each tick applies the four rules of the game to every cell on the board simultaneously, producing the next state
def tick(state)
    # initialize variables
    rows = state.length
    cols = state[0].length
    new_state = []

    # iterate through state and traverse every cell. Pass each cell to #living_neighbors
    (0...rows).each do |row|

        sub_arr = []
        (0...cols).each do |col|
            # pass row, col to living_neighbors to check its eight neighbors
            live_neighbor_count = living_neighbors(row, col, state)

            cell = state[row][col]

            # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
            # Any live cell with two or three live neighbours lives on to the next generation.
            if (cell == 0 && live_neighbor_count == 3) || cell == 1 && (live_neighbor_count == 2 || live_neighbor_count == 3)
                sub_arr.push(1)

            # Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
            # Any live cell with more than three live neighbours dies, as if by overpopulation.
            else
                sub_arr.push(0)
            end
        end
        
        new_state.push(sub_arr)
    end 

    new_state
end 


# Grid of 8 surrounding cells of [x,y]
# [[x-1, y-1], [x-1, y], [x-1, y+1],
#   [x, y - 1], [x, y], [x, y + 1],
#  [x+1, y-1], [x+1, y], [x+1, y+1]]

# Each cell has eight neighbors, namely the eight cells that touch it
def living_neighbors(row, col, state)
    live_neighbor_count = 0 
    [-1, 0, 1].each do |r_idx|
        [-1, 0, 1].each do |c_idx|

            # skip current cell, only want to look at surrounding cell
            next if r_idx == 0 && c_idx == 0 
            
            neighbor_row = row + r_idx
            neighbor_col = col + c_idx

            if valid_cell?(neighbor_row, neighbor_col, state)
                neighbor_cell = state[row + r_idx][col + c_idx]

                # "1" means cell is live and need to check if neighbor_cell is within bounds of state
                live_neighbor_count += 1 if neighbor_cell == 1
            end 
        end 
    end 
    
    live_neighbor_count
end 

def valid_cell?(row, col, state)
    return true if (row >= 0 && row < state.length) && (col >= 0 && col < state[0].length)
    false
end 

p game_of_life(seed) == expected
p tick(seed) == seed1
    