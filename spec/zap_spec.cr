require "./spec_helper"

describe Zap do
  it "@chunk Creates an array of elements split into groups the length of size" do
    Zap.chunk(['a', 'b', 'c', 4], 2).should eq([['a', 'b'], ['c', 4]])
  end
end
