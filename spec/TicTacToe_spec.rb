
require_relative "../TicTacToe"
require_relative "../Computer"


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




end

