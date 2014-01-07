require "rspec"
require_relative "MiniMaxComputer"

describe MiniMaxComputer do 
	let (:computer) {MiniMaxComputer.new}

	it "takes the middle given an empty board" do

		board = Array.new(9,nil)
		expect(computer.Turn(board)).to eq(5)
	end

	it "Blocks a player win" do
		board = ['X','X',nil,
				nil,nil,nil,
				nil,nil,nil]
		expect(computer.Turn(board)).to eq(3)
	end

	it "Wins when given the option" do
			board = ['O','O',nil,
				nil,nil,nil,
				nil,nil,nil]
		expect(computer.Turn(board)).to eq(3)
	end

	it "Prefers winning over blocking a player win" do
			board = ['X','X',nil,
				'O','O',nil,
				nil,nil,nil]
		expect(computer.Turn(board)).to eq(6)
	end

	it "should block an immediate loss over a  future win" do

		board = ['X','X',nil,
				nil,nil,nil,
				nil,'O',nil]
		expect(computer.Turn(board)).to eq(3)
	end


end