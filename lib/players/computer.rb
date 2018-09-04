module Players
  class Computer < Player
    EDGE_LOCATIONS = ["2","4","6","8"]
    CORNER_LOCATIONS = ["1", "3", "7", "9"]

    def move(board)
      if board.valid_move?("5")
        input = "5"
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
