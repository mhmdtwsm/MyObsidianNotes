---
tags:
  - set
  - env
  - more
  - grep
---


*Variables are simply strings in key-value pairs. Generally, each pair will look like KEY=value. In cases where there are multiple values, they will look like `KEY=value1:value2`. As with most things in Linux, if there are spaces in the value, it needs to be contained in quotation marks.*

Technically, there are two types of variables: *shell* and *environment*. *Environment variables* are process-wide variables built into your system. *Shell variables*, on the other hand, are typically listed in lowercase and are only valid in the shell they are set in.

---

### Viewing and Modifying Environment Variables


You can view all your default environment variables by `env`
```bash
env
```
Note that, Environment variables are always uppercase, as in HOME, PATH, SHELL.

#### Viewing All Environment Variables
To view all environment variables, including shell variables, local variables, and shell functions such as any user-defined variables and command aliases, use the `set` command, and pipe it to what ever text manipulation you want like `grep` or `more`

To print all the variables [`more`](Ch2_TEXT_MANIPULATION.md):
```bash
set | more
```
To filter a specific variable from it [`grep`](Ch1_Sec2_Basic_Commands.md):
```bash
set | grep
```
---
#### Changing Variable Values for a Session
*The `HISTSIZE` variable contains the value of the number of commands to store in the history file. Sometimes, you won’t want your system to save past commands, perhaps because you don’t want to leave any evidence of your activity on your own system or a target system. In that case, you can set the `HISTSIZE` variable to `0` so the system won’t store any of your past commands.*

So, now the target is to assign a new value to `HISTSIZE` on the session we're in
```bash
HISTSIZE=0
```
And **bang!** just like that. Now, when you try to use the up- and down-arrow keys to recall your commands, nothing happens because the system no longer stores them.

---
#### Making Variable Value Changes Permanent
