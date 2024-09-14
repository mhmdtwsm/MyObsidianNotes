
# Scanning

### Scanning on the open ports

![Vuln_Roasted.png](Vuln_Roasted.png)

A `kerberos` and the Domain will work on 
![Vuln_Roasted-1.png](Vuln_Roasted-1.png)
 and the `nmap` report file is [here](nmap.txt)

---

### Enumerating 

There is no users list so doing a users `SID` dumping might be useful in this case, it might get some users in the domain

```bash
impacket-lookupsid anonymous@10.10.12.26 
```

![Vuln_Roasted-1.png](users.png)

**Succeeded!**

Now let's make a list and test on `kerbrute` ..

![Vuln_Roasted-1.png](THM_Learning_era/photos/srv/test.png)

Now the valid users are:

![Vuln_Roasted-1.png](validy.png)

Trying to get the hash from the usernames and the bingo goes to `t-skid`

![Vuln_Roasted-1.png](hashy.png)

Cracking with `john` ...
![cracky.png](cracky.png)

And now it is `Kerberoasting` time to look if we can get a `TGS`
```bash
impacket-GetUserSPNs -dc-ip 10.10.12.26 'vulnnet-rst.local/t-skid:tj072889*' -outputfile khash
```

Luckily we got one for `enterprise-core-vn`, and by cracking it with john that would be the pass
 ![hs.png](hs.png)

And.. I'am in and got the flag.....

![userv.png](userv.png)

Now There is no further more progress we can achieve in this session so let's map the `smb` using `smbmab` looking for further info to escalate.

![smbmap.png](smbmap.png)

Now the `SYSVOL` in the `smb` is a marked directory to access, so let's get into it

![smbs.png](smbs.png)

inside that `ResetPassword.vbs` while scrolling i found a text credentials in a visual basic script file, most likely it's put there for some sort of comparison, how ever it's a horrible mistake to leave like this, at least the admin could make it encoded and change the wide obvious variable names that clarifies that this is a password and a user name.

![vbs.png](vbs.png)

When we re enumerate with the new credentials we will find that it has admin privileges !

![adminn.png](adminn.png)

Now if we tried to `secretdumb` with this credentials we will get the administrator hash 

![ahsash.png](ahsash.png)

I didn't crack to be hones i just passed it with `evilwinrm` and got the system flag

![sysf.png](sysf.png)