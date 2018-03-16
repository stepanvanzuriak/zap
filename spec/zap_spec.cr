require "./spec_helper"

describe Zap do
  # Array

  it "@chunk" do
    Zap.chunk(['a', 'b', 'c', 4], 2).should eq([['a', 'b'], ['c', 4]])
    Zap.chunk(['a', 'b', 'c', 'd'], 3).should eq([['a', 'b', 'c'], ['d']])
  end

  it "@compact" do
    Zap.compact(["a", nil, "b", nil, "c", nil]).should eq(["a", "b", "c"])
    Zap.compact([0, 1, false, 2, "", 3]).should eq([1, 2, 3])
  end

  it "@concat" do
    # __⚠️ Broken__
    # Zap.concat([1], 2, [3], [[4]]).should eq([1, 2, 3, [4]])
    # Zap.concat([1], [1, [[2, 3]]]).should eq([1, 1, [[2, 3]]])
    # Zap.concat([1, 2], 2, [3], [[4]], [[[4]]]).should eq([1, 2, 2, 3, [4], [[4]]])
    # Zap.concat([1, 2], 2, [3, 10], [[4]], [[[4]]]).should eq([1, 2, 2, 3, 10, [4], [[4]]])
  end

  it "@difference" do
    Zap.difference([2, 1, 5, 10], [2]).should eq([1, 5, 10])
  end

  it "@drop" do
    Zap.drop([1, 2, 3]).should eq([2, 3])
    Zap.drop([1, 2, 3], 2).should eq([3])
    Zap.drop([1, 2, 3], 5).should eq([] of Int32)
    Zap.drop([1, 2, 3], 0).should eq([1, 2, 3])
  end

  it "@drop_right" do
    Zap.drop_right([1, 2, 3]).should eq([1, 2])
    Zap.drop_right([1, 2, 3], 2).should eq([1])
    Zap.drop_right([1, 2, 3], 5).should eq([] of Int32)
    Zap.drop_right([1, 2, 3], 0).should eq([1, 2, 3])
  end

  it "@fill" do
    Zap.fill([1, 2, 3], 'a').should eq(['a', 'a', 'a'])
    Zap.fill([4, 6, 8, 10], '*', 1, 3).should eq([4, '*', '*', 10])
  end

  it "@filter" do
    Zap.filter([1, 2, 3], ->(element : Int32, index : Int32) { element > 2 }).should eq([3])
    Zap.filter([1, 2, 3], ->(element : Int32, index : Int32) { element > 3 }).should eq([] of Int32)
  end

  it "@for_each" do
    test = 0

    Zap.for_each([1, 2, 3], ->(element : Int32, index : Int32) { test += 1 })
    test.should eq(3)
  end

  it "@from_pairs" do
    # Zap.from_pairs([['a', 1], ['b', 2]]).should eq({"a" => 1, "b" => 2})
  end

  it "@flatten" do
    # __⚠️ Broken__
    # Zap.flatten([1, 2]).should eq([1, 2])
    # Zap.flatten([1, [2]]).should eq([1, 2])
    # Zap.flatten([1, [2, 3]]).should eq([1, 2, 3])
    # Zap.flatten([1, [[2, 3]]]).should eq([1, [2, 3]])
    # Zap.flatten([[1, [[2, 3]]]]).should eq([1, [[2, 3]]])
  end

  it "@flatten_type" do
    Zap.flatten_type(1).is_a?(Int32).should eq(true)
    Zap.flatten_type([1, [2]]).is_a?(Int32).should eq(true)
    Zap.flatten_type([1, [2, ['a', 'b']]]).is_a?(Int32 | Char).should eq(true)
  end

  it "@flatten_deep" do
    Zap.flatten_deep([1, [2, [3, [4]], 5]]).should eq([1, 2, 3, 4, 5])
  end

  it "@flatten_depth" do
    # __⚠️ Broken__
    # Zap.flatten_depth([1, [2, [3, [4]], 5]], 1).should eq([1, 2, [3, [4]], 5])
    # Zap.flatten_depth([1, [2, [3, [4]], 5]], 2).should eq([1, 2, 3, [4], 5])
  end

  it "@head" do
    Zap.head([1, 2, 3]).should eq(1)
    Zap.head([] of Int32).should eq(Nil)
  end

  it "@intersection" do
    Zap.intersection([1, 2, 3], [1, 2]).should eq([1, 2])
    Zap.intersection([1, 2, 3], [1, 2], [1]).should eq([1])
    Zap.intersection([1, 2, 3, "a"], [1, 2], [1]).should eq([1])
  end

  it "@initial" do
    Zap.initial([1, 2, 3]).should eq([1, 2])
    Zap.initial([] of Int32).should eq([] of Int32)
  end

  it "@join" do
    Zap.join(['a', 'b', 'c'], '~').should eq("a~b~c")
    Zap.join(['a', 'b', 'c'], "ab").should eq("aabbabc")
  end

  it "@last" do
    Zap.last([1, 2, 3]).should eq(3)
    Zap.last([] of Int32).should eq(Nil)
  end

  it "@map" do
    Zap.map([1, 2, 3], ->(element : Int32, index : Int32) { element * 2 }).should eq([2, 4, 6])
    Zap.map([1, 2, 3], ->(element : Int32, index : Int32) { element * 2 + index }).should eq([2, 5, 8])
  end

  it "@nth" do
    Zap.nth(['a', 'b', 'c', 'd'], 1).should eq(
      'b'
    )

    Zap.nth(['a', 'b', 'c', 'd'], -2).should eq(
      'c'
    )
  end

  it "@reduce" do
    Zap.reduce([1, 2, 3], ->(acc : Int32, element : Int32) { acc + element }).should eq(
      6
    )
  end

  it "@reverse" do
    array = [1, 2, 3]

    Zap.reverse(array).should eq(
      [3, 2, 1]
    )
    array.should eq([3, 2, 1])
  end

  it "@sorted_uniq" do
    Zap.sorted_uniq([2, 1, 2]).should eq(
      [1, 2]
    )
  end

  it "@tail" do
    Zap.tail([1, 2, 3]).should eq(
      [2, 3]
    )

    Zap.tail([] of Int32).should eq(
      Nil
    )
  end

  it "@union" do
    # __⚠️ Broken__
    # Zap.union([2], [1, 2]).should eq(
    #  [2, 1]
    # )
  end

  it "@uniq" do
    Zap.uniq([1, 2, 2]).should eq(
      [1, 2]
    )
  end

  it "@without" do
    Zap.without([2, 1, 2, 3], 1, 2).should eq([3])
  end

  it "@zip" do
    Zap.zip([1, 2], [11, 22], [111, 222, 333]).should eq([[1, 11, 111], [2, 22, 222]])
    Zap.zip([] of Int32).should eq([] of Int32)
    Zap.zip(['a', 'b'], [1, 2], [true, false], [true, false]).should eq([['a', 1, true, true], ['b', 2, false, false]])
  end

  it "@sample" do
    Zap.sample([2]).should eq(2)
  end

  # Array

  # Enumerable
  # Enumerable

end
