require "game"
require "tictactoe"

describe Game do
	let (:game) {Game.new(TicTacToe.new(9),Computer.new,nil)}
	let (:computer) {Computer.new}

	it "can set the turn" do
		turn = game.turn
		game.turn=(!turn)
		expect(game.turn).to eq(!turn)
	end

	it "changes turns after each move" do
		turn = game.turn
		game.stub(:move).and_return(1)
		game.take_turn
		expect(game.turn).to eq(!turn)
	end



end
