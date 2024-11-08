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

---

## Arithmetic Operators

### Addition (`+`)

- **Number + Number:** Adds the numerical values.
    
    ```js
    5 + 3 // Output: 8
    ```
    
- **String + String:** Concatenates the strings.
    
    ```js
    "Hello" + "World" // Output: "HelloWorld"
    ```
    
- **String + Number or Number + String:** Converts the number to a string and concatenates.
    
    ```js
    "Age: " + 30 // Output: "Age: 30"
    30 + " years" // Output: "30 years"
    ```
    

### Subtraction (`-`), Multiplication (`*`), Division (`/`)

- Works with numbers and converts numeric strings to numbers for calculations.
    
    ```js
    10 - 2 // Output: 8
    "10" * 2 // Output: 20
    "20" / "4" // Output: 5
    ```
    
- Non-numeric strings result in `NaN`.

    ```js
    "hello" - 3 // Output: NaN
    ```

---

## Comparison Operators

### Equality and Inequality

- **Loose Equality (`==`)**: Compares values after type conversion if necessary.
    
    JavaScript
    
    ```
    5 == "5" // true (string "5" is converted to number 5)
    0 == false // true (false is converted to 0)
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    
- **Strict Equality (`===`)**: Compares values without type conversion.
    
    JavaScript
    
    ```
    5 === "5" // false (different types)
    true === 1 // false (different types)
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    
- **Loose Inequality (`!=`)**: Compares values after type conversion.
    
    JavaScript
    
    ```
    5 != "5" // false (types are converted and values match)
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    
- **Strict Inequality (`!==`)**: Compares values without type conversion.
    
    JavaScript
    
    ```
    5 !== "5" // true (different types)
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    

### Greater Than/Less Than

- **Greater Than (`>`), Less Than (`<`)**: Compares numbers directly.
    
    JavaScript
    
    ```
    5 > 2 // true
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    
- **Greater Than or Equal To (`>=`), Less Than or Equal To (`<=`)**: Compares numbers directly.
    
    JavaScript
    
    ```
    5 >= 5 // true
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    
- **String Comparison**: Compares lexicographically (dictionary order).
    
    JavaScript
    
    ```
    "apple" > "banana" // false
    "5" > "20" // true (compared as strings)
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    
- **Mixed Types**: Attempts to convert both to numbers for comparison.
    
    JavaScript
    
    ```
    "10" > 5 // true (string "10" is converted to number 10)
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    

## Logical Operators

### Logical AND (`&&`)

- Returns the first falsy value or the last value if all are truthy.
    
    JavaScript
    
    ```
    true && "Hello" // "Hello"
    0 && "Hello" // 0
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    

### Logical OR (`||`)

- Returns the first truthy value or the last value if all are falsy.
    
    JavaScript
    
    ```
    false || "Hello" // "Hello"
    "" || 0 || null || "default" // "default"
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    

### Logical NOT (`!`)

- Inverts the Boolean value.
    
    JavaScript
    
    ```
    !true // false
    !0 // true
    !"" // true
    ```
    
    يُرجى استخدام الرمز البرمجي [بحذر](/faq#coding).
    

**Type Coercion**

- **Falsy Values**: 0, "", `null`, `undefined`, `NaN`, and `false`.
- **Truthy Values**: Any non-falsy value.