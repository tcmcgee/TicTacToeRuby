require_relative "TicTacToe"
require_relative "Computer"
require_relative "Game"
require_relative "RecursiveComputer"


=begin
puts "Please pick your board size!!\n"

print "1. 3x3\n"
print "2. 4x4\n"
valid2 = false

while (!valid2)
	choice = gets.chomp.to_i
	if choice == 1
		valid2 = true
  elsif choice == 2
		valid2 = true
		
	end
end
=end


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
		print "Please enter 1 or 2."
	end
end

tictactoe = TicTacToe.new
game = Game.new(tictactoe,computer)

game.start
