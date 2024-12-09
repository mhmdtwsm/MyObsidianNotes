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

**Global Scope Execution**:

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

