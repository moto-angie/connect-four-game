require 'spec_helper'

require_relative '../lib/turn'

describe Turn do
  let(:turn) { Turn.new(1, "A")}

  it "initializes a new turn" do
    expect(turn).to be_an_instance_of(Turn)
  end
end
