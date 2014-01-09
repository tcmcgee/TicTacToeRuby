require "rspec"
require_relative "Game"
require_relative "TicTacToe"
require_relative "Computer"

describe Game do
	let (:game) {Game.new(TicTacToe.new,Computer.new)}


	it "can display a welcome message" do
		expect(game.instructions).to eq( "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n\n 1 | 2 | 3 \n 4 | 5 | 6 \n 7 | 8 | 9 \n\n Press Enter to continue..")
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

	it "can change turns after each move" do
		game.set_turn(true)
		expect(game.turn).to eq(true)
		game.stub(:gets).and_return("1")
		game.player_move
		expect(game.turn).to eq(false)
	end








end