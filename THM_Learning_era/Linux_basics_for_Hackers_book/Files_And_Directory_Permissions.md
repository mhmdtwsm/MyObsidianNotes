---
tags:
  - chmod
  - chown
  - chgrp
---
## File and Directory Permissions

*Not every user of a single operating system should have the same level of access to files and directories. **Linux** has methods for securing file and directory access.*

---

## Some bold lines...

- **The ==*root*== user can do basically anything on the system.**
- **The other users on the system have more limited capabilities and permissions and almost never have the access that the root user has.**
- **These other users are collected into ==groups==**
- **The idea is to put people with similar needs into a group that is granted relevant permissions; then each member of the group inherits the group permissions.**
- **==The root== user is part of the ==root group== by default.**
- **Each user have three levels of permissions :**
	1. Read - r
	2. Write - w
	3.  execute - x
	
- **When a file is created, typically the user who created it is the owner of the file, and the owning group is the user’s current group. The owner of the file can grant various access privileges to it.**

---

## Granting Ownership to an Individual User

 To move the ownership of a file from a user to another:

```bash
chown {the other user} file
```

---

## Granting Ownership to an Individual User

`chgrp` is to transfer ownership of a file from one group to another.

```bash
chgrp {the other group} file
```

---

## Checking Permissions

If you want to check the permissions of a file or a directory you can just view it with `ls` and add the flag `-l` for longer  description.

```bash
ls -l {the directory the file in it}
```

Example: 

```r
$ ls -l

total 4
-rw-r--r-- 1 salah secur 6 Jun 22 18:24 file
```
1. **First**, let's break into this: `-rw-r--r--`
	- The first character `-` , this space meant to describe the file type, and the **`-` Hyphen** means that it is a normal file, if it was a `d` that says that it is a directory, and we can call this the **type character**.
	- The next nine characters: `rw-r--r--` describes the permissions of the *owner*, *group*, *others* in order, and we can call them the **permissions characters**.
2. **Second**, this part: `salah secur` it describes that `salah` is the **owner** of the file and `secur` is the **group** that have access to that file.
3. This part: `6 Jun 22 18:24 file`, the `6` is the **size** of the file, and this: `Dec 5 10:47` is when the file was created or last modified, and this: `file` is the name of the file.
4. last thing the **dashes** or **hyphens** or `-`, if it is in the permission characters it will say that this entity does not have this permission, so it refers to empty or non.

**And *a disclaimer*, the root can do anything, the root user has already all the permissions of everything, reading and writing.. all of it, the permissions is made to limit the access of directories and files for other users in the system **

---
## Changing Permissions

Only a root user or the file’s owner can change permissions. Changing permissions can be done with `chmod` (or change mode).
#### Changing Permissions with Decimal Notation
The table of representing the permissions

| Binary | Octal | rwx |
| :----- | ----- | --- |
| 000    | 0     | --- |
| 001    | 1     | --x |
| 010    | 2     | -w- |
| 011    | 3     | -wx |
| 100    | 4     | r-- |
| 101    | 5     | r-x |
| 110    | 6     | rw- |
| 111    | 7     | rwx |

