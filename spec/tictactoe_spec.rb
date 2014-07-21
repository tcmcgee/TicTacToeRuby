
require "tictactoe"
require "computer"


describe TicTacToe do
	let (:game) {TicTacToe.new(9)}

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
			game.victory?
			expect(game.get_winner).to eq('X')
	end

	it "can get the horizontal victory for any sized board" do
		game.get_horizontal_wins =~ [[0,1,2],[3,4,5],[6,7,8]] 
	end

	it "can get the vertical victory for any sized board" do
		game.get_vertical_wins([[0,1,2],[3,4,5],[6,7,8]]) =~ [[0,3,6],[1,4,7],[2,5,8]] 
	end
	
	it "can get the vertical victory for any sized board" do
		game.get_vertical_wins([[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8]]) =~ [[0,4,8],[2,4,6]] 
	end


end

