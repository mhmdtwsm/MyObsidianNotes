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
- **The statement**, which is `if`, `else if`, `else`, and they are working like: `if` something is `true` do this code block, if something else is `true` and the above condition is `false`(`else if`) do this code block, if all of the conditions above are `false` (`else`) do this last code block

- **The logical condition**, which is a phrase written in [**comparison and logical operators**](Comparison_And_Logical_Operators.md)  and it returns `true` or `false`.

- **The code block** which you want to be executed if the condition is `true`

***Note that...***
	When you have a series of `if...else` statements, only the first condition that evaluates to `true` will run its code block, and the rest will be ignored. If you want more than one condition to run, use separate `if` statements instead of combining them in an `if...else` chain.