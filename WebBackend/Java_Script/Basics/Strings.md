---
tags:
  - substring
  - lenght
  - concat
---

## What is String?

Used for text data, written inside quotes (`''`, `""`, or `` ` ` `` for template literals).

```js
let name = "Alice"; 
let greeting = `Hello, ${name}!`; // Used here to evaluate a thing in the middle of a string
```

- The [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) type represents textual data and is encoded as a sequence of 16-bit unsigned integer values representing [`UTF-16` code units](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

- Each element in the string occupies a position in the string. The first element is at index `0`, the next at index `1`, and so on.

- The [length](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) of a string is the number of `UTF-16` code units in it, which may not correspond to the actual number of Unicode characters.

	- But certain characters—particularly some emojis and characters outside the Basic Multilingual Plane (`BMP`)—are represented by **two code units** instead of one.
	
	- the `length` of a string (measured in `UTF-16` code units) does not always equal the **visible or logical number of characters** in that string.

- JavaScript strings are immutable. This means that once a string is created, it is not possible to modify it.
---

## String methods

1. A **substring** of the original using [`substring()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring)

*Documentation:*

The `substring()` method in JavaScript is used to extract a portion of a string between two specified indices (positions). It returns a new string without modifying the original string.
```
substring(indexStart)
substring(indexStart, indexEnd)
```

*Example:*
```js
const str = 'Mozilla';

console.log(str.substring(1, 3));
// Expected output: "oz"

console.log(str.substring(2));
// Expected output: "zilla"
```

2. A concatenation of two strings using the concatenation operator (`+`) or [`concat()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat). 

`concat()` *Documentation:*

The **`concat()`** method of [`Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) instances is used to merge two or more arrays. This method does not change the existing arrays, but instead returns a new array.
```
concat() 
concat(value1) concat(value1, value2) 
concat(value1, value2, /* …, */ valueN)
```

`concat()` *Example*:
```js
let a = [1,2,3,4];
let b = [5];
let c = [6];
console(a.concat(b, c)) // It will print [1, 2, 3, 4 ,5 ,6]
```

`concat()` strings *Example*:
```js
let a = "Hello";
let b = "World";
let c = a + b // The + operator
let d = a.concat(' ', b) // Using concat method
