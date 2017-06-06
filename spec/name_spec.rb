require 'spec_helper'

require_relative '../lib/name'

describe Name do
  it "takes a player's name" do
    expect(Name.new("james").name).to eq("james")
  end
end
