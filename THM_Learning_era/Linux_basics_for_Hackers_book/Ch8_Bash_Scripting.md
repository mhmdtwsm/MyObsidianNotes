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
- [tty and Xwindows](https://www.feyrer.de/NetBSD/ttys.html)

---

Okay, let's ask some questions:
1. what is `BASH`
2. what is `terminal`
3. what is `shell`
4. what is `tty`
5. what is `pty`
6. what is `X Windows`

And i know that Sh!$#y damn hard questions isn't in the book, but that is my notes and that is what i asked while reading the book, So, before i get into the bash scripting i am saying all what i searched for about: What is the terminal?

## Intro

The operating system, the fellow who helps you to use the hardware of your potato PC needed a hand to help to get a long with the hardware, he needed someone to translate your programs and commands into processes and manage them this is when the `Kernel` comes in, but we also needed the mutual ground to send the commands through between us and the kernel, that is when the `shell` came in.

I already saw a lot about the making of `UNIX` and i suggest you this [documentary](https://www.youtube.com/watch?v=tc4ROCJYbm0) it is about the UNIX system, Dennis Ritchie and Ken Thompson are there, it is amazing.

The thing is i already knew that the operating system have a shell to send the commands to the kernel of the operating system, and i saw the weird, vintage looking terminals in the documentary i mentioned above, late after that i also knew `multics` which inspired the duo (Dennis Ritchie and Ken Thompson) to make the `UNIX`, and i saw after that the old mainframe which all the terminals access it and throw the commands in it which made me ask a new question, what is this terminal and how it works?
and i knew that it was made after another invention which is the `tty` -don't feel confused i will explain all of them after my loud thinking-, and i also noticed that there are a thing on the Linux also called `tty`, and in another branched research of all of these, i wanted to know how the graphical terminals works so i also saw another weird word which is `pty`.
Forgive me for this loud thinking, but i wanted to give a full pictures of my journey and steps of knowing a crucial thing like how a shell like the bash works? and after all i made this firstly for my future me to preserve this steps and titles for him.

## What is Bash

The first question i asked, and the answer is: (Bourne again Shell), it is a shell programmed by the [GNU](https://en.wikipedia.org/wiki/GNU)project which is made as an open source alternative for the Bourne Shell that was made for the UNIX system, in those old days -i mean 1980s- the GNU project made the BASH for the UNIX Like Systems and made a lot of other amazing open source projects that is necessary to run in your daily use of Linux, Unix Like systems and even some of them taken to Windows, and the GNU was made by Richard Stallman.

So the bash is a program in the system that you can run the commands on and when we try to give it a name describes how it works we say that it is a shell.

## What is Shell

The Shell is a command line interpreter, it is the main user interface to talk with the system.

It takes every command you give and translates it into a process that the kernel might understands it and manage.

It executes programs by just typing the name of it, interact with the file system and create processes.

The first modern shell made was made for UNIX and the name of it was [Thompson Shell](https://en.wikipedia.org/wiki/Thompson_shell) and it was introduced at the first released version of UNIX at 1970 !!!

Before the shell was made there was another form of the command interpreters we see today which is was the [CTSS](https://en.wikipedia.org/wiki/Compatible_Time-Sharing_System), it was made to share give a command input to a mainframe -a large computer in the old days- from a peripheral device -which is a terminal- connected to the mainframe and get the output from the mainframe as soon as the process end it was based on synchronization and made the old computers look interactive till Thompson came and rolled the table.

## What is the Terminal ?
![](photo/terminal.png)
Originally the terminal was a device, in our early days it is just a window, both were made to take our key types and translate it into characters which makes a command, and display the output of the response of the command we made by the shell on the computer.

##### A GPT definition of it:
- A **terminal** originally referred to a physical device (like a keyboard and display) used to interact with a computer. In the modern context, a terminal is often a command-line interface (`CLI`) environment that lets you interact with the shell. 

**In the the good old days**, the terminal was not a computer, as i said it was a peripheral of a bigger computer like a mainframe. The terminal has a keyboard to translate each character you want to type to ASCII code to write a command you desire, and a display CRT screen to see the what you type and what is the result of your command, so it was the window that you access the shell of the OS that runs on the mainframe and that OS manages terminals sessions.

So simply keystrokes types commands, commands get output, output displayed on a display platform which is the CRT screen, it needed a whole device to make this small functions, to make more than one person uses the computers in the old days, but those small functions were also made in another more older device called `tty`.


## What is `tty`

![](photo/tty.png)