
require_relative "../Game"
require_relative "../TicTacToe"
require_relative "../Computer"
require_relative "../Console_ui"


describe Console_ui do
	let (:ui) {Console_ui.new}


	it "can display a welcome message", :speed => 'slow' do
		ui.stub(:size).and_return(9)
		expect(ui.print_instructions).to eq( "Welcome to Tic Tac Toe!\nWhen playing please reference the board as follows.\n\n 1 | 2 | 3 \n --------------\n 4 | 5 | 6 \n --------------\n 7 | 8 | 9 \n\n\n Press Enter to continue..")
	end

	it "can return a board as a string" do
		expect(ui.display_board(TicTacToe.new(9)) == ("\n   |   |   \n   |   |   \n   |   |   "))
	end

	it "can ask who will go first" do
		ui.stub(:gets).and_return("1")
		expect(ui.get_first_turn).to eq(true)
	end
end
