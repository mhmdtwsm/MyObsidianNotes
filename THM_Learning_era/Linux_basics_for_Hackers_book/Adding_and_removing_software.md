---
tags:
  - apt
  - apt-cahche
---

#### Searching for a Package

###### You can check whether the package you need is available from your *repository*, which is a place where your operating system stores information.

The `apt-cache` lets you see the *cache* data about packages that is stored locally on your machine, that data could be information about available packages, including their dependencies, descriptions, and versions.
- The `search` option is for searching in the cache data
```bash
apt-cache search hello
```
- The `show` command brings the information about a specific package
```bash
apt-cache show hello
```
---
#### Adding Software

To install a piece of software from your operating system’s default repository in the terminal, use the `apt-get` command, followed by the keyword `install` and then the name of the package you want to install.

```bash
apt-get install hello
```
---
#### Removing Software

You can use the option `remove` to just remove the program, while using `purge` will remove the program and the config files of it, and `autoremove` will remove the packages that the program depends on it and when you remove there is no use of it.
```bash
apt-get remove hello
```

```bash
apt-get purge hello
```

```bash
apt-get autoremove hello
```
---
#### Updating and Upgrading

just enter this command and it will do the job
```bash
sudo apt update && sudo apt upgrade
```
---
#### Repositories File

###### The servers that hold the software for particular distributions of Linux are known as *repositories*. You will, of course, be using the Kali repository, which has a large amount of security and hacking software. But because Kali specializes in security and hacking, it doesn’t include some specialty software and tools and even some run-of-the-mill software. It’s worth adding a backup repository or two that your system can search through in case it doesn’t find it a specific software in the Kali repository.

In `KALI` the file in `/etc/apt/sources.list` and in `ParrotOS` the directory is `/etc/apt/sources.list.d/parrot.list`, so if you want to add more repositories to your repositories file you need to `sudo nano` into the file and basically add it.
```bash
sudo nano /etc/apt/sources.list
```

Many Linux distributions divide repositories into separate categories. For instance, Debian breaks out its repository categories as follows:
- *main* Contains supported open source software
- *universe* Contains community-maintained open source software
- *multiverse* Contains software restricted by copyright or other legal issues
- *restricted* Contains proprietary device drivers
- *backports* Contains packages from later releases

When you ask to download a new software package, the system looks through your repositories listed in `sources.list` and selects the most recent version of the desired package. Check first that the repository is compatible for your system. ***Kali***, like ***Ubuntu***, is built on ***Debian***, so these repositories work pretty well with each of these systems.