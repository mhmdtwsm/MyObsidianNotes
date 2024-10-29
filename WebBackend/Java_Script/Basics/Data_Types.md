
# JS Data types

JavaScript has several fundamental data types, which can be divided into two categories: **primitive types** and **non-primitive types**.

## Primitive Data Types

**Number**: Used for any type of numerical value, including integers and floating-point numbers.
```js
let a = 10
let b = 10.1
console.log(typeof a)
console.log(typeof b)
```

**`BigInt`**: Represents integers of arbitrary precision, useful for very large integers that go beyond the safe integer limit in JavaScript (`2^53 - 1`).
```js
let bigNumber = 123456789012345678901234567890n;
```

**String**: Used for text data, written inside quotes (`''`, `""`, or `` ` ` `` for template literals).
```js
let name = "Alice"; 
let greeting = `Hello, ${name}!`; // Used here to evaluate a thing in the middle of a string
```

**Boolean**: Holds either `true` or `false`, typically used in conditional logic.
```js
let correct = true;
```

**Undefined**: A variable that has been declared but not assigned a value.
```js
let value;
console.log(value); // undefined
```

**Symbol**: Represents a unique identifier, commonly used for object properties that should not conflict with other properties.
```js
let uniqueKey = Symbol('key');
```

## Non-Primitive (Complex) Data Types

**Objects**: Used to store collections of data or more complex entities. Objects include arrays, functions, and other structures that store values.

**Object literal**. In JavaScript, an **object literal** is a way to create an object directly using a set of curly braces `{}` with key-value pairs. This approach is simple and commonly used to create objects with specific properties and values without needing a constructor function or class.
```js
let person = {
  name: "Alice",
  age: 25,
  isStudent: true
};
console.log(person.name);     // Output: "Alice"
console.log(person.age);      // Output: 25
console.log(person.isStudent); // Output: true
```

**Array**.
```js
let numbers = [1, 2, 3, 4];
```

**Function**
```js
function greet() { console.log("Hello World"); }
console.log(typeof greet); // It should return function
```

---
# 