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

  def flatten_deep(array)
    array.flatten
  end

  def flatten_depth(array, depth = 1)
    0.upto(depth) { |i| array = Zap.flatten(array) }

    array
  end

  def for_each(array, func)
    array.each_with_index { |value, index| func.call(value, index) }
  end

  def from_pairs(array)
    result_first = [] of typeof(Zap.flatten_type(array))
    result_second = [] of typeof(Zap.flatten_type(array))

    Zap.for_each(array, ->(element : typeof(array.first), index : Int32) { result_first << element[0] })
    Zap.for_each(array, ->(element : typeof(array.first), index : Int32) { result_second << element[1] })

    Hash.zip(result_first, result_second)
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

  def intersection(*values)
    values_array = values.to_a
    result = [] of typeof(values_array) | typeof(values_array.first)
    result = values_array[0]
    Zap.for_each(values_array, ->(element : typeof(values_array.first), index : Int32) { result = result & element })

    result
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

  def pull(array, *value)
    array - value.to_a
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

  def reduce(array, func)
    array.reduce { |acc, i| func.call(acc, i) }
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

  def without(array, *values)
    array_values = values.to_a

    array - array_values
  end

  def xor(*values)
    values_array = values.to_a
    flat_vales = Zap.flatten_deep(values_array)

    xor_array = [] of typeof(Zap.flatten_type(values_array))

    Zap.for_each(flat_vales, ->(element : typeof(Zap.flatten_type(values_array)), index : Int32) { flat_vales.count(element) == 1 ? xor_array << element : Nil })

    xor_array
  end

  def xor_by
  end

  def xor_with
  end

  def zip(*values)
    # https://stackoverflow.com/questions/4856717/javascript-equivalent-of-pythons-zip-function
    values_array = values.to_a

    shortest = values_array.size == 0 ? [] of typeof(values_array) : Zap.reduce(values_array, ->(a : typeof(values_array.first), b : typeof(values_array.first)) { a.size < b.size ? a : b })

    Zap.map(shortest, ->(a : typeof(shortest.first), i : Int32) { Zap.map(values_array, ->(element : typeof(values_array.first), index : Int32) { element[i] }) })
  end

  def zip_with
  end

  # Array

  # Enumerable

  def count_by
  end

  def every
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

  def reduce_right
  end

  def reject
  end

  # Enumerable

  # Util
  def flatten_type(object)
    if object.is_a?(Array)
      flatten_type(object[0])
    else
      object
    end
  end
  # Util

end
