class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]

  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, '_')
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)

    false
  end

  def get_matching_indices(char)
    result = []
    @secret_word.each_char.with_index { |el, i| result << i if el == char }
    result
  end

  def fill_indices(char, arr)
    arr.each { |el| @guess_word[el] = char }
  end

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      false
    else
      indices = get_matching_indices(char)
      @remaining_incorrect_guesses -= 1 if indices.length.zero?
      fill_indices(char, indices)
      @attempted_chars << char
      true
    end
  end

  def ask_user_for_guess
    p 'Enter a char:'
    input = gets.chomp
    try_guess(input)
  end

  def win?
    if @guess_word.join('') == @secret_word
      p 'WIN'
      true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses.zero?
      p 'LOSE'
      true
    else
      false
    end
  end

  def game_over?
    if win? || lose?
      p @secret_word
      true
    else
      false
    end
  end
end
