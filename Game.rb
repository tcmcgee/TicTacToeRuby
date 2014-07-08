require_relative "TicTacToe"
require_relative "Computer"
class Game

	attr_reader :tictactoe

	def initialize(tictactoe, computer,ui) #REPLACE Input,output with UI
		@tictactoe = tictactoe
		@ui = ui
		@input = $stdin
		@output = $stdout
		@computer = computer
		@turn = false
	end

	def start
		again = true
		@ui.print_instructions
		@input.gets
		while (@ui.get_play_again)
			@tictactoe.reset
			@turn = get_first_turn
			play
			@ui.print_board(@tictactoe)
			@ui.print_winner
			again = get_play_again
		end
	end

	def play_again?
		@output.print "\n Would you like to play again?\n 1. Yes \n 2. No \n"
		choice = @input.gets.chomp.to_i
		return true  if choice == 1
		return false if choice == 2
		if choice != 1 || choice != 2 
			@output.print "Please enter a valid @input (1 or 2) \n"
		end
		play_again?
	end

	def instructions
		return_string = "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n"
		
		example_board = Array.new(size,nil)
		for i in (0...size)
			example_board[i] = i + 1
		end
		ttt = TicTacToe.new(@tictactoe.size)
		ttt.set_board(example_board)
		return_string = return_string + @ui.print_board(ttt) + "\n" + "\n Press Enter to continue.."
		return return_string
	end

	def help
		
		example_board = Array.new(size,nil)
		for i in (0...size)
			example_board[i] = i + 1
		end
		ttt = TicTacToe.new(example_board.length)
		ttt.set_board example_board
		return_string = "Please reference the board as follows.\n"
		return_string = return_string + @ui.print_board(ttt) + "\n" + "\n Press Enter to continue.."
		return return_string
	end
	def size
		size = @tictactoe.get_board.length
	end

	def pick_first
		done = false
		while (!done)
			@output.print "\nWho will go first?"
			@output.print "\n1. Player\n"
			@output.print "2. Computer\n"
			choice = @input.gets.to_i

			if choice == 1
				done = true
				self.turn = true
			elsif choice == 2
				done = true
				self.turn = false
			else
				@output.print "Please enter a valid @input! (1 or 2) \n"
			end
		end
	end

	def play
		take_turn until @tictactoe.over
	end

	def take_turn
		if turn
			get_player_move(size)
		else
			@tictactoe.move(@computer.Turn(@tictactoe.board), false)
		end
		self.turn = !turn
	end

	def turn
		@turn
	end

	def turn=(turn)
		@turn = turn
	end

	def player_move
		valid = false
		while (!valid)
			@output.print @ui.print_board
			@output.print "\nWhere would you like to move?\n"
			move = @input.gets.chomp.to_i
			if @tictactoe.board[move - 1] == nil && move < size + 1 && move > 0
				valid = true
				@tictactoe.move(move,true)
			elsif move == 0
				@output.print help
				@input.gets

			else
				@output.print "Please enter a valid input, or enter 0 for help!"
			end
		end
	end

	def winner
		if @tictactoe.tie?
			"\n Good Game, it's a Tie!"
		elsif (!@turn)
			"\nCongratulations, the Player has won!"
		elsif (@turn)
			"\nSorry, the computer is the victor!"
		end
	end

end

