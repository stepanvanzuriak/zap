require "./spec_helper"

describe Zap do
  it "@chunk Creates an array of elements split into groups the length of size" do
    Zap.chunk(['a', 'b', 'c', 4], 2).should eq([['a', 'b'], ['c', 4]])
    Zap.chunk(['a', 'b', 'c', 'd'], 3).should eq([['a', 'b', 'c'], ['d']])
  end

  it "@compact Creates an array with all falsey values removed" do
    Zap.compact(["a", nil, "b", nil, "c", nil]).should eq(["a", "b", "c"])
    Zap.compact([0, 1, false, 2, "", 3]).should eq([1, 2, 3])
  end

  it "@concat Creates a new array concatenating array with any additional arrays and/or values" do
    Zap.concat([1], 2, [3], [[4]]).should eq([1, 2, 3, [4]])
    Zap.concat([1, 2], 2, [3], [[4]], [[[4]]]).should eq([1, 2, 2, 3, [4], [[4]]])
    Zap.concat([1, 2], 2, [3, 10], [[4]], [[[4]]]).should eq([1, 2, 2, 3, 10, [4], [[4]]])
  end
end
