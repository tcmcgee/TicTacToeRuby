require_relative "TicTacToe"
require_relative "Computer"
require_relative "Game"
require_relative "Recursive_computer"
require_relative "Console_ui"

input = $stdin
output = $stdout

=begin
output.print "Please pick your board size!!\n"

output.print "1. 3x3?\n"
output.print "2. 4x4\n"
valid2 = false
size = -1

while (!valid2)
	choice = input.gets.chomp.to_i
	if choice == 1
		size = 9
		valid2 = true
	elsif choice == 2
		size = 16
		valid2 = true
	else 
		output.print "Please give valid input! (1 or 2)"
	end
end
=end



output.print "Please pick your computers difficulty!\n"
output.print "1. Easy\n"
output.print "2. Hard\n"
valid = false

while (!valid)
	choice = input.gets.chomp.to_i
	if choice == 1
		valid = true
		computer = Computer.new
	elsif choice == 2
		valid = true
		computer = Recursive_computer.new
	else
		output.print "Please enter a valid input! (1 or 2)\n"
	end
end

ui = Console_ui.new
tictactoe = TicTacToe.new(ui.size)
game = Game.new(tictactoe,computer,ui)

game.start
