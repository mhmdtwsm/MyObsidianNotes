
# JS Data types

JavaScript has several fundamental data types, which can be divided into two categories: **primitive types** and **non-primitive types**.

## Primitive Data Types

| Type                                                                                                | `typeof` return value | Object wrapper                                                                                        |
| --------------------------------------------------------------------------------------------------- | --------------------- | ----------------------------------------------------------------------------------------------------- |
| [Null](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#null_type)           | `"object"`            | N/A                                                                                                   |
| [Undefined](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#undefined_type) | `"undefined"`         | N/A                                                                                                   |
| [Boolean](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#boolean_type)     | `"boolean"`           | [`Boolean`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Boolean) |
| [Number](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#number_type)       | `"number"`            | [`Number`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number)   |
| [BigInt](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#bigint_type)       | `"bigint"`            | [`BigInt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/BigInt)   |
| [String](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#string_type)       | `"string"`            | [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String)   |
| [Symbol](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#symbol_type)       | `"symbol"`            | [`Symbol`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol)   |

### **Number**

Used for any type of numerical value, including integers and floating-point numbers.
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



### **`BigInt`**
Represents integers of arbitrary precision, useful for very large integers that go beyond the safe integer limit in JavaScript (`2^53 - 1`).
```js
let bigNumber = 123456789012345678901234567890n;
```
---
### Strings
[**Look Here**](Strings.md)

---
### **Boolean**
Holds either `true` or `false`, typically used in conditional logic.
```js
let correct = true;
```

### **Undefined**
A variable that has been declared but not assigned a value.
```js
let value;
console.log(value); // undefined
```

### **Symbol**
Represents a unique identifier, commonly used for object properties that should not conflict with other properties.
```js
let uniqueKey = Symbol('key');
```

***Some notes:***
- All primitive types, except [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null), can be tested by the [`typeof`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof) operator. `typeof null` returns `"object"`, so one has to use `=== null` to test for `null`.

- All primitive types, except [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) and [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/undefined), have their corresponding object wrapper types, which provide useful methods for working with the primitive values.




## Non-Primitive (Complex) Data Types

**Objects**: Used to store collections of data or more complex entities. Objects include arrays, functions, and other structures that store values.

### **Object literal**
In JavaScript, an **object literal** is a way to create an object directly using a set of curly braces `{}` with key-value pairs. This approach is simple and commonly used to create objects with specific properties and values without needing a constructor function or class.
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

### **Array**.
```js
let numbers = [1, 2, 3, 4];
```

### **Function**
```js
function greet() { console.log("Hello World"); }
console.log(typeof greet); // It should return function
```


---
# [Dynamic and weak typing](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#dynamic_and_weak_typing)

## Dynamic type language

JavaScript are not directly associated with any particular value type, and any variable can be assigned (and re-assigned) values of all types. 

So feel free to break the memory and collect garbage as you like because you are free to use the same reference with different places to point to at the memory in each time you change the variable between non-primitive and primitive types or between a non-primitive and another non-primitive type.

```js
let a = 5;
a = "Hi";
a = [1, 2, 3, 4];
```

- **Initial Declaration (`let a = 5;`)**:
    
    - `a` is assigned the value `5`, which is stored in memory as a **primitive** (number type).
    - Since `5` is a primitive, it’s stored directly in the memory associated with `a`.
- **Reassignment (`a = "Hi";`)**:
    
    - `a` is reassigned to the string `"Hi"`, another primitive type.
    - JavaScript simply updates the value of `a` to `"Hi"`. No new memory reference is created for `a`; instead, `a` now points to the new value `"Hi"` in its existing memory location.
- **Reassignment to an Array (`a = [1, 2, 3, 4];`)**:
    
    - Now, `a` is assigned an array, `[1, 2, 3, 4]`, which is a **non-primitive type** (object).
    - Objects and arrays in JavaScript are reference types, so `a` now points to a new memory location where the array `[1, 2, 3, 4]` is stored.
    - If you change `a` to point to another array or object, it starts pointing to a new reference in memory. The previous reference is "forgotten" by `a`, and if no other variable is pointing to it, JavaScript’s garbage collector will eventually clean it up.


## Weakly typed

JavaScript is also a weekly typed language, which means it allows implicit type conversion when an operation involves mismatched types, instead of throwing type errors.

**JavaScript is a weakly typed language**, it means that it doesn’t strictly enforce the types of variables. Instead, it automatically converts (or **coerces**) values from one type to another when they’re used in expressions or operations that require a different type. This **implicit type conversion** happens silently, without throwing any errors, even if the types don't match up.

Implicit coercions are very convenient, but can create subtle bugs when conversions happen where they are not expected, or where they are expected to happen in the other direction (for example, string to number instead of number to string). 

***For [symbols](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#symbol_type) and [BigInts](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Data_structures#bigint_type), JavaScript has intentionally disallowed certain implicit type conversions.***

```js
console.log("5" - 1); // 4, because "5" (string) is coerced to 5 (number)
console.log("5" + 1); // "51", because 1 (number) is coerced to "1" (string)
console.log(true + 2); // 3, because true is coerced to 1
console.log(null + 5); // 5, because null is coerced to 0
console.log("5" == 5); // true, because "5" is coerced to 5
console.log(0 == false); // true, because false is coerced to 0
console.log("5" === 5); // false, no type coercion occurs
```

