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
and it's done

### Other tools

There are other tools like `metasploit` and `msvenom` which you can make connection with but with different methods.

___
