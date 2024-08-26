---
tags:
  - Linux
  - exploit
  - ps
  - env
  - kernel
---
Link: https://tryhackme.com/r/room/linprivesc

---

# Enumeration

These are some ways to know the system more to get weak points in it.

### `hostname`

To get the host name basically
```bash
hostname
```
---
### `env`

Will get the environment variables of the shell you are in.
```bash
env
```

==Note==

---
###  `unmae`

Will print system information giving us additional detail about the kernel used by the system.

```bash
uname
```
---
### `/proc/version`

The proc filesystem `(procfs)` provides information about the target system processes.

```bash
/proc/version
```
---
### `/etc/issue`

Systems can also be identified by looking at the `/etc/issue` file. This file usually contains some information about the operating system but can easily be customized or changed.

```bash
/etc/issue
```
---
### `ps`

The `ps` command is an effective way to see the running processes on a Linux system. Typing `ps` on your terminal will show processes for the current shell.

```bash
ps -aux
```

The `aux` option will show processes for all users (a), display the user that launched the process (u), and show processes that are not attached to a terminal (x).

---
### `Id`

The `id` command will provide a general overview of the user’s privilege level and group memberships.

```bash
id
```
---
### `/etc/passwd`

Reading the `/etc/passwd` file can be an easy way to discover users on the system.
```bash
cat /etc/passwd
```

we can get only the users by this command:
```bash
cat /etc/passwd | cud -d ":" -f 1
```

and we can `grep` on it:
```bash
cat /etc/passwd | grep root
```
---
### `history`

Looking at earlier commands with the `history` command can give us some idea about the target system and, albeit rarely, have stored information such as passwords or usernames.

---
### `ifconfig`

The `ifconfig` command will give us information about the network interfaces of the system.

```bash
ifconfig
```
---
### `netstat`

Following an initial check for existing interfaces and network routes, it is worth looking into existing communications. The `netstat` command can be used with several different options to gather information on existing connections.

- `netstat -a`: shows all listening ports and established connections.
	- `netstat -at` or `netstat -au` can also be used to list `TCP` or `UDP` protocols.

- `netstat -l`: list ports in “listening” mode.
- `netstat -s`: list network usage statistics by protocol
	- with the `-t` or `-u` options to limit the output to a specific protocol.
		- `netstat -tp`: list connections with the service name and `PID` information.
- 