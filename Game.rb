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
		again = true
		print instructions
		gets
		while (again == true)
			@tictactoe.reset
			pick_first
			play
			print display_board
			print winner
      again = play_again?
		end
	end

  def play_again?
    print "\n Would you like to play again?\n 1. Yes \n 2. No \n"
    choice = gets.chomp.to_i
    return true  if choice == 1
    return false if choice == 2
    play_again?
  end

	def instructions
		return_string = "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n"

		example_board = [1,2,3,4,5,6,7,8,9]
    ttt = TicTacToe.new
    ttt.set_board example_board
		return_string = return_string + display_board(ttt) + "\n" + "\n Press Enter to continue.."
		return return_string
	end

	def help
		size = @tictactoe.get_board.length
		example_board = Array.new(size,nil)
		for i in (0...size)
			example_board[i] = i
		end
		ttt = TicTacToe.new
		ttt.set_board example_board
		return_string = "Please reference the board as follows.\n"
		return_string = return_string + display_board(ttt) + "\n" + "\n Press Enter to continue.."
		return return_string
	end

	def pick_first
		done = false
		while (!done)
			print "\nWho will go first?"
			print "\n1. Player\n"
			print "2. Computer\n"
			choice = gets.to_i

			if choice == 1
				done = true
				self.turn = true
			elsif choice == 2
				done = true
				self.turn = false
			else
				print "Please enter a valid input! (1 or 2) \n"
			end
		end
	end

	def play
	  take_turn until @tictactoe.over
	end

  def take_turn
    if turn
      player_move
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
			print display_board
			print "\nWhere would you like to move?\n"
			move = gets.chomp.to_i
			if @tictactoe.board[move - 1] == nil && move < 10 && move > 0
				valid = true
				@tictactoe.move(move,true)
			elsif move == 0
				print help
				gets

			else
				print "Please enter a valid input, or enter 0 for help!"
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

	def display_board(tictactoe=@tictactoe)
		return_string = ""
		string_board = Array.new
		counter = 0
		tictactoe.board.each{|tile|
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

