
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

inside that `ResetPassword.vbs` while scrolling i found a text credentials in a visual basic script file, most likely it's put there for some sort of comparison, how ever it's a horrible mistake to leave like this, at least the admin could make it encoded and change the wide obvious variable names that clarifies that this is a password and a user name.

![vbs.png](../../photos/srv/vbs.png)

When we re enumerate with the new credentials we will find that it has admin privileges !

![adminn.png](../../photos/srv/adminn.png)

Now if we tried to `secretdumb` with this credentials we will get the administrator hash 

![ahsash.png](../../photos/srv/ahsash.png)

I didn't crack to be hones i just passed it with `evilwinrm` and got the system flag

![sysf.png](../../photos/srv/sysf.png)