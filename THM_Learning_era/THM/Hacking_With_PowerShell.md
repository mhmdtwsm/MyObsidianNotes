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

### `Select-Object`

is pulling out the properties from the output of a _`cmdlet`_ and creating a new object.
```powershell
Get-Process | Select-Object ProcessName
```

### `Where-Object`

to filter based on the value of properties.

The operators of `Where-Object`
- `-Contains`: if any item in the property value is an exact match for the specified value
- `-EQ`: if the property value is the same as the specified value
- `-GT`: if the property value is greater than the specified value

The example picks all the processes with name `svchost`:
```powershell
Get-Process | Select-Object Id, ProcessName | Where-Object -Property ProcessName -eq svchost
```

###  `Sort-Object`

When a _cmdlet_ outputs a lot of information, you may need to sort it to extract the information more efficiently. You do this by pipe-lining the output of a _`cmdlet`_ to the `Sort-Object` _`cmdlet`_.

```powershell
Get-Process | Sort-Object Id
```