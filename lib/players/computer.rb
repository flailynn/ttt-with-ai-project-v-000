module Players
  class Computer < Player
    FIRST_TURN_STRATEGIES = ["2","4","5","6","8"]
    EDGE_LOCATIONS = ["2","4","6","8"]
    CORNER_LOCATIONS = ["1", "3", "7", "9"]

    def move(board)
      if board.turn_count == 0
        input = FIRST_TURN_STRATEGIES.sample.to_i
      else
        input = rand(1..9)
      end

      until board.valid_move?(input.to_s)
        input = input = rand(1..9)
      end

      input.to_s

    end
  end
end
