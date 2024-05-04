---
tags:
  - grep
  - chmod
  - su
  - encode
  - decode
  - hashing
  - base64
---
# Linux Agency

***NOTE***: this room need to be done by some knowledge in [This room ](LinuxRoom-1.md)
link : https://tryhackme.com/r/room/linuxagency

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