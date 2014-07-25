require "tic_tac_toe/game"

module TicTacToe
describe Game do
	let (:game) {Game.new(Board.new(9),Computer.new,nil)}
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

	xit "can make a move" do
		game.turn= true
		game.stub(:move).and_return(1)
		game.stub(:@ui).and_return(nil)
		game.take_turn
		expect(game.board.tiles[0]).to eq('X')
	end

end
end