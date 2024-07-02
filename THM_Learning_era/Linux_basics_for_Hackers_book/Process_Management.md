
### What is the process?
*A process is simply a program that’s running and using resources.*

Once a hacker takes control of a target system, they might want to find and stop a certain process, like an antivirus application or firewall. To do so, the hacker would first need to know how to find the process. The hacker might also want to set a scanning script to run periodically to find vulnerable systems.

---

### Viewing Processes
*The primary tool for viewing the processes is the `ps`*

```bash
ps
```

The Linux Kernel, the core of the [operating]() system gives every process an *ID* and this *ID* called `PID`, so every process in the Linux system has a name and a `PID`, The `ps` command doesn't give a lot of information unless you give the required flags, it just gives information about the processes running on this terminal by the logged in user, so it's a must to run `ps` command with flags to get information about all the processes running for all the users, and adding that flags doesn't require adding `-` "a dash" and everything in lower case.

```bash
ps aux
```

The output is so big right? use [`grep`](Basic_Commands.md) and get information about only the processes you need.

```bash
ps aux | grep {process_name}
```