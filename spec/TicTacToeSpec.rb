require "rspec"
require "TicTacToe"
require "Computer"


describe TicTacToe do
	let (:game) {TicTacToe.new}

	it "has a board" do
		expect(game.board).to eq(Array.new(9,nil))
	end

	it "can make a move" do
		game.move(3,true)
		expect(game.board[2]).to eq('X')
	end

	it "can check for victory" do
		board = ['X','X','X',
				 nil,nil,nil,
				 nil,nil,nil]
		game.set_board(board)
		expect(game.victory?).to eq(true)
	end

	it "can check for a tie" do
		board = ['X','O','X',
				 'X','O','X',
				 'O','X','O']
		game.set_board(board)
		expect(game.tie?).to eq(true)

	end

	it "can reset the game" do
		board = ['X','O','X',
				 'X','O','X',
				 'O','X','O']
		game.set_board(board)
		game.reset
		expect(game.board[0]).to eq(nil)
	end

	it "can tell you when the game is over" do
		board = ['X','O','X',
				 'X','O','X',
				 'O','X','O']
		game.set_board(board)
		expect(game.over).to eq(true)
	end

	it "can tell you who the winner is" do
		board = ['X','X','X',
				 'X','O','O',
				 'O','X','O']
		game.set_board(board)
		expect(game.get_winner).to eq('X')
	end

	it "can get horizontal winning combinations for a 3x3 board" do
		board = Array.new(9,nil)
		game.set_board(board)
		expected_wins = [[0,1,2],[3,4,5],[6,7,8]]
		expect(game.get_horizontal_wins).to eq(expected_wins)
	end

	it "can get horizontal winning combinations for a 4x4 board" do
		board = Array.new(16,nil)
		game.set_board(board)
		expected_wins = [[0,1,2,3],[4,5,6,7],[8,9,10,11],[12,13,14,15]]
		expect(game.get_horizontal_wins).to eq(expected_wins)
	end

	it "can get vertical winning combinations for a 3x3 board" do
		board = Array.new(9,nil)
		game.set_board(board)
		expected_wins = [[0,3,6],[1,4,7],[2,5,8]]
		expect(game.get_vertical_wins).to eq(expected_wins)
	end

	it "can get vertical winning combinations for a 4x4 board" do
		board = Array.new(16,nil)
		game.set_board(board)
		expected_wins = [[0, 4, 8, 12], [1, 5, 9, 13], [2, 6, 10, 14], [3, 7, 11, 15]]
		expect(game.get_vertical_wins).to eq(expected_wins)
	end

	it "can get diagonal winning combinations for a 3x3 board" do
		board = Array.new(9,nil)
		game.set_board(board)
		expected_wins = [[0, 4, 8], [2, 4, 6]]
		expect(game.get_diagonal_wins).to eq(expected_wins)
	end

	it "can get diagonal winning combinations for a 4x4 board" do
		board = Array.new(16,nil)
		game.set_board(board)
		expected_wins = [[0, 5,10,15], [3,6,9,12]]
		expect(game.get_diagonal_wins).to eq(expected_wins)
	end

	it "can get all winning combinations for a 3x3 board" do
		board = Array.new(9,nil)
		game.set_board(board)
		expected_wins = [ [0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6] ]
		expect(game.possible_wins).to eq(expected_wins)
	end



end