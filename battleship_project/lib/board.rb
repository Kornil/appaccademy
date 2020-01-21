class Board
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  attr_reader :size

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    count = 0
    @grid.map { |arr| arr.map { |el| count += 1 if el == :S } }
    count
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      p 'you sunk my battleship!'
      true
    else
      self[position] = :X
      false
    end
  end

  def place_random_ships
    ships = @size / 4

    while num_ships < ships
      random_pos = [rand(0...@grid.length), rand(0...@grid.length)]
      self[random_pos] = :S
    end
  end

  def hidden_ships_grid
    @grid.map { |row| row.map { |el| el == :S ? :N : el } }
  end

  def self.print_grid(grid)
    puts(grid.map { |row| row.join(' ') })
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
