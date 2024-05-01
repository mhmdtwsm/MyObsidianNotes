---
tags:
  - Linux
  - find
  - grep
  - mv
---

# Linux_Strength_Training

link: https://tryhackme.com/r/room/linuxstrengthtraining

---

# task 1
empty
# task 2

* the [find ](Linux_basics_for_Hackers_book/Basic_commands)command
* to use a file in the name of it ==> `-` by adding `--` before the name of the file and putting the file name between double quotes
  ```bash
  mv -- "-MoveMe.txt" "-march folder"/
  cd -- "-march folder"/
```  
* the file in a specific day like ==> 9/12
```bash   
find ~/workflows -type f -newermt 2016-09-11 ! -newermt 2016-09-13
```
* to get the flag if the file is a one line:
	1. open the file with nano
	```bash
nano /home/topson/workflows/xft/eBQRhHvx
```
	2. hit `CTRL + w` and enter `Flag` 
# task 3
* go to this ==>[[Basic_Commands#Directories and files manipulating commands]]
* how to transfer a file from your device to an ssh connected device
  ```bash
# mv {file_location} {username}@{ip}:{location}
mv /home/james/Desktop/script.py john@192.168.10.5:/home/john/scripts
```
* to move all entities in a folder to another directory
  ```bash
mv folder1/* folder2/
```
