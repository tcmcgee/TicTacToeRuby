require "rspec"
require_relative "RecursiveComputer"
require_relative "TicTacToe"
require_relative "Game"

describe RecursiveComputer do 
	let (:computer) {RecursiveComputer.new}
	

	it "takes the middle given an empty board" do

		board = Array.new(9,nil)
		expect(computer.Turn(board)).to eq(5)
	end

	it "Blocks a player win" do
		board = ['X','X',nil,
				nil,'O',nil,
				nil,'O',nil]
		expect(computer.Turn(board)).to eq(3)
	end

	it "Wins when given the option" do
			board = ['O','O',nil,
				nil,nil,nil,
				nil,nil,nil]
		expect(computer.Turn(board)).to eq(3)
	end

	it "Prefers winning over blocking a player win" do
			board = ['X','X',nil,
				'O','O',nil,
				nil,nil,nil]
		expect(computer.Turn(board)).to eq(6)
	end

	it "should block an immediate loss over a  future win" do

		board = ['X','X',nil,
				nil,nil,nil,
				nil,'O',nil]
		expect(computer.Turn(board)).to eq(3)
	end

	it "Never loses a game when the player goes first" do
		tictactoe = TicTacToe.new
		play_all_games(tictactoe.board,true)
	end

	it "Never loses a game when the computer goes first" do
		tictactoe = TicTacToe.new
		play_all_games(tictactoe.board,false)
	end


	

	def play_all_games(board,turn)
		over = false
		if (player_victory(board))
			raise_exception_beatable
			puts board

			over = true		
		end
		if (computer_victory(board))
			over = true
			
		end
		if (tie?(board))
			over = true
		end


		temp_board = Array.new
		for i in (0...9)
			temp_board[i] = board[i]
		end
		if (!over)
		if turn 
			for i in (0...9)
				if temp_board[i] == nil
					temp_board[i] = 'X'
					play_all_games(temp_board,!turn)
					temp_board[i] = nil
				end
			end
		else
			move = computer.Turn(board)
			temp_board[move - 1] = 'O'
			play_all_games(temp_board,!turn)
		end
		end
	
	end

	def raise_exception_beatable
		raise "This game is beatable!"
	end


	def possible_wins

		possible_wins = Array.new
		possible_wins = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
	end

	def tie?(board)
		count = 0
		for tile in board
			if (!tile.eql?(nil))
				count = count + 1
			end
		end
		if (player_victory(board) == false && computer_victory(board) == false)
			if(count == 9)
				return true
			else
				return false
			end

		else
			return false
		end
	end


	def player_victory(board)
		
		for possible in possible_wins
			if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'X' )
				return true
			end
		end
		return false
	end

	def computer_victory(board)
		for possible in possible_wins
			if ((board[possible[0]].eql?(board[possible[1]])) && (board[possible[0]].eql?(board[possible[2]])) && board[possible[0]] != nil && board[possible[0]] == 'O' )
				return true
			end
		end
		return false
	end









end