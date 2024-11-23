---
tags:
  - pop
  - push
  - length
  - splice
  - shift
  - unshift
  - slice
  - includes
  - indexof
  - findindex
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

### `splice()`
#splice

The **`splice()`** method of [`Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) instances changes the contents of an array by removing or replacing existing elements and/or adding new elements [in place](https://en.wikipedia.org/wiki/In-place_algorithm).

**Removing**. To remove elements from an array, you specify the starting index and the number of elements to remove:
```js
let fruits = ['apple', 'banana', 'orange', 'grape'];

// Remove one element starting from index 1
fruits.splice(1, 1); // fruits is now ['apple', 'orange', 'grape']

// Remove two elements starting from index 0
fruits.splice(0, 2); // fruits is now ['grape']
```

**Replacing**, To replace elements, you specify the starting index, the number of elements to remove, and the new elements to insert:
```js
let numbers = [1, 2, 3, 4, 5];

// Replace the second and third elements with 'a' and 'b'
numbers.splice(1, 2, 'a', 'b'); // numbers is now [1, 'a', 'b', 4, 5]
```

**Inserting**. To insert elements without removing any, specify the starting index and the elements to insert:
```js
let colors = ['red', 'green', 'blue'];

// Insert 'yellow' and 'purple' after the first element
colors.splice(1, 0, 'yellow', 'purple'); // colors is now ['red', 'yellow', 'purple', 'green', 'blue']
```

### `length`
#length 

The `length` property of an array in JavaScript represents the number of elements it contains. It's a dynamic property, meaning it can be both read and written, the removed or the replace part is returned.

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

### `slice()`
#slice

**slice()**: Returns a shallow copy of a portion of an array.
```js
let arr = [1, 2, 3, 4, 5];
let newArr = arr.slice(1, 3);  // Extracts elements from index 1 to 2
console.log(newArr); // Output: [2, 3]
```

### `includes()`
#includes 

The `includes()` method determines whether an array contains a specific value.

***Syntax:***
```js
array.includes(valueToSearchFor, fromIndex)
```
***Example***
```js
const fruits = ['apple', 'banana', 'orange'];

// Check if 'banana' is in the array
const hasBanana = fruits.includes('banana'); // true

// Check if 'grape' is in the array starting from index 2
const hasGrape = fruits.includes('grape', 2); // false
```

- `includes()` is case-sensitive.
- It's efficient for checking membership in an array.
- For more complex searches, consider using `findIndex()` or `filter()`.

### `indexof()`
#indexof

Searches for the first occurrence of a specified value within an array and returns its index.

***Syntax***:
```js
array.indexOf(searchElement, fromIndex)
```
- **`searchElement`**: The value to search for.
- **`fromIndex` (optional)**: The index to start the search from. Default is 0.
- Return Value: The index of the first occurrence of the value, or -1 if not found.

***Example***
```js
const numbers = [1, 2, 3, 4, 2, 5];
const index = numbers.indexOf(2); // index will be 1
```

### `findIndex()`
#findindex

Searches for the first element in an array that satisfies a given condition and returns its index.

*Return Value: The index of the first element that satisfies the condition, or -1 if no such element is found.*

***Example***
```js
const persons = [
  { name: 'Alice', age: 30 },
  { name: 'Bob', age: 25 },
  { name: 'Charlie', age: 30 }
];

// Find the index of the first person with age 25
const index = persons.findIndex(person => person.age === 25); // index will be 1
```

### `reverse()`
#reverse 

The `reverse()` method reverses the order of elements in an array in place. It modifies the original array directly. Just by calling the reverse method it will directly edit on the array it is called from and reverse it.

- **Mutates the Original Array**: The array is reversed directly; the original order is lost.
- **Returns the Same Array Reference**: The method returns the array itself (after reversing), not a new array.
- Works for arrays of any data type.
- Returns the reversed array.

```js
const arr = [1, 2, 3, 4];
arr.reverse();
console.log(arr); // [4, 3, 2, 1]
```

#### `reverse()` and `slice()`

**To make a reversed copy** of an array you will use `slice()` and `reverse()`
```js
let a = [1,2,3,4];
let b = a.slice().reverse();
console.log(b); // will return [4,3,2,1]
```
*the slice without parameters given returns the content of a then when calling the reverse on it, it reverse it.*

