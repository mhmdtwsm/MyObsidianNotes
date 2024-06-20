---
tags:
  - CTF
  - reverse
  - RevShell
---
----------------------
Link: https://tryhackme.com/r/room/mrrobot
write-ups:
1. https://youtu.be/FxeFGkRhR3Q?si=yI84qwF4P7MExMCc
2. https://medium.com/@DRX_Sicher/writeup-mr-robot-ctf-1baf5f20e6f4

----

# Preparing


#### 1 - doing the scan stuff

```bash
nmap -A {ip}
```

```bash
gobuster dir -u {ip} -w /usr/share/dirbuster/wordlists/directory-list-2.3-small.txt
```

---
#### 2 - important directories 

`/license` , `/robot` , `login`

---
#### 3 - get to `robot`

you will find the first flag in the file text in the `robot` directory, and another doc file with a word list

----

#### 4 - Login-page

- Go and login in the `/login` directory with the password you will find in `/license` directory - and scroll down in the page to find it-
- Get to the appearance menu in word press and go to editor and open any templte and add the `php reverse shell code` from the following link and make sure to add  your `IP` and the port and go to the link of the php you edit it `{ip}/404.php`:
	https://github.com/pentestmonkey/php-reverse-shell/blob/master/php-reverse-shell.php
- and listen with 
```bash
nc -lvnp 6969
```
- change your shell to a normal shell
```bash
python -c 'import pty;pty.spawn("/bin/bash")'
```
- print this file ---> `password.raw-md5` and crack the `md5` in the file with john the ripper
```bash
echo "c3fcd3d76192e4007dfb496cca67e13b" | tee hash && john --format=raw-md5 --wordlist=/usr/share/wordlists/rockyou.txt hash
```
- and the flag is `822c73956184f694993bede3eb39f959`

-----

#### 5 -  Search for the root accessed binaries

- Find the binaries that have a root privileges  
```bash
find / -perm +6000 2>/dev/null | grep '/bin/'
```
- The hint on the site says one thing `nmap` and the `nmap` appears to have a root privileges, so what we want to do is to open an interactive shell to access the root directory of the machine from the `namp`
	- here is a link of a site to open an interactive shell, search with the name of the tool and the condition of your shell. the link --->
		https://gtfobins.github.io/gtfobins/nmap/
	- after that access the root directory `cd /root/` and take the keygit config --global user.name