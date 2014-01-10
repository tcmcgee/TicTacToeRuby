require_relative "TicTacToe"
require_relative "Computer"
class Game
	attr_reader :tictactoe

	def initialize(tictactoe, computer)
		@tictactoe = tictactoe
		@computer = computer
		@turn = false

	end

	def start
		again =true
		print instructions
		gets
		while (again == true)
			@tictactoe.reset
			pick_first
			play
			choice = -1
			done = false
			print display_board
			winner
			while (!done)
				print "\n Would you like to play again?\n 1. Yes \n 2. No \n"
				choice = gets.chomp.to_i
		
				if choice == 1 
					done = true
				elsif choice == 2
					done = true
					again = false
				else 
					done = false
				end

			end
		end
	end

	def instructions
		return_string = "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n"

		example_board = [1,2,3,4,5,6,7,8,9]
		@tictactoe.set_board(example_board)
		return_string = return_string + display_board + "\n" + "\n Press Enter to continue.."
		@tictactoe.set_board(Array.new(9,nil))

		return return_string
	end

	def pick_first

		done = false
		while (!done)
			print "\nWho will go first?"
			print "\n1. Player\n"
			print "2. Computer\n"
			choice = gets.chomp.to_i
			
			if choice == 1 
				done = true
				set_turn(true)
			elsif choice == 2
				done = true
				set_turn(false)
			end
		end
	end

	def play
		over = false
		while (!over)
			if @turn == true
				player_move
				

			else
				board_helper = Array.new
				for i in (0...9)
				board_helper[i] = @tictactoe.board[i]
				end
				@tictactoe.move(@computer.Turn(board_helper),false)
				@turn = !turn

			end
			over = @tictactoe.over
		end

	end

	def turn
		@turn
	end

	def set_turn(turn)
		@turn = turn
	end

	def player_move
		valid = false
		while (!valid)
			print display_board
			print "\nWhere would you like to move?\n"
			move = gets.chomp.to_i
			if @tictactoe.board[move - 1] == nil && move < 10 && move > 0 
				valid = true
				@tictactoe.move(move,true)
				@turn = !turn
			end

		end
	end

	def winner 
		if (@tictactoe.get_winner.eql?('T'))
			print "\n Good Game, it's a Tie!"
		elsif (!@turn)
			print "\nCongratulations, the Player has won!"
		elsif (@turn)
			print "\nSorry, the computer is the victor!"
		
		end
	end

	def display_board
		return_string = ""
		string_board = Array.new
		counter = 0
		@tictactoe.board.each{|tile|
		if (tile == nil)
		tile = " _ "
		else
			tile = " " + tile.to_s + " "
		end
		string_board[counter] = tile
		counter = counter + 1}
		return_string = "\n" + string_board[0] + "|" + string_board[1] + "|" + string_board[2] + "\n" + string_board[3] + "|" + string_board[4] + "|" + string_board[5] + "\n" + string_board[6] + "|" + string_board[7] + "|" + string_board[8]

		return return_string
	end

end

