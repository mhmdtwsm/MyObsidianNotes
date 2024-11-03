---
tags:
  - substring
  - concat
  - length
  - toUpperCase
  - toLowerCase
  - replace
  - charAt
---
``
# What is String?

Used for text data, written inside quotes (`''`, `""`, or `` ` ` `` for template literals).

```js
let name = "Alice"; 
let greeting = `Hello, ${name}!`; // Used here to evaluate a thing in the middle of a string
```

## Some Notes to consider

- The [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) type represents textual data and is encoded as a sequence of 16-bit unsigned integer values representing [`UTF-16` code units](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

- Each element in the string occupies a position in the string. The first element is at index `0`, the next at index `1`, and so on.

- The [length](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length) of a string is the number of `UTF-16` code units in it, which may not correspond to the actual number of Unicode characters.

	- But certain characters—particularly some emojis and characters outside the Basic Multilingual Plane (`BMP`)—are represented by **two code units** instead of one.
	
	- the `length` of a string (measured in `UTF-16` code units) does not always equal the **visible or logical number of characters** in that string.

- JavaScript strings are immutable. This means that once a string is created, it is not possible to modify it.
---

## String methods

### [`substring()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring)
#substring 

The `substring()` method in JavaScript is used to extract a portion of a string between two specified indices (positions). It returns a new string without modifying the original string.

***Syntax***
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

### [`concat()`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat)a string
#concat 

The **`concat()`** method of [`Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) instances is used to merge two or more arrays. This method does not change the existing arrays, but instead returns a new array.

***Syntax***
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
```

### `.lenght`
#length 

The **`length`** data property of an [`Array`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) instance represents the number of elements in that array. The value is an unsigned, 32-bit integer that is always numerically greater than the highest index in the array.

```js
let a = [1,2,3,4,5];
let b = "mhmd";
console.log(a.lenght); // Should return 5
console.log(b.length); // Shoule return 4
```

### `toUpperCase`
#toUpperCase

The **`toUpperCase()`** method of [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) values returns this string converted to uppercase.
```js
const sentence = 'The quick brown fox jumps over the lazy dog.';

console.log(sentence.toUpperCase());
// Expected output: "THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG."
```

### `toLowerCase`
#toLowerCase

The **`toLowerCase()`** method of [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String) values returns this string converted to lower case.
```js
const sentence = 'The quicK BrOwn Fox JUMPS OVEr the lazy dog.';

console.log(sentence.toLowerCase());
// Expected output: 'the quick brown fox jumps over the lazy dog.'
```

### `replace`
#replace

The `replace()` method in JavaScript is used to create a new string by replacing some or all matches of a pattern within a given string. The `pattern` can be a simple string or a more complex regular expression. ***It remove only the first occurrence of the word or pattern you want.*** 

***Syntax***
```
replace(pattern, replacement)
```

*Example*
```js
let a = "Hello Ladies, Hello Gentelmen"
console.log(a.replace("Hello", "Hi")) // Hi Ladies, Hello Gentelmen
```

#### `replaceAll`

There is `replaceAll` if you want to replace all occurence of a word or a pattern in the whole string.
```js
let a = "Hello Ladies, Hello Gentelmen"
console.log(a.replaceAll("Hello", "Hi")) // Hi Ladies, Hi Gentelmen
```

### `charAt`
#charAt

**The `charAt()` method** is used to access a specific character within a string. It takes an index as an argument, which represents the position of the character you want to retrieve. The index starts from 0. If the index is out of bounds, it returns an empty string.
```js
let str = "hello"; 
let firstChar = str.charAt(0); // 'h'
```

But there are the **Bracket Notation** which is: `a[0]`, so why you use `charAt` for strings?
- **`charAt()`:** Returns an empty string when the index is out of bounds.
- **Bracket Notation:** Returns `undefined` for out-of-bounds indices.

```js
let str = "hello";

// Using charAt()
let char1 = str.charAt(0); // 'h'
let char2 = str.charAt(5); // '' (empty string)

// Using bracket notation
let char3 = str[0]; // 'h'
let char4 = str[5]; // undefined
```

### **Template Literals**

Template literals provide a concise and readable way to embed variables and expressions within strings. They are enclosed in backticks **(\`\`)** and use `${}` to denote expressions.

***Syntax***
```js
`${expression1} ${expression2} ...`
```

*Example*
```js
let name = "Alice"; 
let age = 30; 
let message = `My name is ${name} and I am ${age} years old.`; console.log(message); // Output: My name is Alice and I am 30 years old.
```

# A Challenge

**This text: `"Hello World"`, How can you make it reversed?**

***In this question  the used methods  are three.***

### `Split()`
#split

The `split()` method is used to split a string into an array of substrings based on a specified separator.
```js
string.split(separator, limit)
```
- `separator`: The delimiter or regular expression used to split the string.
- `limit`: Optional. The maximum number of elements to include in the resulting array.

It will be used to convert the string to array to use the array methods on it.
```js
let a = "Hello World"
a = a.split("")
```
and the parameter `""` is an empty string which will tell the program to break the string at each character making it return an array of characters of the string.

### `reverse()`
#reverse 

The `reverse()` method reverses the order of elements in an array in place. It modifies the original array directly.

It will be used to ***reverse*** the array we made with the `split()` method.
```js
let a = "Hello World"
a = a.split("") // split
a = a.reverse() // reverse
```

