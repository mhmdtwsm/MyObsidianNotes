---
tags:
  - chmod
  - chown
  - chgrp
  - ls
  - find
  - grep
  - privilege_escalation
  - umask
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
chown {the_other_user} file
```

---

## Granting Ownership to an Individual User

`chgrp` is to transfer ownership of a file from one group to another.

```bash
chgrp {the_other_group} file
```

---

## Checking Permissions

If you want to check the permissions of a file or a directory you can just view it with `ls` and add the flag `-l` for longer  description.

```bash
ls -l {the_directory_the_file_in_it}
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

**And a disclaimer, the root can do anything, the root user has already all the permissions of everything, reading and writing.. all of it, the permissions is made to limit the access of directories and files for other users in the system.**

---
## Changing Permissions

*Only a root user or the file’s owner can change permissions. Changing permissions can be done with `chmod` (or change mode).*
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

The thing of the decimal notation is representing every available permission with `1` and every empty permission with `0`, so every permission will match a number in the octal numerical system, so for example if we want to set a full permission to a user we can do it by just typing `7` from the previous table and so on.

**Example**:
```r
# we want to do this permission with the decimal notation
-rwxrwxr--
```

```bash
# The solution
chmod 774 file
```



#### Changing Permissions with `UGO`

*The symbolic method is often referred to as the `UGO` syntax, which stands for user (or owner), group, and others.*

`UGO` syntax is very simple. Enter the `chmod` command and then the users you want to change permissions for, providing u for user, g for group, or o for, followed by one of three operators:
- **`+`** for adding permission
- **`-`** for removing permission
- **`=`** sets a permission so if you gave it `rw` it will add the read and write permissions and removes the execute, so it enables the given and disables or removes the ungiven

followed by the permission's character like `r` or `w` or `x`

**Example**:

```bash
# Remove the write permission from the user
chmod u-w file
# Add write and excute permissions to the user
chmod u+rx file
# We can enable the read and write and disable the excution by this command
chmod u=rw file
# you can also do it for the user and group and other at the same command
chmod u=rw,g+x,o-rwx file
# or if you want to add the same permissions for 2 of them you can do this
chmod ug+rwx,o=r file
```


#### Giving Root Execute Permission on a New Tool

If you downloaded a new tool from internet the Linux by default give a `666` permission for files and `777` for directories, so you wouldn't execute it, the solution is to just change the permissions and add the execute permission to it.

```bash
chmod u+x tool
# Or
chmod 766 tool
```

---
## Setting More Secure Default Permissions with`umask`

The `umask` method represents the permissions you want to remove from the base permissions on a file or directory to make them more secure, so basically it is made to reduce the permissions that will be given by default to any file or directory, This means that when a new file or directory is created, its permissions are set to the default value minus the
value in `umask`.

| New File | New Directory |                               |
| :------: | ------------- | ----------------------------- |
|   666    | 777           | Linux Base permissions        |
|   022    | 022           | umask                         |
|   644    | 755           | Default resulting permissions |

In `Kali`, as with most `Debian` systems, the `umask` is preconfigured to `022`, meaning the `Kali` default is `644` for files and `755` for directories.

The `umask` value is not universal to all users on the system. Each user can set a personal default `umask` value for the files and directories in their personal `~/.profile` file. 

---
## Special Permissions

*Linux has three special permissions that are slightly more complicated. These special per- missions are set user ID or `SUID`, set group ID or `SGID`.*

#### Granting Temporary Root Permissions with `SUID`

*Basically, the `SUID` bit says that any user can execute the file with the permissions of the owner but those permissions don’t extend beyond the use of that file.* 

In practice the `SUID` is added as an additional bit in the permissions of the file, and you can add it by `chmod`, and it is add i the `chmod` by adding `4` before the regular permissions.

```bash
# The symbolic method
chmod u+s file
# The numerical method
chmod 4644 file
```

#### Granting the Root User’s Group Permissions `SGID`

*`SGID` also grants temporary elevated permissions, but it grants the permissions of the file owner’s group, rather than of the file’s owner.*

This means that, with an `SGID` bit set, someone without execute permission can execute a file if the owner belongs to the group that has permission to execute that file.

This means that, with an `SGID` bit set, someone without execute permission can execute a file if the owner belongs to the group that has permission to execute that file.
#### **So, it is basically if we have the same `SGID` of a directory every thing under it is OURS!**

![](THM_Learning_era/Linux_basics_for_Hackers_book/photo/comubun.jpg)

And like the `SUID`, the `SGID` done by adding a bit by the `chmod`, but that time the bit is `2` 

```bash
# The symbolic method
chmod g+s file
# The numerical method
chmod 2755 file
```

#### Special Permissions, Privilege Escalation, and the Hacker

*these special permissions can be used to exploit Linux systems through privilege escalation, whereby a regular user gains root or sysadmin privileges and the associated permissions. With root privileges, you can do anything on the system.*

In this case, we want to find files anywhere on the file system, for the root user or other sysadmin, with the permissions `4000`. To do this, we can use the following find command:
```bash
find / -user root -perm -4000
```
With this command, we ask Kali to start looking at the whole file system with the `/` syntax. It then looks everywhere below `/` for files that are owned by root, specified with user root, and that have the `SUID` permission bit set `-perm -4000`.

The last command used for privilege escalation in the [Mr.Robot room](Mr.Robot.md) noted in another file, let's break through it:

```bash
# Mr.Robot's Machine Command
find / -perm +6000 2>/dev/null | grep '/bin/'
```
- `/` it is searching in the root directory, in the whole system.
- `-perm +6000` it is specifying with this flag a specific permission which is `6000`, the `6000` is a value that describes 2 things:
	- 1st thing the first bit `6`, it describes the Combined `SUID` and `SGID` bits (4 + 2).
	- 2nd the other 3 bits `000` represent no permissions.
	- So it is searching for only root user executable binaries, that have both an `SUID` and `SGID` permissions.
- `2>/dev/null` this makes all the error messages of the searching disappears.
- `|` this redirects all the output of this command to the next command
- `grep '/bin/'` this filters all the output and gets for you only the results from the `/bin/` directory so you can use one of the binaries in it for the Privilege Escalation. 
- `grep`, `| `, `find` were mentioned in [ch1](Ch1_Sec2_Basic_Commands.md), and the purpose of `/bin/` directory was mentioned in [ch1](Ch1_Sec1_The_File_System_Structure_Basics.md).
---
