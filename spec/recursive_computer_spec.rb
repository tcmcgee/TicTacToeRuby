require "tic_tac_toe/recursive_computer"
module TicTacToe
  describe Recursive_computer do
    let (:computer) {Recursive_computer.new}

    it "uses 1 through 9 for a board index not 0 through 8" do
      board = ['O','X','X',
               'O','O',nil,
               'X','O','X']
      (computer.turn(board) - 1).should eq(5)
    end
    it "Blocks a player win" do
      board = ['X','X',nil,
               nil,'O',nil,
               nil,'O',nil]

      computer.turn(board).should eq(3)
    end

    it "Wins when given the option" do
      board = ['O','O',nil,
               nil,nil,nil,
               nil,nil,nil]
      computer.turn(board).should eq(3)
    end

    it "Can block the two corner trick" do
      board = ['X',nil,nil,
               nil,'O',nil,
               nil,nil,'X']
      computer.turn(board).should eq(2)
    end

    it "Prefers winning over blocking a player win" do
      board = [nil,nil,nil,
               'O','O',nil,
               nil,'X','X']
      computer.turn(board).should eq(6)
    end

    it "should block an immediate loss over a  future win" do

      board = ['X','X',nil,
               nil,'O',nil,
               nil,nil,nil]
      computer.turn(board).should eq(3)
    end

    it "returns an availible move" do
      board = ['O','X','X',
               'O','O',nil,
               'X','O','X']
      computer.turn(board).should eq(6)
    end

    it "can return a random move" do
      board = ['O','X','X',
               'O','O',nil,
               'X','O','X']
      computer.turn(board).should eq(6)
    end

    it "can return thea number of availible moves" do
      board = ['O','X','X',
               nil,'O',nil,
               'X','O',nil]
      computer.num_available_moves(board).should eq(3)
    end
  end
end
