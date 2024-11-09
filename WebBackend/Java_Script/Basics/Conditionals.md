---
tags:
  - if
  - else
  - switch
  - ternary_operators
---

# Conditionals

The conditional statements is questions that accepts only a binary answer with `true` or `false`, and based on the answer it does a specific code block.

The **`if...else`** statement executes a statement if a specified condition is [truthy](https://developer.mozilla.org/en-US/docs/Glossary/Truthy). If the condition is [falsy](https://developer.mozilla.org/en-US/docs/Glossary/Falsy), another statement in the optional `else` clause will be executed.

## `if...else`

The `if...else` conditions is made out of 3 things:

- **The `if`, `else if`, and `else` statements**:

	- `if` checks if a condition is `true` and runs its code block if it is.
	- `else if` checks another condition only if the previous `if` was `false`.
	- `else` runs its code block if all previous conditions are `false`.

- **The logical condition**, which is a phrase written in [**comparison and logical operators**](Comparison_And_Logical_Operators.md)  and it returns `true` or `false`.

- **The code block** which you want to be executed if the condition is `true`

*Syntax*
```js
if (condition1)
  statement1
else if (condition2)
  statement2
else if (condition3)
  statement3
// …
else
  statementN
```

*Example*
```js
let score = 75;

if (score >= 90) {
    console.log("Grade: A");   // Runs if score is 90 or above
} else if (score >= 80) {
    console.log("Grade: B");   // Runs if score is between 80 and 89
} else if (score >= 70) {
    console.log("Grade: C");   // Runs if score is between 70 and 79
} else {
    console.log("Grade: F");   // Runs if score is below 70
}
```

***Note that...***
	When you have a series of `if...else` statements, only the first condition that evaluates to `true` will run its code block, and the rest will be ignored. If you want more than one condition to run, use separate `if` statements instead of combining them in an `if...else` chain.

```js
let score = 85;
let attendance = 92;

if (score >= 80) {
    console.log("Passed based on score");   // This will run
}
if (attendance >= 90) {
    console.log("Eligible for attendance award");  // This will also run
}
```