class Hangman
  attr_reader :guesser, :referee, :board
end

class HumanPlayer
end

class ComputerPlayer
  attr_reader :dictionary

  # originally tried to read File dictionary.txt
  #words = File.readlines("dictionary.txt")

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @dictionary.join.length
  end

  def check_guess(letter)
    arr = []
    @dictionary.each_char.with_index { |ch, idx| letter.include?(ch) ? arr << idx : next }
    arr
  end

end
