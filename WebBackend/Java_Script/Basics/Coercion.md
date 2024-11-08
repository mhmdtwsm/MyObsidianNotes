---
tags:
  - String
  - Number
  - Boolean
---


JavaScript is a dynamically typed language, which means it automatically determines the data type of a variable at runtime. This can lead to implicit type coercion, where JavaScript converts values from one data type to another.

- **Numeric Conversions:**
    
    - **To Number:** #Number
        - `Number()` function: Explicitly converts a value to a number.
        - Unary `+` operator: Implicitly converts a string to a number if possible.
    
    ```js
    let num1 = "10";
    let num2 = Number("5");
    
    let sum = num1 + num2; // "105" (string concatenation)
    let difference = +num1 - num2; // 5 (numeric subtraction)
    ```
    
- **Boolean Conversions:** #Boolean
    
    - **To Boolean:**
        - `Boolean()` function: Explicitly converts a value to a Boolean.
        - Implicit conversion in conditional statements and logical operators.
    
    ```js
    let isTrue = Boolean(1); // true
    let isFalse = Boolean(0); // false
    
    if (1) { // True, as 1 is truthy
        console.log("This will execute");
    }
    ```
    
- **String Conversions:** #String
    
    - **To String:**
        - `String()` function: Explicitly converts a value to a string.
        - Implicit conversion in string concatenation.
    
    
    ```js
    let num = 42;
    let str = String(num); // "42"
    
    let message = "The number is " + num; // "The number is 42"
    ```
