require 'spec_helper'

require_relative '../lib/board'


describe Board do
  let(:board) { Board.new }

  it "is initialized with 6 rows and 7 columns" do
    expect(board.rows.size).to eq(6)
    expect(board.rows[0].size).to eq(7)
  end

  it "prints out a blank game board" do
    expect(board.print).to eq(" |  -  -  -  -  -  -  -  | \n |  -  -  -  -  -  -  -  | \n |  -  -  -  -  -  -  -  | \n |  -  -  -  -  -  -  -  | \n |  -  -  -  -  -  -  -  | \n |  -  -  -  -  -  -  -  | \n |  A  B  C  D  E  F  G  |")
  end
end
