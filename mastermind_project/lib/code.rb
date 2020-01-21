class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(arr)
    arr.all? { |el| POSSIBLE_PEGS.include?(el.upcase) }
  end

  def initialize(arr)
    throw 'an error has occurred' if Code.valid_pegs?(arr) == false
    @pegs = arr.map(&:upcase)
  end

  attr_reader :pegs

  def self.random(num)
    pegs = POSSIBLE_PEGS.keys
    pegs_arr = []
    num.times { pegs_arr << pegs.sample }
    Code.new(pegs_arr)
  end

  def self.from_string(str)
    Code.new(str.split(''))
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(other)
    count = 0
    @pegs.each_with_index { |peg, i| peg == other[i] && count += 1 }
    count
  end

  def num_near_matches(other)
    count = 0
    other.pegs.each { |peg| count += 1 if @pegs.include?(peg) }
    count - num_exact_matches(other)
  end

  def ==(other)
    @pegs == other.pegs
  end
end
