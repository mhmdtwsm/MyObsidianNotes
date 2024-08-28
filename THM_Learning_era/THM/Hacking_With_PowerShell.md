---
tags:
  - windows
  - powershell
  - Get
---

# Some info to begin with...

- `Powershell` is the Windows Scripting Language and shell environment built using the `.NET`

- `Powershell` can execute `.NET` functions directly from its shell.

- Most `Powershell` commands, called _`cmdlets`,_ are written in `.NET`.

- the output of these _`cmdlets`_ are objects - making `Powershell` somewhat object-oriented.

- The normal format of a _`cmdlet`_ is represented using **Verb-Noun**
  - Example: `Get-Command`

---

# Basic Commands

### `Get-Help` 

displays information about a _`cmdlet`._
```powershell
Get-Help Get-ChildItem
```

Can also get the help for an alias
```powershell
Get-Help ls
```


### `Get-Command` 

gets all the _`cmdlets`_ installed on the current Computer.
```powershell
Get-command
```

And it allows for pattern matching.
```powershell
Get-Command Get-C* 
```

#### The Pipeline(`|`),
used to pass output from one _cmdlet_ to another. A major difference compared to other shells is that `Powershell` passes an object to the next _`cmdlet`_ instead of passing text or string to the command after the pipe.

The following will get The help of all the commands found in the result of the search:
```powershell
Get-Command Get-Ch* | Get-Help
```


