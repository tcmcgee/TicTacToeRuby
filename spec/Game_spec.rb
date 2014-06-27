
require_relative "../Game"
require_relative "../TicTacToe"
require_relative "../Computer"

describe Game do
	input = $stdin
	output = $stdout
	let (:game) {Game.new(TicTacToe.new(9),Computer.new,input,output)}


	it "can display a welcome message" do
		expect(game.instructions).to eq( "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n\n 1 | 2 | 3 \n --------------\n 4 | 5 | 6 \n --------------\n 7 | 8 | 9 \n\n\n Press Enter to continue..")
	end

	it "can return a board as a string" do
		game.tictactoe.stub(:board).and_return(Array.new(9, " "))

		expect(game.display_board. == ("\n   |   |   \n   |   |   \n   |   |   "))
	end

	it "can ask who will go first" do
		game.stub(:gets).and_return("1")
		game.pick_first
		expect(game.turn).to eq(true)
	end

	xit "can change turns after each move" do
		game.set_turn(true)
		expect(game.turn).to eq(true)
		game.stub(:gets).and_return("1")
		game.player_move
		expect(game.turn).to eq(false)
	end

  describe '#play' do
    it 'swaps the turn'
  end
end
