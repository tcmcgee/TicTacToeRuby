require_relative "TicTacToe"
require_relative "Computer"
require_relative "Game"
require_relative "RecursiveComputer"



puts "Please pick your board size!!\n"

print "1. 3x3\n"
print "2. 4x4\n"
valid2 = false
size = -1
while (!valid2)
	choice = gets.chomp.to_i
	if choice == 1
		size = 9
		valid2 = true
  elsif choice == 2
  	size = 16
		valid2 = true
	else 
		print "Please give valid input! (1 or 2)"
		
	end
end



puts "Please pick your computers difficulty!\n"

print "1. Easy\n"
print "2. Hard\n"
valid = false

while (!valid)
	choice = gets.chomp.to_i
	if choice == 1
		valid = true
		computer = Computer.new
  	elsif choice == 2
		valid = true
		computer = RecursiveComputer.new
	else
		print "Please enter a valid input! (1 or 2)\n"
	end
end

tictactoe = TicTacToe.new(size)
game = Game.new(tictactoe,computer,$stdin,$stdout)

game.start
