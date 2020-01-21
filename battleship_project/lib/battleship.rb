require_relative "board"
require_relative "player"

class Battleship
  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = n * n / 2
  end

  attr_reader :board, :player

  def start_game
    @board.place_random_ships
    p @board.num_ships
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      p 'you lose'
      true
    else
      false
    end
  end

  def win?
    if @board.num_ships.zero?
      p 'you win'
      true
    else
      false
    end
  end

  def game_over?
    win? || lose? ? true : false
  end

  def turn
    position = @player.get_move
    move = @board.attack(position)
    @board.print
    @remaining_misses -= 1 unless move
    p @remaining_misses
  end
end
