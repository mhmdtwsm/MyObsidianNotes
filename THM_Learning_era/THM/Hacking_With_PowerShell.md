---
tags:
  - windows
  - powershell
  - Get
---
HLink: https://tryhackme.com/r/room/powershell

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
used to pass output from one _`cmdlet`_ to another. A major difference compared to other shells is that `Powershell` passes an object to the next _`cmdlet`_ instead of passing text or string to the command after the pipe.

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

When a _`cmdlet`_ outputs a lot of information, you may need to sort it to extract the information more efficiently. You do this by pipe-lining the output of a _`cmdlet`_ to the `Sort-Object` _`cmdlet`_.

```powershell
Get-Process | Sort-Object Id
```

---

# Enumeration

***This Task is based on research, So my answers might by a mixture between googling and chatGPTing The answers***


#### How many users are there on the machine?
```powershell
Get-LocalUser | Measure-Object
```

- **`Get-LocalUser`**: This cmdlet retrieves a list of all local user accounts on the machine.
- **`Measure-Object`**: This `cmdlet` calculates the properties of objects, like counting them, summing them, or finding the minimum or maximum value.

#### Which local user does this SID(S-1-5-21-1394777289-3961777894-1791813945-501) belong to?
```powershell
Get-LocalUser | Where-Object -Property SID -eq 'S-1-5-21-1394777289-3961777894-1791813945-501'
```

#### How many users have their password required values set to False?
```powershell
(Get-LocalUser | Where-Object -Property PasswordRequired -eq $false).Count
```

This command filters the local users based on the `PasswordRequired` property and counts how many have it set to `False`.

In `PowerShell`, `$false` is a built-in variable that represents the Boolean value "false." It is used in logical comparisons and conditions.

#### How many local groups exist?

```powershell
Get-LocalGroup | measure
```
Or you can do it with the `.Count` and  make some effort to read the article mentioned below.
```powershell
(Get-LocalGroup).Count
```

`Get-LocalGroup`: Retrieves all local security groups on the system.

An article of the difference between `.Count` Property and `Measure-Object`:
[Measure vs Count vs $i++](https://dmitrysotnikov.wordpress.com/2008/01/18/measure-vs-count-vs-i/) 


#### What command did you use to get the IP address info?
```powershell
Get-NetIPAddress
```
`Get-NetIPAddress`: Retrieves the IP address configuration for all network interfaces on the system.

#### How many ports are listed as listening?

```powershell
(Get-NetTCPConnection -State Listen).Count
```
**`Get-NetTCPConnection`**: This `cmdlet` retrieves information about `TCP` connections on the local computer. It shows details such as the local and remote IP addresses, ports, and the state of each connection (e.g., Established, Listen, `CloseWait`).
`-State Listen` parameter to filter and show only those `TCP` connections that are in the "Listen" state, meaning they are waiting for incoming connections.
##### Explanation of `TCP` Connection States:

1. **`Listen`**: The server is waiting for incoming connections.

2. **`Established`**: The connection is active and data can be transmitted.

3. **`CloseWait`**: The connection is being closed but is waiting for the local application to acknowledge the termination request.

4. **`TimeWait`**: The connection is closed but is waiting for any delayed packets to arrive to ensure that the connection can be safely reestablished if necessary.

