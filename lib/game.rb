require 'pry'
class Game
  attr_accessor :board, :player_1, :player_2
  # Define your WIN_COMBINATIONS constant
 WIN_COMBINATIONS = [
   [0,1,2],
   [3,4,5],
   [6,7,8],
   [0,3,6],
   [1,4,7],
   [2,5,8],
   [0,4,8],
   [2,4,6]
 ]

 def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
   self.player_1 = player_1
   self.player_2 = player_2
   self.board = board
 end

 def current_player
   if self.board.turn_count % 2 == 0
     self.player_1.token == "X" ? self.player_1 : self.player_2
   else
     self.player_1.token == "O" ? self.player_1 : self.player_2
   end
 end

 def won?
   WIN_COMBINATIONS.detect do |win_combination|
      #Load each win index into a variable
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      #Load the token (if any) at index position into a variable
      position_1 = self.board.cells[win_index_1].upcase
      position_2 = self.board.cells[win_index_2].upcase
      position_3 = self.board.cells[win_index_3].upcase

      # Determine whether positions contain winning X (or O) combination
      (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
    end
 end

 def draw?
   self.board.full? && !self.won? ? true : false
 end

 def over?
   self.won? || self.draw? ? true : false
 end

 def winner
   if self.over?
     if self.draw?
       nil
     elsif self.board.cells[self.won?.first] == self.player_1.token
       self.player_1.token
     else
       self.player_2.token
     end
   else
     nil
   end
 end

 def turn
   input = self.current_player.move(self.board)

   until self.board.valid_move?(input)
     input = self.current_player.move(self.board)
   end

   self.board.update(input, self.current_player)

   self.current_player
 end

 def play
   until self.over?
     self.turn
   end

   if self.winner
     puts "Congratulations #{self.winner}!"
   else
     puts "Cat's Game!"
   end

 end

end
