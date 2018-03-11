require "./zap/*"

module Zap
  extend self

  # Array

  def chunk(array, size)
    result = [] of typeof(array)

    array.each_slice(size) do |slice|
      result << slice
    end

    result
  end

  def compact(array)
    array = array.select { |element| element }
    array = array.select { |element| element != 0 && element != "" }

    array
  end

  def concat(array, *values)
    array_values = values.to_a

    # array + Zap.flatten(array_values)

    Zap.flatten(array_values)
  end

  def difference(array, values)
    array - values
  end

  def difference_by
  end

  def difference_with
  end

  def drop(array, number = 1)
    start_index = number > array.size ? array.size : number
    array[start_index, array.size]
  end

  def drop_right(array, number = 1)
    end_index = array.size - number < 0 ? 0 : array.size - number
    array[0, end_index]
  end

  def drop_right_while
  end

  def drop_while
  end

  def fill(array, value, start_index = 0, end_index = array.size + 1)
    result = [] of typeof(value) + array
    end_index = end_index - 1 < 0 ? 0 : end_index - 1

    result.fill(start_index, end_index) { |element| value }
  end

  def findIndex
  end

  def findLastIndex
  end

  def flatten(array)
    result = [] of typeof(array) | typeof(array.first)

    array.each do |item|
      if item.is_a?(Array)
        result = ([] of typeof(item) | typeof(item.first)) + result
        result.concat(item)
      else
        result << item
      end
    end

    result
  end

  def flattenDeep(array)
    array.flatten
  end

  def flattenDepth(array, depth = 1)
    0.upto(depth) { |i| array = Zap.flatten(array) }

    array
  end

  def fromPairs
  end

  def head(array)
    array.size > 0 ? array[0] : Nil
  end

  def index_of
  end

  def initial(array)
    end_index = array.size - 1 > 0 ? array.size - 1 : 0
    array[0, end_index]
  end

  def intersection
  end

  def intersection_by
  end

  def intersection_with
  end

  def join(array, separator = ',')
    result = ""

    array.each do |item|
      result = result.size > 0 ? result + separator + item : result + item
    end

    result
  end

  def last(array)
    array.size - 1 > 0 ? array[array.size - 1] : Nil
  end

  def lastIndexOf
  end

  def nth(array, index = 0)
    array[index]
  end
  # Array

end
