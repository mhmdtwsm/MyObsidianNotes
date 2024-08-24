---
tags:
  - set
  - env
  - more
  - grep
  - echo
  - PATH
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
*When you change an environment variable in a bash shell session, the change is temporary and will be lost when you close the terminal. To make changes permanent, use the `export` command. This ensures new processes inherit the exported variables.*

Environment variables are strings, so it's wise to save their contents before modifying them. For example, to change the `PS1` variable (which controls the prompt display), save its current value to a text file in your home directory with this command:
```bash
echo $HISTSIZE> ~/valueofHISTSIZE.txt
```
This way, you can always undo your changes. If you want to be even more cautious and create a text file with all the current settings, you can save the output of the set command to a text file with a command like this one
```bash
set> ~/valueofALLon01012019.txt
```
Now, we can make a permanent change to `HISTSIZE` by this command
```bash
HISTSIZE=1200
export HISTSIZE
```

This code snippet will set your `HISTSIZE` variable’s value to 1,000 and export it to all your environments.

Note that, `export` command was already used in [Linux Agency](../THM/LinuxRoom-2.md) room on [`tryhackme`](https://tryhackme.com/r/room/linuxagency) to export to the `PATH` variable the path of the `su` and `bash` commands to run them normally.

---
### Changing Your Shell Prompt
```bash
PS1="World's Best Hacker: #"
export PS1
```
---
### Changing Your PATH

The `PATH` variable is crucial in your environment as it tells the shell where to look for commands like `grep`, `ls`, and `echo`. These commands are usually found in directories like `/usr/local/sbin` or `/usr/local/bin`. If a command isn't in any of the directories listed in your PATH, you'll get a "command not found" error, even if the command exists elsewhere.

To see which directories are in your `PATH`, use:
```bash
echo $PATH
```
This will output something like:
```bash
`/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin`
```
Directories in PATH are separated by colons (:). Always add `$` before the variable name to access its content.
#### Adding to the PATH Variable

To add a new binaries or commands to run you must add their directory to the `PATH` variable, to do that enter this command:
```bash
# PATH=$PATH:{directory_of_your_binaries}
PATH=$PATH:/root/newhackingtool
```
This command is like `x=x+1` it gets the content of the current `PATH` with  this symbol:`$` and add to it the new directory and adds it back to a new `PATH` variable.

**Note**, *adding to `PATH` can be a useful technique for directories you use often, but be careful
not to add too many directories to your `PATH` variable. Because the system will have to
search through each and every directory in `PATH` to find commands, adding a lot of
directories could slow down your terminal and your hacking.*

---
#### A common mistake while adding to the `PATH` variable

Don't add  a directory to the `PATH` variable like this:
```bash
PATH=/root/newhackingtool
```
Because this way you will delete all the content of the variable and only keeping the directory you wanted to append to the variable, that made all the system commands disappears for this session, so no `ls` or `cd` or any command was working before just your command making this a disaster for the system

The right way to append a directory to `PATH` is like before:
```bash
PATH=$PATH:/root/newhackingtool
```

---
### Creating a User-Defined Variable

In Linux, you can create custom variables for advanced shell scripting or to save long commands you use frequently. To define a variable, use the syntax:
```bash
MYNEWVARIABLE="Hacking is the most valuable skill set in the 21st century"
```
To display the variable's value, use:
```bash
echo $MYNEWVARIABLE
```
If you want the variable to persist across sessions, export it. To delete a variable, including its value, use:
```bash
unset MYNEWVARIABLE 
```

After that, the `echo $MYNEWVARIABLE` command will return a blank line.