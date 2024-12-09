
*An **anonymous function** is a function without a name. It is typically used where a function is required temporarily or as an argument to higher-order functions. Anonymous functions are commonly used in scenarios like callbacks, event handling, and immediately invoked function expressions (`IIFE`).*

***Syntax:***
```js
function (parameter1, parameter2, ...) {
  // function body
}
```

## ***Examples:***

1. **Anonymous Function as a Callback**: Anonymous functions are often used as arguments in higher-order functions:

```js
setTimeout(function () {
  console.log("This is an anonymous function!");
}, 1000);
```

2. **Immediately Invoked Function Expression (`IIFE`)**: Anonymous functions can be immediately executed using an `IIFE`:

```js
(function () {
  console.log("IIFE executed immediately!");
})();
```

3. **Storing Anonymous Functions in Variables**: Anonymous functions can be assigned to variables or constants:

```js
const greet = function (name) {
  return `Hello, ${name}!`;
};
console.log(greet("John")); // Output: Hello, John!
```

4. **Anonymous Function in Array Methods**: Anonymous functions are commonly used in array methods like `map`, `filter`, and `forEach`:

```javascript
const numbers = [1, 2, 3, 4, 5];
const squared = numbers.map(function (num) {
  return num * num;
});
console.log(squared); // Output: [1, 4, 9, 16, 25]
```


## **When to Use**

- As **callbacks** in asynchronous or higher-order functions.
    
- In **event listeners** for simplicity:
```js
document.getElementById("btn").addEventListener("click", function () {
  console.log("Button clicked!");
});
```