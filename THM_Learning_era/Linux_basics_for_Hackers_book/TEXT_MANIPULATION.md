---
tags:
  - sed
  - head
  - tail
  - nl
---

### In Linux, nearly everything you deal with directly is a file, and most often these will be text files.
---
#### A short note mentioned in the book

**Snort**, is a open-source Network Intrusion Detection System (NIDS) and Network Intrusion Prevention System (NIPS) developed by **Marty Roesch** in **Sourcefire**, now owned by **Cisco**. It is known for its effectiveness in detecting and preventing various types of network-based attacks and anomalies.
so, it is basically a defending system to catch naughty boys who is attacking the network.

to install it :
https://medium.com/@sajerestan/6-steps-to-installing-snort-on-kali-linux-aa0396b33b33
---
#### Viewing head and tail of a file
`head`, this command displays the first 10 lines of a file by default.
```bash
head file
```
If you want to see more than 10 lines, add ==>`-` with the the number you want.
```bash
head -20 file
```
Now, the `tail` is the last 10 lines
```bash
tail file
```
And as a `head` command the tail can view more than 10 lines
```bash
tail -20 file
```
you can do that with head and tail
```bash
tail -n+5 file | head -n 3
```

---
#### Numbering the Lines

##### Sometimes—especially with very long files—we may want the file to display line numbers. 

To display a file with line numbers, we use the `nl` command.
```bash
nl file
```

---
#### Filtering Text with grep

[already mentioned.](Basic_Commands.md)

---

#### Using sed to Find and Replace

`sed`(*stream editor*) command lets you search for occurrences of a word or a text pattern and then perform some action on it.

```bash
sed s/mysql/MySQL/g snort.conf > snort2.conf
```
**lets break through the code:**
- `sed`: This is the command itself, standing for "stream editor." It's used for text manipulation.
- `s`: This is a **sed** command modifier that indicates a substitution
  **(to rewrite the given word)** operation.
- `mysql`: This is the pattern or text string that sed will search for in the file.
- `MySQL`: This is the replacement string that sed will use when it finds the pattern `mysql`.
- `g`: This flag means "global," which tells `sed` to replace all occurrences of the search pattern in each line. Without `g`, `sed` would only replace the first occurrence in each line.
	- you can replace `g` with a number like 3 so you can choose the third occurrence for example  
- `snort.conf`: This is the input file from which sed will read and perform the substitution.
- `>`: This is a redirection operator that directs the output of the sed command to a new file.
- `snort2.conf`: This is the name of the new file where the modified output will be stored.
---
#### Viewing Files with more and less

`more` is a command to view files
```bash
more file
```

`less` is a command to view file with more options
```bash
less file
# and to search inside the file just click ==> / and write the name
```
---
