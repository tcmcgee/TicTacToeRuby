class Console_ui

	input = $stdin
	output = $stdout

	def get_board_size
		print "Please pick your board size!!\n"
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
		set_size(size)
		return size
	end

	def set_size(size)
		@size = size
	end

	def size
		@size
	end

	def get_play_again
		print "\n Would you like to play again?\n 1. Yes \n 2. No \n"
		choice = gets.chomp.to_i
		return true  if choice == 1
		return false if choice == 2
		if choice != 1 || choice != 2 
			print "Please enter a valid input (1 or 2) \n"
		end
		get_play_again
	end

	def get_first_turn
		done = false
		while (!done)
			print "\nWho will go first?"
			print "\n1. Player\n"
			print "2. Computer\n"
			choice = gets.to_i

			if choice == 1
				done = true
				turn = true
			elsif choice == 2
				done = true
				turn = false
			else
				print "Please enter a valid @input! (1 or 2) \n"
			end
		end
		return turn
	end

	def get_player_move(ttt)
		valid = false
		while (!valid)
			print_board(ttt)
			print "\nWhere would you like to move?\n"
			move = gets.chomp.to_i
			if ttt.board[move - 1] == nil && move < size + 1 && move > 0
				valid = true
				ttt.move(move,true)
			elsif move == 0
				print_help
				enter_to_continue
			else
				print "Please enter a valid input, or enter 0 for help!"
			end
		end
	end

	def print_instructions
		return_string = "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n"
		
		example_board = Array.new(size,nil)
		(0...size).each do |i|
			example_board[i] = i + 1
		end
		ttt = TicTacToe.new(size)
		ttt.set_board example_board
		return_string = return_string + display_board(ttt) + "\n" + "\n Press Enter to continue.."
		print return_string
		enter_to_continue
		return return_string
	end

	def print_thinking_message
		print "Thinking... Please wait!"
	end

	def get_difficulty
		print "Please pick your computers difficulty!\n"
		print "1. Easy\n"
		print "2. Hard\n"
		valid = false

		while (!valid)
			choice = gets.chomp.to_i
			if choice == 1 || choice == 2
				valid = true
				return choice
			else
				print "Please enter a valid input! (1 or 2)\n"
			end
		end
	end

	def print_help
		example_board = Array.new(size,nil)
		(0...size).each do |i|
			example_board[i] = i + 1
		end
		ttt = TicTacToe.new(example_board.length)
		ttt.set_board example_board
		return_string = "Please reference the board as follows.\n"
		return_string = return_string + display_board(ttt) + "\n" + "\n Press Enter to continue.."
		print(return_string)
	end


	def print_winner(ttt,turn)
		print display_board(ttt)
		if ttt.tie?
			print("\n Good Game, it's a Tie!")
		elsif (!turn)
			print("\nCongratulations, the Player has won!")
		elsif (turn)
			print("\nSorry, the computer is the victor!")
		end
	end

	def enter_to_continue
		gets
	end
	def print_board(ttt)
		print display_board(ttt)
	end
	def display_board(tictactoe=@tictactoe)
		return_string = ""
		string_board = Array.new
		counter = 0
		index = 0
		tictactoe.board.each{|tile|
			index = index + 1
			if (tile == nil)
				if size == 16
					if index < 10
						tile =  " " + index.to_s + " "
					else
						tile =  " " + index.to_s
					end
				else
					tile = " _ "
				end

			else
				tile = " " + tile.to_s + " "
			end
			string_board[counter] = tile
			counter = counter + 1}
			counter2 = 0
			return_string = ""
			per_row = Math.sqrt(tictactoe.size)
			(0...per_row).each do |i|
				return_string = return_string + "\n"
				(0...per_row).each do |j|
					if j != per_row - 1
						return_string += string_board[counter2] + "|" 
					else
						return_string += string_board[counter2]
					end
					counter2 = counter2 + 1
			end
			if i != per_row - 1
				return_string = return_string + "\n --------------"
			else
				return_string = return_string + "\n"
			end
		end
		return return_string
	end

end