
# Scanning

### Scanning on the open ports

![Vuln_Roasted.png](../../photos/srv/Vuln_Roasted.png)

A `kerberos` and the Domain will work on 
![Vuln_Roasted-1.png](../../photos/srv/Vuln_Roasted-1.png)
 and the `nmap` report file is [here](../../files/vuln_roasted/nmap.txt)

---

### Enumerating 

There is no users list so doing a users `SID` dumping might be useful in this case, it might get some users in the domain

```bash
impacket-lookupsid anonymous@10.10.12.26 
```

![Vuln_Roasted-1.png](../../photos/srv/users.png)

**Succeeded!**

Now let's make a list and test on `kerbrute` ..

![Vuln_Roasted-1.png](../../photos/srv/test.png)

Now the valid users are:

![Vuln_Roasted-1.png](../../photos/srv/validy.png)

Trying to get the hash from the usernames and the bingo goes to `t-skid`

![Vuln_Roasted-1.png](../../photos/srv/hashy.png)

Cracking with `john` ...
![cracky.png](../../photos/srv/cracky.png)

And now it is `Kerberoasting` time to look if we can get a `TGS`
```bash
impacket-GetUserSPNs -dc-ip 10.10.12.26 'vulnnet-rst.local/t-skid:tj072889*' -outputfile khash
```

Luckily we got one for `enterprise-core-vn`, and by cracking it with john that would be the pass
 ![hs.png](../../photos/srv/hs.png)

And.. I'am in and got the flag.....

![userv.png](../../photos/srv/userv.png)

Now There is no further more progress we can achieve in this session so let's map the `smb` using `smbmab` looking for further info to escalate.

![smbmap.png](../../photos/srv/smbmap.png)

Now the `SYSVOL` in the `smb` is a marked directory to access, so let's get into it

![smbs.png](../../photos/srv/smbs.png)

