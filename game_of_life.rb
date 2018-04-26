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


    def game_of_life(seed_state)
        [1..10].each do |_|
            tick(seed)
        end 
    end 

    # // Each tick applies the four rules of the game to every cell on the board
    # // simultaneously, producing the next state
    def tick(state)

    end 
    
    # // Each cell has eight neighbors, namely the eight cells that touch it
    def living_neighbors(x, y, state)

    end 

p game_of_life(seed)

    # function gameOfLife(seedState) {
    #     var state = seedState;
    #     for(var i = 1; i <= 10; i++) {
    #         state = tick(state);
    
    #     }
    #     console.log("Yours:\n\n", state, "\n\nExpected:\n\n", expected);
    # }
    