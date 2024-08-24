---
tags:
  - windows
  - blue
  - metasploit
  - nmap
  - exploit
---
Link: https://tryhackme.com/r/room/blue

---

# Scanning...

First thing First, let's do the `nmap` scan to detect the open ports and the services.

![nmap](../../photos/blue/nmap1.png)

##### Let's break through the flags...

1. `-p-`  this is for scanning all the ports, note that you might choose a range with this format: `-p 1-80` or choose a specific ports with this format: `-p 22,80`
2. `-sV` is for scanning the versions of the services on this ports
3. `-sC` it is the default scripts run by the `NSE` it saves a lot of time running them manually
4. `-- script=vuln` here I am choosing a script that searches for vulns and their exploits on services on the scanned ports
5. `10.10.2.215` basically the IP :)

After the scan done 😴

![nmap](../../photos/blue/2000.gif)

The `vuln` script found a vulnerability of a remote code execution....

![nmap](../../photos/blue/vuln.png)

---

# `Metasploit`

Let's search with the name of it on the `msfconsole`....

![search](../../photos/blue/search.png)