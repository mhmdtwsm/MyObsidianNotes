---
tags:
  - Comparison
  - Logical_Operators
---

# **Comparison Operators**

Comparison operators are used to compare two values and return a Boolean result (`true` or `false`).


**1. Less Than (`<`)**

- Returns `true` if the left operand is less than the right operand.
```js
let a = 5;
let b = 10;
conssole.log(a < b); // true
```

**2. Greater Than (`>`)**

- Returns `true` if the left operand is greater than the right operand.
```js
let a = 10;
let b = 5;
conssole.log(a > b); // true
```

**3. Less Than or Equal To (`<=`)**

- Returns `true` if the left operand is less than or equal to the right operand.
```js
let a = 5;
let b = 5;
conssole.log(a <= b); // true
```

**4. Greater Than or Equal To (`>=`)**

- Returns `true` if the left operand is greater than or equal to the right operand.
```js
let a = 10;
let b = 5;
conssole.log(a >= b); // true
```

**5. Equal To (`==`)**

- Returns `true` if the operands are equal, performing type coercion if necessary.
```js
let a = 5;
let b = "5";
conssole.log(a == b); // true (type coercion)
```

**6. Strict Equal To (`===`)**

- Returns `true` if the operands are equal and of the same type.
```js
let a = 5;
let b = "5";

let result = a === b; // false (different types)
```

---

# Logical Operators

Logical operators are used to combine Boolean expressions and return a Boolean result.

**1. Logical AND (`&&`)**

- Returns `true` if both operands are `true`.
- Returns `false` otherwise.

```js
let a = true;
let b = false;
let result = a && b; // false
```



**2. Logical OR (`||`)**

- Returns `true` if at least one operand is `true`.
- Returns `false` if both operands are `false`.

```js
let a = true;
let b = false;
let result = a || b; // true
```


**3. Logical NOT (`!`)**

- Inverts the Boolean value of its operand.
- Returns `true` if the operand is `false`.
- Returns `false` if the operand is `true`.

```js
let a = true;
let result = !a; // false
```

---

# Combining between them

```js
let a = 10; 
let b = 5;
let c = 15; 
// Combining comparison operators with logical AND: 
let isBetween = a > b && a < c; // true
```

