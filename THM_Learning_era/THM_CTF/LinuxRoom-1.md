---
tags:
  - Linux
  - find
  - grep
  - mv
  - "#base64"
  - hashing
  - "#John_the_Ripper"
  - cat
  - tac
  - encode
  - decode
  - hash
  - gpg
  - crack
  - sql
---

# Linux_Strength_Training

link: https://tryhackme.com/r/room/linuxstrengthtraining

---

# task 1
empty
# task 2: find

* the [find ](../Linux_basics_for_Hackers_book/Ch1_Sec2_Basic_Commands.md)command
* to use a file in the name of it ==> `-` by adding `--` before the name of the file and putting the file name between double quotes
```bash
  mv -- "-MoveMe.txt" "-march folder"/
  cd -- "-march folder"/
```  
----

find a file in a specific day like ==> 9/12
```bash   
find ~/workflows -type f -newermt 2016-09-11 ! -newermt 2016-09-13
```
---

how to get the flag if the file is a one line: open the file with nano
```bash
nano /home/topson/workflows/xft/eBQRhHvx
```
and hit `CTRL + w` and enter `Flag`

----

# task 3: files

look at the [basic commands](../Linux_basics_for_Hackers_book/Ch1_Sec2_Basic_Commands.md)

---

how to transfer a file from your device to an ssh connected device
  ```bash
# mv {file_location} {username}@{ip}:{location}
mv /home/james/Desktop/script.py john@192.168.10.5:/home/john/scripts
```
---

to move all entities in a folder to another directory
```bash
mv folder1/* folder2/
```
---

# task 4: Hashing

##### The hash is a unique key produced by some algorithm to get a unique and irreversible equivalent to some content.
**videos to explain it:**
- https://www.youtube.com/watch?v=cczlpiiu42M
- *The Mesh Ebrahim Hegazy:*
  https://www.youtube.com/watch?v=4TBStYr8t4g&list=PLv7cogHXoVhXvHPzIl1dWtBiYUAL8baHj&index=13
___

- `MD5` and `SHA1` are both examples of weak hash algorithms which have been proven to be vulnerable to something known as **hash collision attacks** 
	- **Hash collision attacks** occur when a hash function, like `MD5`, produces the same hash for different content. Consequently, multiple entities might share the same hash, posing a danger to those whose hashes are leaked.
---
**Now** to analyse the hash you can get a tool like `haiti`
- to install it
```bash
sudo gem install haiti-hash
```
- to use it
```bash
#haiti {hashcode}
haiti c05e35377b5a31f428ccda9724a9dfbd0c5d71dccac691228d803c78e2e8da29
```
**Or** there is another tool called `hash-identifier`
```bash
sudo apt install hash-identifier
hash-identifier c05e35377b5a31f428ccda9724a9dfbd0c5d71dccac691228d803c78e2e8da29
```

---
**The way to crack the hash code**
`John the Ripper` is a tool used to crack passwords from word lists
```bash
# john --format={the format you find in haiti} --wordlist={location of the word list} {the location of the hashcode-file}
john --format=raw-sha256 --wordlist=ww.mnf hash1_1601657952696.txt 
```
---
**How to take a file from the ssh machine**
```bash
# scp {user}@{ip}:{location} {location in your machine}
scp sarah@10.10.23.80:/home/sarah/system\ AB/db/ww.mnf /home/p/
```
---
# task 5: encoding

#### The encoding is a function that produce keys of a content but that function you can reverse.

just take look about the (en/de)coding: https://www.base64encode.net/

---

**to decode the content of the file:**
```bash
# the -d flag is for decode
base64 -d encoded.txt
```
---
**to take the hash code and get the keyword:**
- *look at the doc of* **task 4**

---
# task 6: `gpg`

##### The encryption has two  types:
1. Symmetric: which is we have one key between us to decode and encode
2. Asymmetric: in which we have 2 different keys or methods, 1 for decoding, and the other for encoding.
#### Encryption methods like:
1. AES: The Advanced Encryption Standard (AES) is a symmetric block encryption algorithm. It can use cryptographic keys of sizes 128, 192, and 256 bits.
2. DES: The Data Encryption Standard (DES) is block encryption that works at the bit level. The plaintext is broken down into blocks of 64 bits.
#### What is `gpg`?
GNU Privacy Guard, is a free and open-source software that provides encryption and digital signature capabilities. It's used for securing communication and data integrity.

---

##### How to encrypt with `gpg` tool?
```bash
#gpg --cipher-algo [encryption method] [encryption type]  [file to encrypt]
gpg --cipher-algo AES-256 --symmetric file.txt
```

---
# task 7: Cracking through the `gpg`

#### Extract the hash from the `gpg` file and crack it with `JTR`
```bash
#extract the hash
# gpg2john [encrypted gpg file] > [filename of the hash you want to create]
gpg2john personal.txt.gpg > hash_file
```

***To crack that hash to get the password  of the `gpg` file  and take a look at the last task.***

---
#### some random trick to know
in this task it wanted to reverse the word-list so it used the command `tac` to do it, that command that print the list reversed, to pass the reversed text to another file to make a reversed file of the original we need to use the piping `|`, combined with the cat command. 
```bash
tac data.txt | cat > passy
```
this command passes the reversed list to an empty file called passy.
___
# task 8: SQL!
```sql
SELECT * FROM employees WHERE last_name LIKE '%Flag%';
```
---
# task 9 : 

it is a combination of all of the above have fun :)