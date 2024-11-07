
**Used for any type of numerical value, including integers and floating-point numbers.**

```js
let a = 10
let b = 10.1
console.log(typeof a)
console.log(typeof b)
```

- The JavaScript `Number` type is a [double-precision 64-bit binary format IEEE 754](https://en.wikipedia.org/wiki/Double_precision_floating-point_format) value, like `double` in Java or C#.

- It is capable of storing positive floating-point numbers between $2^{-1074}$ ([`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE)) and $2^{1023} × (2 - 2^{-52})$ ([`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE)) as well as negative floating-point numbers of the same magnitude, but it can only safely store integers in the range $-(2^{53} − 1)$ ([`Number.MIN_SAFE_INTEGER`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_SAFE_INTEGER)) to $2^{53} − 1$ ([`Number.MAX_SAFE_INTEGER`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_SAFE_INTEGER)).

- Values outside the re presentable range are automatically converted:
	- Positive values greater than [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE) are converted to `+Infinity`.
	- Positive values smaller than [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE) are converted to `+0`.
	- Negative values smaller than -[`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE) are converted to `-Infinity`.
	- Negative values greater than -[`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE) are converted to `-0`.

- 


## Math Library

The JavaScript Math library provides a set of mathematical functions and constants to perform various calculations.

```JS
// Example usage:
let randomNumber = Math.random(); // Generate a random number between 0 and 1
let roundedNumber = Math.round(3.14); // Round 3.14 to the nearest integer
let squareRoot = Math.sqrt(16); // Calculate the square root of 16
let power = Math.pow(2, 3); // Calculate 2 raised to the power of 3
let piValue = Math.PI; // Access the value of pi

let numbers = [10, 5, 20, 3, 15]; 
let minNumber = Math.min(...numbers); // Output: 3 
let maxNumber = Math.max(...numbers); // Output: 20
```
