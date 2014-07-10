require_relative "TicTacToe"
require_relative "Computer"
require_relative "Game"
require_relative "Recursive_computer"
require_relative "Console_ui"


ui = Console_ui.new
size = ui.get_board_size
difficulty = ui.get_difficulty
if difficulty == 1
	computer = Computer.new
else
	computer = Recursive_computer.new
end

tictactoe = TicTacToe.new(size)
game = Game.new(tictactoe,computer,ui)

game.start
