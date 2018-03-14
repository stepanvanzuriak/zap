# zap :zap:

A crystal utility library delivering modularity, performance, & extras.

Zap is a [lodash](https://lodash.com/) inspired library.

__⚠️ Under development - APIs will change. ⚠️__

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  zap:
    github: stepanvanzuriak/zap
```

## Usage

```crystal
require "zap"

Zap.chunk(['a', 'b', 'c', 4], 2) # [['a', 'b'], ['c', 4]]
```

## Methods list

### Array

* `chunk(array, size)` - Creates an array of elements split into groups the length of size
  
  ```crystal
  Zap.chunk(['a', 'b', 'c', 4], 2) # [['a', 'b'], ['c', 4]]
  ```

  __⚠️ Broken__
* `compact(array)` - Creates an array with all falsey values removed
  
  ```crystal
  Zap.compact(["a", nil, "b", nil, "c", nil]) # ["a", "b", "c"]
  ```

* `concat(array, *values)` - Creates a new array concatenating array with any additional arrays and/or values
  
  ```crystal
  Zap.concat([1, 2], 2, [3], [[4]], [[[4]]]) # [1, 2, 2, 3, [4], [[4]]]
  ```

* `difference(array, values)` - Creates an array of array values not included in the other
  
  ```crystal
  Zap.difference([2, 1, 5, 10], [2]) # [1, 5, 10]
  ```

* `drop(array, number = 1)` -  Creates a slice of array with n elements dropped from the beginning
  
  ```crystal
  Zap.drop([1, 2, 3], 2) # [3]
  Zap.drop([1, 2, 3], 5) # [] of Int32
  ```

* `drop_right(array, number = 1)` - Creates a slice of array with n elements dropped from the end
  
  ```crystal
  Zap.drop_right([1, 2, 3], 2) # [1]
  Zap.drop_right([1, 2, 3], 5) # [] of Int32
  ```

* `fill(array, value, start_index = 0, end_index = array.size + 1)` -  Fills elements of array with value from start up to, but not including, end

  ```crystal
  Zap.fill([1, 2, 3], 'a')           # ['a', 'a', 'a']
  Zap.fill([4, 6, 8, 10], '*', 1, 3) # [4, '*', '*', 10]
  ```

* `filter(array, func)` - The filter method creates a new array with all elements that pass the test implemented by the provided function

  ```crystal
  Zap.filter([1, 2, 3], ->(element : Int32, index : Int32) { element > 2 }) # [3]
  Zap.filter([1, 2, 3], ->(element : Int32, index : Int32) { element > 3 }) # [] of Int32
  ```

  __⚠️ Broken__
* `flatten(array)` -  Flattens array a single level deep
  
  ```crystal
  Zap.flatten([1, [2]])      # [1, 2]
  Zap.flatten([1, [2, 3]])   # [1, 2, 3])
  Zap.flatten([1, [[2, 3]]]) # [1, [2, 3]])
  ```

* `flattenDeep(array)` - Recursively flattens array

  ```crystal
  Zap.flattenDeep([1, [2, [3, [4]], 5]]) # [1, 2, 3, 4, 5]
  ```
* `for_each(array, func)` - Iterates over elements of collection and invokes function for each element

  ```crystal
  Zap.for_each([1, 2, 3], ->(element: Int32, index: Int32) { puts element }) # Prints 1, 2, 3
   ```

* `head(array)` - Gets the first element of array

  ```crystal
  Zap.head([1, 2, 3])   # 1
  Zap.head([] of Int32) # Nil
  ```

* `initial(array)` - Gets all but the last element of array

  ```crystal
  Zap.initial([1, 2, 3])   # [1, 2]
  Zap.initial([] of Int32) # [] of Int32
  ```

* `join(array, separator = ',')` - Converts all elements in array into a string separated by separator

  ```crystal
  Zap.join(['a', 'b', 'c'], '~')  # "a~b~c"
  Zap.join(['a', 'b', 'c'], "ab") # "aabbabc"
  ```

* `last(array)` - Gets the last element of array

  ```crystal
  Zap.last([1, 2, 3])   # 3
  Zap.last([] of Int32) # Nil
  ```
* `map(array, func)` - The map method creates a new array with the results of calling a provided function on every element in the calling array

  ```crystal
  Zap.map([1, 2, 3], ->(element : Int32, index : Int32) { element * 2 })         # [2, 4, 6]
  Zap.map([1, 2, 3], ->(element : Int32, index : Int32) { element * 2 + index }) # [2, 5, 8]
  ```

* `nth(array, index = 0)` - Gets the element at index n of array. If n is negative, the nth element from the end is returned

  ```crystal
  Zap.nth(['a', 'b', 'c', 'd'], 1)  # 'b'
  Zap.nth(['a', 'b', 'c', 'd'], -2) # 'c'
  ```

* `reverse(array)` - Reverses array so that the first element becomes the last, the second element becomes the second to last, and so on.

  ```crystal
  array = [1, 2, 3]

  Zap.reverse(array) # [3, 2, 1]

  array # [3, 2, 1]
  ```

* `reduce(array, func)` - The reduce method applies a function against an accumulator and each element in the array (from left to right) to reduce it to a single value

  ```crystal
  Zap.reduce([1, 2, 3], -> (acc: Int32, element: Int32) {acc + element}) # 6
  ```

* `sorted_uniq(array)` - Sort array and returns a new array by removing duplicate values in self
  
  ```crystal
  Zap.sorted_uniq([2, 1, 2]) # [1, 2]
  ```

* `tail(array)` - Gets all but the first element of array

  ```crystal
  Zap.tail([1, 2, 3])   # [2, 3]
  Zap.tail([] of Int32) # Nil 
  ```

* `sample(array)` - Gets a random element from array
  
  ```crystal
  Zap.sample([1, 2]) # 1 or 2
  Zap.sample([1])    # 1
  ```

  __⚠️ Broken__
* `union(*values)` - Creates an array of unique values

  ```crystal
  Zap.union([2], [1, 2]) # [2, 1]
  ```

* `uniq(array)` - Returns a new array by removing duplicate values in self

  ```crystal
  Zap.uniq([1, 2, 2]) # [1, 2]
  ```

* `without(array, *values)` - Creates an array excluding all given values

  ```crystal
  Zap.without([1, 2, 3], 1, 2) # [3]
  ```

* `zip(*values)` - Creates an array of grouped elements, the first of which contains the first elements of the given arrays, the second of which contains the second elements of the given arrays, and so on
  
  ```crystal
  Zap.zip([1, 2], [11, 22], [111, 222, 333])                # [[1, 11, 111], [2, 22, 222]]
  Zap.zip([] of Int32)                                      # [] of Int32)
  Zap.zip(['a', 'b'], [1, 2], [true, false], [true, false]) # [['a', 1, true, true], ['b', 2, false, false]]
  ```

## Contributing

1. Fork it ( https://github.com/stepanvanzuriak/zap/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

stepanvanzuriak - creator, maintainer
