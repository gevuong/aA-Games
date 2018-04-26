# Input : mat =  [[T, T, F, F, F],
#                 [F, T, F, F, T],
#                 [T, F, F, T, T],
#                 [F, F, F, F, F],
#                 [T, F, T, F, T]]
# Output : 5

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

def num_islands(grid)
    island_count = 0
    # iterate grid, and for each el, check its surrounding of el to see if it's surrounded by 0's. If it's been surrounded 0's, then the el is an island.

    grid.each_with_index do |row, r_idx|
        row.each_with_index do |col, c_idx|

            visited_island(r_idx, c_idx, grid)
        end
    end

    # create helper method to check its surroundings.
end

# [[x-1, y-1], [x-1, y], [x-1, y+1],
#  [x, y - 1], [ self ], [x, y + 1],
#  [x+1, y-1], [x+1, y], [x+1, y+1]]

def visited_island(row, col, grid)
    # check elements surrounding
    [-1, 0, 1].each do |x_idx|
        [-1, 0, 1].each do |y_idx|
            next if x_idx == 0 && y_idx == 0 # skip self
            return false if grid[row + x_idx][col + y_idx] == 1
        end
    end

end

def is_island?(x, y, grid)


end
