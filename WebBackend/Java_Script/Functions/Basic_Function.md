---
tags:
  - function
---

# Declaring a function

## Regular way

Declaring a function is easy, just type the keyword `function` and the name of it and the between circular brackets `()` but your parameters and enter the content between curly brackets `{}` .

***Syntax:***
```js
function _functionName_(_parameters_) {  
  // _code to be executed_  
}
```

***Example:***
```js
let s = "Hello World";
function hello(st){
console.log(st)
}
hello(s);
```

## Function Expressions

A JavaScript function can also be defined using an **expression**.

**A function expression can be stored in a variable:**
```js
const x = function (a, b) {return a * b};
```

**After a function expression has been stored in a variable, the variable can be used as a function:**
```js
const x = function (a, b) {return a * b};  
let z = x(4, 3);
```

## **Function Constructor**

The `Function` constructor in JavaScript allows you to dynamically create new functions at runtime. Unlike regular function declarations or expressions, functions created with the `Function` constructor are parsed when the constructor is called, not when the script is loaded.

***Syntax:***
```js
new Function([arg1[, arg2[, ...argN]],] functionBody)
```

- **`arg1, arg2, ..., argN`** _(Optional)_: Names of the arguments for the function. These should be valid JavaScript identifiers.

- **`functionBody`** _(Required)_: A string that represents the JavaScript code to be executed as the function's body.

***Example:***
```js
const add = new Function('a', 'b', 'return a + b;');
const result = add(5, 3); // result will be 8
```

### **Characteristics**

1. **Global Scope Execution**:

- Functions created using the `Function` constructor execute in the **global scope**.
- They do **not** have access to the local scope where they are defined.

```js
let x = 10;
function test() {
  let x = 20;
  const func = new Function('return x;');
  return func(); // Returns `undefined` because `x` in global scope is not defined
}
test();
```

2. **Dynamic Function Creation**:

- Useful for scenarios where the function logic needs to be dynamically generated.

```js
const operation = 'a * b';
const multiply = new Function('a', 'b', `return ${operation}`);
console.log(multiply(4, 5)); // Output: 20
```

3. **Security Risks**:
    
    - Using the `Function` constructor can expose your code to **security vulnerabilities** like code injection if the function body is derived from untrusted input.
    - Avoid using the `Function` constructor when working with user-provided data.

4. **Performance**:
    
    - Functions created this way are less efficient than regular functions because the function body must be parsed each time the `Function` constructor is called.

#### **When to Use**

- To create dynamic functions where the function body is determined at runtime.
- For meta-programming tasks, like dynamically generating or manipulating code.

#### **When to Avoid**

- When static functions suffice, as they are safer and more performant.
- When dealing with untrusted or user-generated data, to avoid security risks.

# CallBack

A **callback function** is a function passed as an argument to another function, which is then executed at a later point in time. Callbacks are widely used in JavaScript for handling asynchronous operations, event-driven programming, and higher-order functions.

#### **How It Works**

1. **Callback as an Argument**:
    - A function is passed as a parameter to another function.
2. **Execution**:
    - The "higher-order" function decides when to call (or execute) the callback.

***Syntax:***
```js
function higherOrderFunction(callback) {
  // Execute the callback
  callback();
}

function myCallback() {
  console.log("Callback executed!");
}

higherOrderFunction(myCallback);
```

## Uses

**Synchronous Callback**: Callback functions can execute immediately or at a specific point during the execution of a higher-order function:
```js
function greet(name, callback) {
  console.log(`Hello, ${name}`);
  callback();
}

greet("Alice", function () {
  console.log("This is a callback function!");
});
```

**Asynchronous Callback**: Commonly used for handling asynchronous operations, such as API calls or timers:
```js
setTimeout(function () {
  console.log("This message appears after 2 seconds.");
}, 2000);
```

**Event Listeners**: Event handling often uses callbacks to respond to user interactions:
```js
document
.getElementById("btn")
.addEventListener("click", function () {
  console.log("Button clicked!");
});
```

**Using Callbacks in Array Methods**: Callbacks are integral to array manipulation methods like `map`, `filter`, and `forEach`:
```js
const numbers = [1, 2, 3];
const doubled = numbers.map(function (num) {
  return num * 2;
});
console.log(doubled); // Output: [2, 4, 6]
```

## **Characteristics**

1. **Higher-Order Functions**:
    
    - The function receiving the callback is called a higher-order function.
    - Example: `setTimeout`, `addEventListener`, or custom functions.

2. **First-Class Functions**:
    
    - In JavaScript, functions are first-class citizens, meaning they can be assigned to variables, passed as arguments, or returned by other functions.

3. **Execution Control**:
    
    - Callbacks allow developers to control when certain parts of the code execute.


## **Best Practices**

1. **Use Named Callback Functions**:

```js
function printMessage() {
  console.log("Callback executed!");
}

setTimeout(printMessage, 1000);
```

2. **Limit Nesting**:
    - Keep nesting levels low. Use Promises or `async/await` for better readability.

3. **Prefer Arrow Functions for Simplicity**:

- For inline callbacks, arrow functions provide a concise syntax:

```js
setTimeout(() => console.log("Arrow function as callback!"), 1000);
```
