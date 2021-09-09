#### `Array#map`

​  On line 9 the local variable `array` is initialized to the *Array* object ` [1, 2, 3, 4, 5]`. On line 11 the `map` method is invoked on the object referenced by the local variable `array`.The block is defined by the `{}` curly braces along side the `map` method invocation.  `Array#map` method iterates over the array object it is called on and executes the `block` for each element in the array. The `map` method returns a new array with elements transformed based on the return value of the block. 

For every iteration the `map` method passes the current element as an argument to the block which is assigned to the block parameter `num`.

The `map` method iterates through the collections and returns a new collection transformed based on the return value of the block.