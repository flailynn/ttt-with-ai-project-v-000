module Players
  class Computer < Player
    def move(board)
      input = rand(1..9)

      until board.valid_move?(input.to_s)
        input = input = rand(1..9)
      end

      input.to_s

    end
  end
end
