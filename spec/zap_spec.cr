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

  it "@difference Creates an array of array values not included in the other" do
    Zap.difference([2, 1, 5, 10], [2]).should eq([1, 5, 10])
  end

  it "@drop Creates a slice of array with n elements dropped from the beginning" do
    Zap.drop([1, 2, 3]).should eq([2, 3])
    Zap.drop([1, 2, 3], 2).should eq([3])
    Zap.drop([1, 2, 3], 5).should eq([] of Int32)
    Zap.drop([1, 2, 3], 0).should eq([1, 2, 3])
  end

  it "@drop_right Creates a slice of array with n elements dropped from the end" do
    Zap.drop_right([1, 2, 3]).should eq([1, 2])
    Zap.drop_right([1, 2, 3], 2).should eq([1])
    Zap.drop_right([1, 2, 3], 5).should eq([] of Int32)
    Zap.drop_right([1, 2, 3], 0).should eq([1, 2, 3])
  end

  it "@fill Fills elements of array with value from start up to, but not including, end" do
    Zap.fill([1, 2, 3], 'a').should eq(['a', 'a', 'a'])
    Zap.fill([4, 6, 8, 10], '*', 1, 3).should eq([4, '*', '*', 10])
  end
end
