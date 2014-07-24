require "tic_tac_toe/tictactoe"
require "tic_tac_toe/computer"

module TicTacToe
  describe Computer do
    let (:game) {TicTacToe.new(9)}
    let (:computer) {Computer.new}
    let (:default_board) {Array.new(9,nil)}


    it "can make a return a random  unoccupied move on the board" do
      board = ['X',nil,'O',nil,'O',nil,'X',nil,'']
      expect(computer.Turn(board)).to be_within(4).of(5)
    end

    it "can return the move to win them the game" do
      #board = Array.new
      board = ['O','O',nil,
               nil,nil,nil,
               nil,nil,nil]
      expect(computer.check_for_two('O',board)).to eq(3)
    end

    it "can return the move to block the player" do
      board = ['X','X',nil,
               nil,nil,nil,
               nil,nil,nil]
      expect(computer.check_for_two('X',board)).to eq(3)
    end

    it "can return a random unoccupied corner space" do
      expect(computer.random_corner(default_board)).to satisfy {| i| i == 1 || i == 3|| i == 7 || i == 9}
    end

    it "retuns -1 if there is no corner availible" do
      board = ['X',nil,'O',
               nil,nil,nil,
               'O',nil,'X']
      expect(computer.random_corner(board)).to eq(-1)
    end

    it "checks to see if the middle is availible and returns it's index if it is" do
      expect (computer.middle(default_board)) == (5)
    end

    it "can go through all its other methods and returns the best move availible" do
      board = ['X',nil,'O',
               nil,nil,nil,
               'O',nil,'X']
      expect(computer.Turn(board)).to eq(5)
    end

  end
end
