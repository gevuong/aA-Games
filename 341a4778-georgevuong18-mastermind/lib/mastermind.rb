class Code
  attr_reader :pegs
  attr_accessor :parse, :random

  def initialize(pegs)
    #raise "Error" if pegs.class != Array
    #@pegs = pegs.chars if pegs.class == String
    @pegs = pegs

  end

  PEGS = {
    red: "r",
    green: "g",
    "B" => "Blue",
    "Y" => "Yellow",
    "O" => "Orange",
    "P" => "Purple"
  }

  def self.parse(str)
    # raise error if any of the characters in str is not within "rgbyop"
    raise "error" unless str.downcase.chars.all? { |ch| "rgbyop".include?(ch) }
    Code.new(str.chars)
  end

  def self.random
    Code.new("rgbyop".chars.shuffle[0...4])
  end

  def [](idx)
    @pegs[idx]
  end
end

def exact_matches(user_guess)
  return 0 if @pegs != user_guess.chars

end

class Game
  attr_reader :secret_code
end
