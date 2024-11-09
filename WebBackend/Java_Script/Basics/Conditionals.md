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

***Note that...***
	When you have a series of `if...else` statements, only the first condition that evaluates to `true` will run its code block, and the rest will be ignored. If you want more than one condition to run, use separate `if` statements instead of combining them in an `if...else` chain.

