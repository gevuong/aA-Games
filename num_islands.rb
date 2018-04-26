# Problem 1 from geeksforgeeks
# Given a boolean 2D matrix, find the number of islands. A group of connected trues forms an island. For example, the below matrix contains 5 islands.

# Input : mat =  [[T, T, F, F, F],
#                 [F, T, F, F, T],
#                 [T, F, F, T, T],
#                 [F, F, F, F, F],
#                 [T, F, T, F, T]]
# Output : 5


# Problem 2 from leetCode
# Given a 2d grid map of '1's (land) and '0's (water), count the number of islands. An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.

# Example 1:

# 11110
# 11010
# 11000
# 00000
# Answer: 1

# Example 2:

# 11000
# 11000
# 00100
# 00011
# Answer: 3

# The idea is to call DFS on each component. On each DFS call, a component of a subgraph is visited. 
def num_islands(grid)

    # initialize variables
    island_count = 0
    rows = grid.length 
    cols = grid[0].length

    # create a visited arr to track which cells are visited. Initially all cells are set to false, meaning all cells are unvisited
    # visited = Array.new(grid.length, Array.new(grid[0].length))
    visited = Array.new(grid.length) { Array.new(grid[0].length) }

    # iterate grid and traverse through all cells in grid
    (0...rows).each do |row|
        (0...cols).each do |col|

            # if cell is unvisited in visited array, and cell in grid is true (true meaning it's an island) then visit_island, which visits all surrounding cells on island
            if !visited[row][col] && grid[row][col] 
                visit_island(row, col, visited, grid)
                
                # increase count because island is discovered
                island_count += 1
            end 

        end
    end

    island_count
end


# [[x-1, y-1], [x-1, y], [x-1, y+1],
#  [x, y - 1], [ self ], [x, y + 1],
#  [x+1, y-1], [x+1, y], [x+1, y+1]]

# helper method to check cell's surrounding. If surrounding cell is an island, then recursively call visit_island, meaning run DFS on that surrounding cell (or component in graph terms). One cell can be connected to 8 neighbors. We can make a recursive DFS call to each neighbor, and track which ones have been visited. Only call DFS on an unvisited component. The number of DFS calls is the number of connected components. 

def visit_island(row, col, visited, grid)
    # when visiting island, update visited cell to true
    visited[row][col] = true 

    # Time complexity: O(3^2) => O(9) which is constant time
    [-1, 0, 1].each do |r_idx|
        [-1, 0, 1].each do |c_idx|
            next if r_idx == 0 && c_idx == 0 # skip self

            # check if surrounding cell is an island has not been visited
            if is_island?(row + r_idx, col + c_idx, visited, grid)
                visit_island(row + r_idx, col + c_idx, visited, grid)
            end 
        end
    end

end

# method defining when a cell is an island
def is_island?(row, col, visited, grid)
    return (row >= 0 && row < grid.length) && 
           (col >= 0 && col < grid[0].length) &&
           (!visited[row][col] && grid[row][col]) # meaning neighboring cell is true (true meaning it's an island), and cell is unvisited
end


# test case 
grid = [[true, true, false, false, false],
        [false, true, false, false, true],
        [true, false, false, true, true],
        [false, false, false, false, false],
        [true, false, true, false, true]]

p num_islands(grid)


