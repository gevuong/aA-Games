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
  attr_reader :dictionary #is it necessary based on written code?

  def initialize(dictionary)
    # @dictionary returns an array of a string
    @dictionary = dictionary

  end

  def pick_secret_word
    @dictionary.join.length
  end

  def register_secret_length(secret_word_length)
    # reject returns a collection of all elements in its receiver for which the block returns a falsey value.
    @dictionary = @dictionary.select { |word| word.length == secret_word_length }
  end

  def guess(board) # why accepts a board? so player can guess letter respective to board layout
    ch_count = Hash.new(0)
    @dictionary.join.each_char { |ch2| ch_count[ch2] += 1 }
    board.each do |ch|
      ch_count.delete(ch)
    end

    ch_count.sort_by { |_, v| v } [-1].first

    # ch_count[most_common_ch] = 0
    # remaining_most_common_ch = ch_count.sort_by { |_, v| v } [-1].first
  end

  def check_guess(letter)
    arr = []
    @dictionary.join.each_char.with_index { |ch, idx| letter.include?(ch) ? arr << idx : next }
    arr
  end

  def candidate_words
    @dictionary
  end

  def handle_response(ch, arr)
    # find_all returns an array of elements for which given block returns a true value
    @dictionary = @dictionary.select! do |word|
      (0...word.length).select { |idx| word[idx] == ch } == arr
    end
    p @dictionary
  end

end
