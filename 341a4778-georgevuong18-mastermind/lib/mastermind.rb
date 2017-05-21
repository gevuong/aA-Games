class Code
  attr_reader :pegs
  attr_accessor :PEGS, :parse, :random

  def initialize(pegs = [])
    #raise "Error" if pegs.class != Array
    @pegs = pegs
  end

  def self.PEGS
    "string"
  end

  def self.parse(str)
    #puts str
  end

  def self.random
  end

end

class Game
  attr_reader :secret_code
end
