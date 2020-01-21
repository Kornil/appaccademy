require_relative "code"

class Mastermind
  def initialize(num)
    @secret_code = Code.random(num)
  end

  def print_matches(other)
    p @secret_code.num_exact_matches(other)
    p @secret_code.num_near_matches(other)
  end

  def ask_user_for_guess
    p 'Enter a code'
    input = gets.chomp
    code = Code.from_string(input)
    p print_matches(code)
    code == @secret_code
  end
end
