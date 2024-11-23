---
tags:
  - pop
  - push
  - length
---
# Array Basics

The **`Array`** object, as with arrays in other programming languages, enables [storing a collection of multiple items under a single variable name](https://developer.mozilla.org/en-US/docs/Learn/JavaScript/First_steps/Arrays), and has members for [performing common array operations](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#examples).

An **array** is a special type of object used for storing multiple values in a single variable. **Arrays are ordered collections of elements**, where each element can be of any data type.

- **JavaScript arrays are resizable** and **can contain a mix of different [data types](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures)**.

- **JavaScript arrays are not associative arrays** and so, array elements cannot be accessed using arbitrary strings as indexes, but must be accessed using nonnegative integers (or their respective string form) as indexes.

- **JavaScript arrays are [zero-indexed](https://en.wikipedia.org/wiki/Zero-based_numbering)**: the first element of an array is at index `0`, the second is at index `1`, and so on — and the last element is at the value of the array's [`length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) property minus `1`.

- **JavaScript [array-copy operations](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array#copy_an_array) create [shallow copies](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy)**. (All standard built-in copy operations with _any_ JavaScript objects create shallow copies, rather than [deep copies](https://developer.mozilla.org/en-US/docs/Glossary/Deep_copy)).


### Creating an Array

You can create an array using either of the following methods:
```js
// Using array literal syntax
let arr1 = [1, 2, 3, 4];

// Using the Array constructor
let arr2 = new Array(1, 2, 3, 4);
```

### Accessing Array Elements

Array elements are accessed using an index, starting from `0` for the first element:
```js
let arr = [10, 20, 30, 40];
console.log(arr[0]); // Output: 10
console.log(arr[2]); // Output: 30
```

### Modifying Array Elements

You can modify array elements directly by assigning a new value to a specific index:
```js
let arr = [10, 20, 30, 40];
arr[1] = 25;  // Change the second element
console.log(arr); // Output: [10, 25, 30, 40]
```

---

# Array Methods

### `pop()`
#pop 

**`pop()`**: Removes the last element from an array and returns it.
```js
let arr = [1, 2, 3, 4];
let lastElement = arr.pop();
console.log(lastElement); // Output: 4
console.log(arr); // Output: [1, 2, 3]
```

### `shift`
#shift

**`shift()`**: Removes the first element from an array and returns it.
```js
let arr = [1, 2, 3];
let firstElement = arr.shift();
console.log(firstElement); // Output: 1
console.log(arr); // Output: [2, 3]
```

### `push()`
#push 

`push()`: Adds one or more elements to the end of an array.
```js
let arr = [1, 2, 3];
arr.push(4);  // Adds 4 at the end
console.log(arr); // Output: [1, 2, 3, 4]
```

### `unshift()`
#unshift

**`unshift()`**: Adds one or more elements to the beginning of an array.
```js
let arr = [2, 3];
arr.unshift(1);  // Adds 1 at the beginning
console.log(arr); // Output: [1, 2, 3]
```


### `length`
#length 

The `length` property of an array in JavaScript represents the number of elements it contains. It's a dynamic property, meaning it can be both read and written.

#### Reading the `length` Property

To get the current length of an array, simply access its `length` property:
```js
let myArray = [1, 2, 3];
let arrayLength = myArray.length; // arrayLength will be 3
```

#### Setting the `length` Property

Assigning a new value to `array.length` modifies the array's size:

- **Decreasing `length`:** Removes elements from the end of the array.
- **Increasing `length`:** Adds empty slots to the end of the array.

```js
myArray.length = 2; // Now myArray is [1, 2]
myArray.length = 5; // Now myArray is [1, 2, empty, empty, empty]
```

#### Accessing Elements Beyond the Current `length`

You can access and assign values to elements at indices beyond the current `length`. This effectively extends the array and fills the intermediate positions with `undefined`.

```js
myArray[10] = 10; // myArray is now [1, 2, empty, ..., empty, 10]
```
