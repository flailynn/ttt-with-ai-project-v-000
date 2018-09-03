class Board
  attr_accessor :cells

  def initialize
    self.reset!
  end

  def reset!
    self.cells = Array.new(9, " ")
  end

  def display
    puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
    puts "-----------"
    puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
    puts "-----------"
    puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    self.cells.include?(" ") ? false : true
  end

  def turn_count
    occupied_cells =
      self.cells.select do |cell_value|
        cell_value != " "
      end

    occupied_cells.size
  end

  def taken?(input)
    self.position(input) == " " ? false : true
  end

  def valid_move?(input)
    input = input.to_i
    return false if input < 1 || input > 9
    !self.taken?(input.to_s)
  end

  def update(input, player)
    if valid_move?(input)
      self.cells[input.to_i-1] = player.token
    end
  end

end
