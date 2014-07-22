
require "tictactoe"
require "computer"



describe Computer do
	let (:game) {TicTacToe.new(9)}
	let (:computer) {Computer.new}
	let (:default_board) {Array.new(9,nil)}
	let (:default_board_4x4) {Array.new(16,nil)}

	context "when 3x3 board" do
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

	it "can go through all its other methods and returns the best move availible" do
		board = ['X',nil,'O',
				nil,nil,nil,
				'O',nil,'X']
		expect(computer.Turn(board)).to eq(5)
	end
	end
	####################
	context "when 4x4 board" do
	it "can make a return a random  unoccupied move" do
		expect(computer.Turn(default_board_4x4)).to be_within(8).of(8)
	end

	it "can return the move to win them the game" do
		board = ['O','O','O',nil,
				nil,nil,nil,nil,
				nil,nil,nil,nil,
				nil,nil,nil,nil]
		expect(computer.check_for_two('O',board)).to eq(4)
	end

	it "can return the move to block the player" do
		board = ['X','X','X',nil,
				nil,nil,nil,nil,
				nil,nil,nil,nil,
				nil,nil,nil,nil]
		expect(computer.check_for_two('X',board)).to eq(4)
	end

	it "can go through all its other methods and returns the best move availible" do
		board = ['X','X','O',nil,
				nil,nil,'O',nil,
				nil,'X',nil,'O',
				nil,'X',nil,'X']
		expect(computer.Turn(board)).to eq(6)
	end
	end

=======
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
>>>>>>> b48c71e7faa65d21df5fb0b89dd1935786c0e91a
end
