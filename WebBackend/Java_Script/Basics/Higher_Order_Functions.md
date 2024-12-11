---
tags:
  - map
---

# `map`
#map

The `map()` function is an array method in JavaScript used to create a new array by applying a provided callback function to each element of the original array.

To apply the change to the new array, the element that the callback function will return must be a true value thing neither it's value would not be added, and it would be in the case like the element deleted from the new array after applying the callback function on.

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

