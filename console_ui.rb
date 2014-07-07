class Console_ui

	input = $stdin
	output = $stdout

	def get_board_size
		output.print "Please pick your board size!!\n"
		output.print "1. 3x3\n"
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
	end

	def get_play_again
		@output.print "\n Would you like to play again?\n 1. Yes \n 2. No \n"
		choice = @input.gets.chomp.to_i
		return true  if choice == 1
		return false if choice == 2
		if choice != 1 || choice != 2 
			@output.print "Please enter a valid @input (1 or 2) \n"
		end
		get_play_again?
	end

	def get_first_turn
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

	def get_player_move
		valid = false
		while (!valid)
			@output.print display_board
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

	def get_instructions
		return_string = "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n"
		
		example_board = Array.new(size,nil)
		(0...size).each do |i|
			example_board[i] = i + 1
		end
		ttt = TicTacToe.new(@tictactoe.size)
		ttt.set_board example_board
		return_string = return_string + display_board(ttt) + "\n" + "\n Press Enter to continue.."
		return return_string
	end

	def get_difficulty
		output.print "Please pick your computers difficulty!\n"
		output.print "1. Easy\n"
		output.print "2. Hard\n"
		valid = false

		while (!valid)
			choice = input.gets.chomp.to_i
			if choice == 1 || choice == 2
				valid = true
				return choice
			else
				output.print "Please enter a valid input! (1 or 2)\n"
			end
		end
	end

	def print_help
		
		example_board = Array.new(size,nil)
		for i in (0...size)
			example_board[i] = i + 1
		end
		ttt = TicTacToe.new(example_board.length)
		ttt.set_board example_board
		return_string = "Please reference the board as follows.\n"
		return_string = return_string + display_board(ttt) + "\n" + "\n Press Enter to continue.."
		output.print(return_string)
	end


	def print_winner
		if @tictactoe.tie?
			output.print("\n Good Game, it's a Tie!")
		elsif (!@turn)
			output.print("\nCongratulations, the Player has won!")
		elsif (@turn)
			output.print("\nSorry, the computer is the victor!")
		end
	end

end