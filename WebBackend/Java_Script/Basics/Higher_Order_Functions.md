---
tags:
  - map
---

# `map`
#map

The `map()` function is an array method in JavaScript used to create a new array by applying a provided callback function to each element of the original array.
### **Syntax**
```javascript
array.map(callback(element, index, array), thisArg);
```

### **Parameters**
1. **callback**: A function that is called for each element in the array. It takes the following arguments:
   - `element`: The current element being processed in the array.
   - `index` *(optional)*: The index of the current element being processed.
   - `array` *(optional)*: The array `map()` was called upon.

2. **thisArg** *(optional)*: A value to use as `this` when executing the callback function.

### **Return Value**
A new array with each element being the result of the callback function.

### **Key Features**
- The `map()` function does **not** mutate the original array.
- It always returns a new array of the same length as the original array.

### **Example Usage**

#### **Basic Example**
```javascript
const numbers = [1, 2, 3, 4];
const squared = numbers.map(num => num * num);
console.log(squared); // Output: [1, 4, 9, 16]
```

#### **Using Index and Original Array**
```javascript
const fruits = ['apple', 'banana', 'cherry'];
const detailedFruits = fruits.map((fruit, index) => `${index + 1}: ${fruit}`);
console.log(detailedFruits);
// Output: ['1: apple', '2: banana', '3: cherry']
```

#### **Using `thisArg`**
```javascript
const multiplier = {
  factor: 2,
};

const numbers = [1, 2, 3, 4];
const scaled = numbers.map(function(num) {
  return num * this.factor;
}, multiplier);

console.log(scaled); // Output: [2, 4, 6, 8]
```

### **Common Use Cases**
1. **Transforming Data**:
   - Convert an array of objects into a different format.
2. **Extracting Values**:
   - Extract specific properties from an array of objects.
3. **Chaining with Other Methods**:
   - Combine `map()` with `filter()` or `reduce()` for advanced data manipulation.

#### **Example: Extracting Properties**
```javascript
const users = [
  { id: 1, name: 'Alice' },
  { id: 2, name: 'Bob' },
  { id: 3, name: 'Charlie' },
];

const userNames = users.map(user => user.name);
console.log(userNames); // Output: ['Alice', 'Bob', 'Charlie']
```

### **Things to Note**
- `map()` is not meant for filtering or reducing the array. Use `filter()` or `reduce()` for those purposes.
- If the callback function does not return a value (or returns `undefined`), the new array will contain `undefined` in the corresponding positions.

#### **Example of Returning Undefined**
```javascript
const numbers = [1, 2, 3, 4];
const result = numbers.map(num => {
  if (num > 2) console.log(num);
});

console.log(result); // Output: [undefined, undefined, undefined, undefined]
```

By understanding the behavior and flexibility of `map()`, you can efficiently transform and manipulate array data in JavaScript.

### Some Uses

- You can use it by referencing a already built function in it, but make sure that this function works with the same structure of the `map` function of taking the first parameter as the value you want to reformat or do the operation on and it will work automatically.

```js
let a = ['1','2','3','5'];

const y = (x) => {
  return x**2;
}

let b = a.map(y);
console.log(b); // [ 1, 4, 9, 25 ]
```

---

# `filter`
#filter

The **`filter()`** method of [`Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) instances creates a [shallow copy](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) of a portion of a given array, filtered down to just the elements from the given array that pass the test implemented by the provided function, so the output of the given callback function must be a true or false boolean value.

***Syntax:***
```js
const newArray = array.filter(callbackFn, thisArg);
```

***Parameters:***

- **`callback`**: A function that tests each element of the array. It accepts the following parameters:
    
	- `element`: The current element being processed.
    
	- `index` (optional): The index of the current element.
    
	- `array` (optional): The array `filter` was called upon.

- **`thisArg`** (optional): A value to use as `this` when executing the `callback`.

***Return Value:***

- A new array containing all the elements that passed the test. If no elements pass, an empty array is returned.

***Example 1:***
```js
const numbers = [1, 2, 3, 4, 5, 6];
const evenNumbers = numbers.filter(num => num % 2 === 0);
console.log(evenNumbers); // [2, 4, 6]
```

***Example 2: (on objects)***
```js
const users = [
  { name: 'Alice', age: 25 },
  { name: 'Bob', age: 17 },
  { name: 'Charlie', age: 30 }
];

const adults = users.filter(user => user.age >= 18);
console.log(adults); 
// [{ name: 'Alice', age: 25 }, { name: 'Charlie', age: 30 }]
```

***Example 3: (Using `thisArg`)***
```js
const multiplier = {
  factor: 2,
  multiply(x) {
    return x * this.factor;
  }
};

const numbers = [1, 2, 3, 4, 5];
const result = numbers.filter(function(num) {
  return num > 2;
}, multiplier);

console.log(result); // [3, 4, 5] -- Elements greater than 2
```

# `reduce`

The **`reduce()`** method is an array method in JavaScript that applies a **reducer function** (a function that processes each element) on an array, ultimately reducing it to a single value (e.g., a sum, product, or other cumulative result).

***Syntax:***
```js
array.reduce(callback(accumulator, currentValue, currentIndex, array), initialValue);
```

### Parameters:

- **`callback`**: A function that is executed on each element in the array.
    - **`accumulator`**: The accumulated value from the previous iteration. It is updated with the return value of the callback.
    - **`currentValue`**: The current element being processed in the array.
    - **`currentIndex`** (optional): The index of the current element being processed.
    - **`array`** (optional): The original array that `reduce()` was called on.

- **`initialValue`** (optional): A value to use as the first argument to the first call of the `callback`. If not provided, the first element of the array is used as the initial value, and the iteration starts from the second element.

### Example 1: Summing an Array of Numbers
```js
const numbers = [1, 2, 3, 4, 5];
const sum = numbers.reduce((accumulator, currentValue) => accumulator + currentValue, 0);
console.log(sum);  // Output: 15
```
- Here, `accumulator` starts at `0` (the `initialValue`), and for each element, it adds the `currentValue` to it, resulting in the sum of the array.

### Example 2: Finding the Maximum Value in an Array
```js
const numbers = [1, 2, 3, 4, 5];
const max = numbers.reduce((accumulator, currentValue) => {
  return currentValue > accumulator ? currentValue : accumulator;
}, numbers[0]);
console.log(max);  // Output: 5
```
 
 - **Explanation of `currentValue > accumulator ? currentValue : accumulator`:**

	In the context of the `reduce()` function, this expression is comparing the `currentValue` (the current item in the array) with the `accumulator` (the previous value that is being accumulated during the iteration).

	- If **`currentValue` is greater than `accumulator`**, the expression returns `currentValue`.
	- Otherwise, it returns the `accumulator`.

### Example 3: Flattening an Array of Arrays
```js
let a = [[1, 2], [3, 4], [5, 6]];
result = a.reduce((x, y) => [...x, ...y], []);
console.log(result);
```

### Example 4: Counting Occurrences of Items
```js
1
```