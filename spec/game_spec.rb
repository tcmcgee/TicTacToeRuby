require "tic_tac_toe/game"

class UiMock
end

module TicTacToe
  describe Game do
    let (:game) {Game.new(Board.new(9), Computer.new, UiMock)}
    let (:computer) {Computer.new}

    it "can set the turn" do
      turn = game.turn
      game.turn=(!turn)
      game.turn.should eq(!turn)
    end

    it "changes turns after each move" do
      turn = game.turn
      game.stub(:move).and_return(1)
      game.take_turn
      game.turn.should eq(!turn)
    end
  end
end
