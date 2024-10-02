---
tags:
  - bash
  - script
  - tty
  - pty
  - IP
---
##### sources might help you: 
- [What is tty](https://www.youtube.com/watch?v=N1bz1DTD8Io)
- [What the hell is tty?!](https://www.feyrer.de/NetBSD/ttys.html)

---

Okay, let's ask some questions:
1. what is `BASH`
2. what is `terminal`
3. what is `shell`
4. what is `tty`
5. what is `pty`
6. what is `X Windows`

And i know that Sh!$#y damn hard questions isn't in the book, but that is my notes and that is what i asked while reading the book, So, before i get into the bash scripting i am saying all what i searched for about: What is the terminal?

## The Good Old Days

The operating system, the fellow who helps you to use the hardware of your potato PC needed a hand to help to get a long with the hardware, he needed someone to translate your programs and commands into processes and manage them this is when the `Kernel` comes in, but we also needed the mutual ground to send the commands through between us and the kernel, that is when the `shell` came in.

I already saw a lot about the making of `UNIX` and i suggest you this [documentary](https://www.youtube.com/watch?v=tc4ROCJYbm0) it is about the UNIX system, Dennis Richie and Ken Thomson are there, it is amazing.

The thing is i already knew that the operating system have a shell to send the commands to the kernel of the operating system, and i saw the weird, vintage looking terminals in the documentary i mentioned above, late after that i also knew `multics` which inspired the duo (Dennis Richie and Ken Thomson) to make the `UNIX`, and i saw after that the old mainframe which all the terminals access it and throw the commands in it which made me ask a new question, what is this terminal and how it works?
and i knew that it was made after another invention which is the `tty` -don't feel confused i will explain all of them after my loud thinking-, and i also noticed that there are a thing on the linux also called `tty`, and in another branched research of all of these, i wanted to know how the graphical terminals works so i also saw another weird word which is `pty`.
Forgive me for this loud thinking, but i wanted to give a full pictures of my journey and steps of knowing a crucial thing like how a shell like the bash works? and after all i made this firstly for my future me to preserve this steps and titles for him.

