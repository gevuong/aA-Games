class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players = {})
    # players is an options hash of symbols/players, which contains data for each player (:referee and :guesser)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end

  def setup
    secret_word_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_word_length)
    @board = Array.new (secret_word_length)

  end

  def take_turn
    letter = @guesser.guess # asks guesser to guess
    @referee.check_guess(letter) # has referee check guesser's guess
    self.update_board
    @guesser.handle_response
  end

  def update_board(*args)
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

  def register_secret_length(secret_word_length)
    #secret_word.length
  end

  def guess(board)
    #board.to_s[0] # board is an array of nil values, length 6
  end

  def check_guess(letter)
    arr = []
    @dictionary.join.each_char.with_index { |ch, idx| letter.include?(ch) ? arr << idx : next }
    arr
  end

  def handle_response(ch, arr)
  end

end
