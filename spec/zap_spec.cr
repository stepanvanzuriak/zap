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
    # __⚠️ Broken__
    # Zap.concat([1], 2, [3], [[4]]).should eq([1, 2, 3, [4]])
    # Zap.concat([1], [1, [[2, 3]]]).should eq([1, 1, [[2, 3]]])
    # Zap.concat([1, 2], 2, [3], [[4]], [[[4]]]).should eq([1, 2, 2, 3, [4], [[4]]])
    # Zap.concat([1, 2], 2, [3, 10], [[4]], [[[4]]]).should eq([1, 2, 2, 3, 10, [4], [[4]]])
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

  it "@flatten Flattens array a single level deep" do
    # __⚠️ Broken__
    # Zap.flatten([1, 2]).should eq([1, 2])
    # Zap.flatten([1, [2]]).should eq([1, 2])
    # Zap.flatten([1, [2, 3]]).should eq([1, 2, 3])
    # Zap.flatten([1, [[2, 3]]]).should eq([1, [2, 3]])
    # Zap.flatten([[1, [[2, 3]]]]).should eq([1, [[2, 3]]])
  end

  it "@flattenDeep Recursively flattens array" do
    Zap.flattenDeep([1, [2, [3, [4]], 5]]).should eq([1, 2, 3, 4, 5])
  end

  it "@flattenDepth Recursively flatten array up to depth time" do
    # __⚠️ Broken__
    # Zap.flattenDepth([1, [2, [3, [4]], 5]], 1).should eq([1, 2, [3, [4]], 5])
    # Zap.flattenDepth([1, [2, [3, [4]], 5]], 2).should eq([1, 2, 3, [4], 5])
  end

  it "@head Gets the first element of array" do
    Zap.head([1, 2, 3]).should eq(1)
    Zap.head([] of Int32).should eq(Nil)
  end

  it "@initial Gets all but the last element of array" do
    Zap.initial([1, 2, 3]).should eq([1, 2])
    Zap.initial([] of Int32).should eq([] of Int32)
  end

  it "@join Converts all elements in array into a string separated by separator" do
    Zap.join(['a', 'b', 'c'], '~').should eq("a~b~c")
    Zap.join(['a', 'b', 'c'], "ab").should eq("aabbabc")
  end

  it "@last Gets the last element of array" do
    Zap.last([1, 2, 3]).should eq(3)
    Zap.last([] of Int32).should eq(Nil)
  end

  it "@nth Gets the element at index n of array. If n is negative, the nth element from the end is returned" do
    Zap.nth(['a', 'b', 'c', 'd'], 1).should eq(
      'b'
    )

    Zap.nth(['a', 'b', 'c', 'd'], -2).should eq(
      'c'
    )
  end

  it "@reverse Reverses array so that the first element becomes the last, the second element becomes the second to last, and so on" do
    array = [1, 2, 3]

    Zap.reverse(array).should eq(
      [3, 2, 1]
    )
    array.should eq([3, 2, 1])
  end

  it "@sorted_uniq Sort array and returns a new Array by removing duplicate values in self" do
    Zap.sorted_uniq([2, 1, 2]).should eq(
      [1, 2]
    )
  end

  it "@tail Gets all but the first element of array" do
    Zap.tail([1, 2, 3]).should eq(
      [2, 3]
    )

    Zap.tail([] of Int32).should eq(
      Nil
    )
  end
end
