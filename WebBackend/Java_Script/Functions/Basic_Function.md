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

## ## Function Expressions

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
