require "./zap/*"

module Zap
  extend self

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
    values_array = values.to_a

    values_array.each_with_index do |value, index|
      if value.is_a?(Array)
        values_array.delete_at(index)

        value.reverse.each do |element|
          values_array.insert(index, element)
        end
      end
    end

    array + values_array
  end
end
