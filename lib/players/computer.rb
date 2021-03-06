module Players
  class Computer < Player
    FIRST_TURN_STRATEGIES = ["1", "3","5","7", "9"]
    EDGE_LOCATIONS = ["2","4","6","8"]
    CORNER_LOCATIONS = ["1", "3", "7", "9"]
    attr_reader :strategy

    def move(board)
      if board.turn_count == 0
        input = FIRST_TURN_STRATEGIES.sample.to_i
        self.set_strategy
      else
        input = rand(1..9)
      end

      
      until board.valid_move?(input.to_s)
        input = input = rand(1..9)
      end

      input.to_s

    end
  end

  def set_strategy(input)
    if input == 5
      @strategy = "center"
    else
      @strategy = "corner"
    end
  end

end
