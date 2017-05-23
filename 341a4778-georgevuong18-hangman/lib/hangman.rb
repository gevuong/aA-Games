class Hangman
  attr_reader :guesser, :referee#, :board

  def initialize(players)
    # players is a hash of symbols/players, which contains data for each player (:referee and :guesser)
    @players = players
  end

  def guesser
    @players[:guesser]
    #p @length
  end

  def referee
    @players[:referee]
  end

  def board
    @board # returns nil, which is the state of the "guessing word"?
  end

  def setup
      length = referee.pick_secret_word
      #p @length
     #p guesser.register_secret_length = referee.pick_secret_word
  end

  def take_turn
  end
end



class HumanPlayer
end



class ComputerPlayer
  #attr_reader :dictionary

  # originally tried to read File dictionary.txt
  #words = File.readlines("dictionary.txt")

  def initialize(dictionary)
    # @dictionary returns an array of a string
    @dictionary = dictionary
  end

  def pick_secret_word
    @dictionary.join.length
  end

  def register_secret_length(length)
    p length
  end

  def guess(board)
    p board.to_s[0]  # board is an array of nil values, length 6
  end

  def check_guess(letter)
    arr = []
    @dictionary.join.each_char.with_index { |ch, idx| letter.include?(ch) ? arr << idx : next }
    arr
  end

  def handle_response(ch, arr)
  end

end
