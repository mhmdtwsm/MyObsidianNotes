---
tags:
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
