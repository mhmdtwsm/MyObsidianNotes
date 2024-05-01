
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

#### 