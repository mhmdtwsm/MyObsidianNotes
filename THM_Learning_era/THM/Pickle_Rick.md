---
tags:
  - less
  - cd
  - grep
  - web
  - directories
  - nmap
  - gobuster
---
Link:https://tryhackme.com/r/room/picklerick

---

This machine is an easy one.

### Getting the scans done


#### Scanning with `nmap`

```bash
nmap -p22,80 -sV -sC -T4 -Pn -oA {IP}
```
![[../../photos/Pickle_Rick/nmap.png]]

#### Scanning with `gobuster`
```bash
gobuster dir -u 10.10.2.43 -w /usr/share/dirbuster/wordlists/directory-list-2.3-medium.txt
```
 ![[../../photos/Pickle_Rick/gobuster.png]]

---

### Getting to the site directories

- While searching in the source of the home page we will find a username for login
- While trying to look for something in `robots.txt` file you will find the password, ironically it's `wubbalubbadabadab`
- Enter the directory of the login page `/login.php` and get to the portal

### The commands field

This command field directly executes commands on Ricks computer, So let's open a reverse shell with python -Note that you can get the code of the reverse shell from [revshell](https://www.revshells.com/)-

Now we're in! 