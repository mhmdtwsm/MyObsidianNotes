# **`for` Loop**

The classic `for` loop allows you to execute a block of code a certain number of times. It is ideal when you know how many times the loop should run.

***Syntax:***
```js
for (initialization; condition; increment) {
  // code to be executed
}
```
- **Initialization**: Sets the loop variable.
- **Condition**: Tests the loop condition (evaluated before each iteration).
- **Increment**: Updates the loop variable.

***Example:***
```js
for (let i = 0; i < 5; i++) {
  console.log(i); // Outputs 0, 1, 2, 3, 4
}
```

# **`for...of` Loop**

The `for...of` loop is used to iterate over the **values** of iterable objects (e.g., arrays, strings, maps). It provides a simpler syntax when you don't need the index.

***Syntax:***
```js
for (const item of iterable) {
  // code to be executed
}
```

***Example:***
```js
const arr = [10, 20, 30];
for (const value of arr) {
  console.log(value); // Outputs 10, 20, 30
}
```

# **`for...in` Loop**

The `for...in` loop is used to iterate over the **keys** (or properties) of an object. It is not recommended for arrays, as it might return unexpected results due to prototype chain properties.

***Syntax:***
```js
for (const key in object) {
  // code to be executed
}
```

***Example:***
```js
const obj = { a: 1, b: 2, c: 3 };
for (const key in obj) {
  console.log(key); // Outputs 'a', 'b', 'c'
}
```

# **`while` Loop**

The `while` loop executes a block of code as long as the specified condition is true. The condition is evaluated **before** each iteration.

***Syntax:***
```js
while (condition) {
  // code to be executed
}
```

***Example:***
```js
let i = 0;
while (i < 5) {
  console.log(i); // Outputs 0, 1, 2, 3, 4
  i++;
}
```

# `do...while` Loop

The `do...while` loop is similar to the `while` loop, but the condition is evaluated **after** each iteration. This ensures that the code block is executed **at least once**, even if the condition is false on the first iteration.

***Syntax:***
```js
do {
  // code to be executed
} while (condition);
```

***Example:***
```js
let i = 0;
do {
  console.log(i); // Outputs 0, 1, 2, 3, 4
  i++;
} while (i < 5);
```


- **`for`**: When you know the number of iterations in advance.

- **`for...in`**: When you need to loop over the keys of an object.

- **`for...of`**: When you want to iterate over the values of an iterable object (like an array).

- **`while`**: When you want to repeat an action as long as a condition is true, and you are unsure of the number of iterations.

- **`do...while`**: When you want to execute the code block at least once before checking the condition.
