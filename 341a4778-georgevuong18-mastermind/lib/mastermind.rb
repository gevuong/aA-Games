class Code
  attr_reader :pegs

  def initialize(pegs)
    #raise "Error" if pegs.class != Array
    #@pegs = pegs.chars if pegs.class == String
    @pegs = pegs
  end

  PEGS = {
    red: "r",
    green: "g",
    blue: "b",
    yellow: "y",
    orange: "o",
    purple: "p"
  }

  def self.parse(str)
    # raise error if any of the characters in str is not within "rgbyop"
    raise "error" unless str.chars.all? { |ch| PEGS.values.include?(ch.downcase) }
    Code.new(str.chars)
  end

  def self.random
    Code.new(PEGS.values.shuffle[0...4])
  end

  def [](idx)
    @pegs[idx]
  end

  def exact_matches(user_guess)
    count = 0
    user_guess.pegs.each_with_index do |user_peg, idx|
      if user_peg == @pegs[idx]
        count += 1
      else
        next
      end
    end

    count
  end

  def near_matches(user_guess) # counts number of correct colors but doesn't count if it's in correct position
    peg_count = Hash.new(0)
    user_count = Hash.new(0)

    @pegs.each do |ch2|
      peg_count[ch2] += 1
    end

    user_guess.pegs.each do |ch2|
      user_count[ch2] += 1
    end

    arr = []
    user_count.each_key do |key|
      if peg_count.keys.include?(key)
        if peg_count[key] < user_count[key]
          arr << peg_count[key] - exact_matches(user_guess)
        else
          arr << user_count[key] - exact_matches(user_guess)
        end

      else
        arr << 0
      end
    end
    arr.reduce(:+)
  end

  def ==(user_code) # user_code is an instance of class Code. So need to access attribute pegs within instance user_code.
    p @pegs = @pegs.join.downcase.chars
    if user_code.class != Code
      return false

    else
      if @pegs == user_code.pegs
        return true
      elsif @pegs != user_code.pegs
        return false
      end

    end
  end
end

class Game
  attr_reader :secret_code

  # when no arguments are passed, initialize the argument so that passing arguments is optional.
  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def get_guess
    p Code.parse(secret_code.pegs.join)
  end

  def display_matches(user_guess)
    p @secret_code.near_matches(user_guess)
    p @secret_code.exact_matches(user_guess)
  end

end
