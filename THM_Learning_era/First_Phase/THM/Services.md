
# Scanning

### Open ports
**The first part** in the scanning is to find the open ports. I used `Rustscan` to find them.

![open.png](open.png)

### `Nmap`

```bash
sudo nmap -p 53,80,88,135,139,389,445,464,593,636,3268,3389,3269,5985,9389,47001,49664,49666,49667,49665,49668,49674,49675,49676,49678,49679,49696,49706 -vvv -sV -sC -Pn -T4 -O -oN nmap 10.10.0.204
```


Some interesting things in the scan..

![photos/srv/nmap.png](photos/srv/nmap.png)

#### I put the `nmap` scan results on this [file](nmap_tryhackme_room_services.txt)

---

# Enumeration

### The website

First thing let's take a look at the website.
From this page it appears that it might be a way of typing the user names on the company

![tyep.png](tyep.png)

And with finding the names of the employees in the company in this this page we have a user list to check.

![staff.png](staff.png)

### `Kerberos`

To validate that the names we got is actually a users on the system or not we need to check their validity with `kerbrute` by making a list of their usernames on the same format we found the contact mail on.

![list.png](list.png)

Now let's check the validity..
```bash
kerbrute userenum --dc 10.10.0.204 -d services.local creds
```

![valid.png](valid.png)

So they are all Valid let's see from who can we dumb hashes to login.

I would use `impacket-GetNPUsers` for this.

![valid.png](photos/srv/hash.png)

And the only one who provided a hash is `j.rock`

Now cracking time with `john`

![valid.png](crack.png)

And we are in !

![log.png](log.png)

---

# Escalating

### `user.txt`

```powershell
tree /f /a ..
type ..\Desktop\user.txt
```

![user.png](user.png)

### The Root

The thing with this machine is to find a service to escalate with, so a command like `services` would be useful to find a writable high privileged service to edit it with our demand.

![AWS.png](AWS.png)

Now we found the service let's make a `revshell` by `msfvenom` and upload it  and run it as the service.

##### `msfvenom`

![venom.png](venom.png)

Uploading the executable on the machine and running it...

![rev.png](rev.png)

Got The `revshell` and the flag:

![flag.png](flag.png)
