# Declaring a variable

First thing. How to make a variable?

The `let` or `var` keyword is the way to make a variable and assign a value to it.
There are a crucial difference between these 2.

```js
let v = 5 //numerical
let v = "txt" // text
let v = [1, 2, 3] //list
```

**You can also make a variable without giving it a value.**

```js
let v1;
```

**You can also declare more than one variable at the same line.**

```js
let v1, v2, v3;
```

**Or giving them values...**

```js
let v1 = 1, v2 = 2, v3 = 3;
```

**Example:**
```js
let v1 = 3;
let v2 = 4;
let v3 = v1 + v2;
```

**Example**(dog age calculator):
```js
// assume that your age equal 7 times a dog age
// calculate your age as a dog
let my_age = 21;
let my_age_dog = myage * 7;
//now printing it on console
console.log(my_age_dog);
```

**Or to store an object.**
In the following example we store some sort of a pointer to the element with the ID `count` in the variable `v` so it is a pointer to an object, so every operation done on `v` is meant to be done on the object it is pointing to. It is an easy way to call elements from HTML page and manipulate it.  
```js
let v = document.getElementById("count");
```

## The difference between `let` and `var`

| Parameters                 | Var                                                                                  | Let                                                                                             |
| -------------------------- | ------------------------------------------------------------------------------------ | ----------------------------------------------------------------------------------------------- |
| Introduction in JavaScript | `var` has been a part of JavaScript since its inception.                             | `let` was introduced in the ES2015 (ES6) version of JavaScript.                                 |
| Scope                      | `var` is globally scoped.                                                            | `let` is block-scoped.                                                                          |
| Access and Declaration     | `var` can be declared and accessed globally.                                         | `let` can be declared globally, but its access is limited to the block in which it is declared. |
| Redeclaration              | Variables declared using `var` can be re-declared and updated within the same scope. | Variables declared with `let` can be updated but not re-declared within the same scope.         |
| Hoisting                   | `var` is hoisted and initialized as `undefined`. Can be used before its declaration. | `let` is hoisted but not initialized, causing an error if used before declaration.              |
| Loops                      | `var` does not create a new scope in loops, which may lead to unexpected behavior.   | `let` creates a new scope in each loop iteration, making it safer in loops.                     |

### Hoisting for `var` and `let`

- **`var`**: Hoisted to the top of its scope and initialized with `undefined`. You can use a `var` variable before its declaration, but it will be `undefined` until the line where it’s assigned.

- **`let`**: Also hoisted but not initialized. Using a `let` variable before its declaration results in a `ReferenceError`.

```js
console.log(a); // undefined
var a = 5;

console.log(b); // ReferenceError: Cannot access 'b' before initialization
let b = 10;
```

### `var` and `let` in the loops

```js
// Var loop
for (var i = 0; i < 3; i++) {
  setTimeout(() => console.log(i), 1000); // After 1 second, logs: 3, 3, 3
}
// Let loop
for (let i = 0; i < 3; i++) {
  setTimeout(() => console.log(i), 1000); // After 1 second, logs: 0, 1, 2
}
```
### Using `var`

1. **Memory Address**: When you use `var`, JavaScript creates _one memory address_ for the variable `i` outside or at the start of the loop.
2. **Iteration**: Each loop iteration reuses that _same memory address_, simply updating its value.
3. **Asynchronous Capture**: Since `setTimeout` is asynchronous, it captures the _memory address_ of `i` (not the value at that specific moment). By the time `setTimeout` runs, the loop has completed, so `i` has the final value of `3` in that _one shared address_. As a result, each `console.log(i)` points to this same address and displays `3`.

### Using `let`

1. **Memory Address**: With `let`, JavaScript creates a _new memory address_ for `i` in each iteration.
2. **Iteration**: Each iteration gets its own _unique memory address_ for `i`, holding the specific value for that iteration.
3. **Asynchronous Capture**: When `setTimeout` is called, it captures the _memory address for that iteration’s `i`_. Since each iteration has its own unique address, each `setTimeout` retains the correct `i` value from its specific iteration. So when `setTimeout` runs, it reads each unique address and correctly outputs `0`, `1`, and `2`.

***SoO0oo..... to be clear***:
- **`var`** shares a single memory address across all iterations.
- **`let`** creates a new memory address for each iteration, preserving the values for asynchronous functions like `setTimeout`.
- 