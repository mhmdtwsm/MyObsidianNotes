
### What is the process?
*A process is simply a program that’s running and using resources.*

Once a hacker takes control of a target system, they might want to find and stop a certain process, like an antivirus application or firewall. To do so, the hacker would first need to know how to find the process. The hacker might also want to set a scanning script to run periodically to find vulnerable systems.

---

### Viewing Processes
*The primary tool for viewing the processes is the `ps`*

```bash
ps
```

The Linux Kernel, the core of the operating system gives every process an *ID* and this *ID* called `PID`, so every process in the Linux system has a name and a `PID`, The `ps` command doesn't give a lot of information unless you give the required flags, it just gives information about the processes running on this terminal by the logged in user, so it's a must to run `ps` command with flags to get information about all the processes running for all the users, and adding that flags doesn't require adding `-` "a dash" and everything in lower case.

```bash
ps aux
```

The output is so big right? use [`grep`](Ch1_Sec2_Basic_Commands.md) and get information about only the processes you need.

```bash
ps aux | grep {process_name}
```

Another tool to use like is `top`, by default `top` orders the processes by the `PID` and the Linux gives the `PID` in this order because that is the order of the processes started with, so the process that has `PID= 1` it means it is the first process started in the system, we can reorder the process by which of them consumes more of the hardware, unlike the `ps`.

```bash
top
```

and there is a `top` good alternatives like `btop` or `htop`.

---

### Managing Processes

#### Changing Process Priority with `nice`, `renice`
*The `nice` command is to easily set the priority of a process by the level of its niceness*

The niceness default level is *0*, the range of the niceness value is *[-20, +19]*, the concept of naming this command like that is to tell the level of tour niceness and how you are tolerant in consuming resources, so when your niceness value is higher your process is less priority, and when your process consumes a lot of resources and have a big priority it has a lower niceness value. When a process is started, it inherits the nice value of its parent process. The owner of the process can lower the priority of the process but cannot increase its priority. Of course, the superuser or root user can arbitrarily set the nice value to whatever they please.

To run a process with a priority:
```bash
nice -n {nice_value[-20,19]} {the_command_to_start} 
```

To change the priority of a running process:
```bash
renice {nice_value[-20,19]} {PID}
```

#### Killing Processes with `kill`

The  kill signals

| Signal name | Number<br>for option | Description                                                                                                                                                                                                                                                                  |
| :---------- | -------------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| SIGHUP      | 1                    | This is known as the Hangup (`HUP`) signal. It stops the designated process and restarts it with the same `PID`.                                                                                                                                                             |
| SIGINT      | 2                    | This is the Interrupt (`INT`) signal. It is a weak kill signal that<br>isn’t guaranteed to work, but it works in most cases.                                                                                                                                                 |
| SIGQUIT     | 3                    | This is known as the core dump. It terminates the process<br>and saves the process information in memory, and then it<br>saves this information in the current working directory to<br>a file named core. (The reasons for doing this are beyond<br>the scope of this book.) |
| SIGTERM     | 15                   | This is the Termination (`TERM`) signal. It is the kill command’s default kill signal.                                                                                                                                                                                       |
| SIGKILL     | 9                    | This is the absolute kill signal. It forces the process to stop by sending the process’s resources to a special device, `/dev/null`.                                                                                                                                         |

The `kill` command need the type of the signal and the `PID` of the process
```bash
kill -{the_signal_number} {PID}
```

---

### Scheduling Processes
*As a hacker you need to use the scheduled processes for your side, you can a use a scheduled script with some high permissions to open ports for you or run a daemon for yourself*

To do scheduling processes search for `crond` and `at`.
The `at` command:
```bash
at 7:20am
```
and specify the location of the script in the input mode.

also look for the scheduled processes in [Linux_Agency_THM](../THM_CTF/LinuxRoom-2.md) 

