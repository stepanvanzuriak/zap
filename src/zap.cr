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

  def filter(array, func)
    result = [] of typeof(array) | typeof(array.first)

    array.map_with_index { |element, index| func.call(element, index) ? result << element : element }

    result
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

  def last_index_of
  end

  def map(array, func)
    array.map_with_index { |element, index| func.call(element, index) }
  end

  def nth(array, index = 0)
    array[index]
  end

  def pull
  end

  def pull_all
  end

  def pull_all_by
  end

  def pull_all_with
  end

  def pull_at
  end

  def remove
  end

  def reverse(array)
    array.reverse!
  end

  def sample(array)
    array.sample
  end

  def slice
  end

  def sorted_index
  end

  def sorted_index_by
  end

  def sorted_index_of
  end

  def sorted_last_index
  end

  def sorted_last_index_by
  end

  def sorted_last_index_of
  end

  def sorted_uniq(array)
    array.sort.uniq
  end

  def sorted_uniq_by
  end

  def tail(array)
    array.size > 0 ? array[1, array.size - 1] : Nil
  end

  def take
  end

  def take_right
  end

  def take_right_while
  end

  def take_while
  end

  def union(*value)
    array_values = value.to_a
    result = [] of typeof(array_values.first) | typeof(array_values)

    array_values.each do |item|
      result = result | item
    end

    result
  end

  def union_by
  end

  def union_with
  end

  def uniq(array)
    array.uniq
  end

  def uniq_by
  end

  def uniq_with
  end

  def unzip
  end

  def unzip_with
  end

  def without(array, *value)
    array_values = value.to_a

    array - array_values
  end

  def xor
  end

  def xor_by
  end

  def xor_with
  end

  def zip
  end

  def zip_with
  end

  # Array

  # Enumerable

  def count_by
  end

  def every
  end

  def filter
  end

  def find
  end

  def find_last
  end

  def flat_map
  end

  def flat_map_deep
  end

  def flat_map_depth
  end

  def for_each
  end

  def for_each_right
  end

  def group_by
  end

  def includes
  end

  def invoke_map
  end

  def key_by
  end

  def map
  end

  def order_by
  end

  def partition
  end

  def reduce
  end

  def reduce_right
  end

  def reject
  end

  # Enumerable

end
