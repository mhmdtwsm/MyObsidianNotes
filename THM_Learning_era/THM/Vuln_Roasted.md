
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

