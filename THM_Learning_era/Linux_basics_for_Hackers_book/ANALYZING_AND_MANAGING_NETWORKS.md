---
tags:
  - ifconfig
  - iwconfig
  - macchanger
  - "#IP"
  - MAC
  - wlan
---
### In many situations, you’ll be hacking something over a network, and a good hacker needs to know how to connect to and interact with that network.
---

#### Analyzing Networks with `ifconfig`

- `ifconfig`, You can use it to query your active network connections.
  ```bash
	ifconfig
	```
- lets break through the output of the `ifconfig`, ***Note*** that every `*` is a hidden data for my privacy :
```r
┌─[p@parrot]─[~]
└──╼ $ifconfig 
(5)CloudflareWARP: flags=****<**,*********,RUNNING,*****,*********>  mtu ****
        inet ***.**.**.*  netmask ***.***.***.***  destination ***.**.**.*
        inet6 *************************  prefixlen **  scopeid ****<link>
        inet6 *************************  prefixlen ***  scopeid ****
        
(4)ens3: flags=****<UP,BROADCAST,RUNNING,MULTICAST>  mtu ****
        (1)inet 10.0.2.15  netmask 255.255.255.0  (2)broadcast 10.0.2.255
        inet6 ****::82e1:c6e2:****:****  prefixlen **  scopeid *x**<link>
        inet6 f***::****:ac1b:a17d:****  prefixlen **  scopeid *x**<site>
        ether 5*:54:**:2c:**:**  txqueuelen ****  (Ethernet)
        RX packets 4**  bytes 106**** (104.3 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 6**  bytes 8*** (5*.* KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 3188
        
(3)lo: flags=73<UP,LOOPBACK,RUNNING>  mtu ****
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 63  bytes 6250 (6.1 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 63  bytes 6250 (6.1 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

```
1. (1) is the IP of this device on the network and it's network mask.
2. (2) is the Bcast, the broadcast id, which is used to send the information to all devices at the same network range.
3. (3) The loopback address, it is an IP that made to test the network on the system it it's own
4. (4) is the Ethernet connection
5.  (5) is the information of my warp-cloud flare connection

---
#### Checking Wireless Network Devices with `iwconfig`

- You can use it to see your wireless networking info
  ```bash
	iwconfig
	```
 - lets break through the output of `iwconfig`
```r
┌─[p@parrot]─[~]
└──╼ $iwconfig 
wlx30de4bb7b2ef  IEEE 802.11  ESSID:off/any  
          Mode:Managed  Access Point: Not-Associated   Tx-Power=20 dBm   
          Retry short limit:7   RTS thr=2347 B   Fragment thr:off
          Power Management:off

```
1. **IEEE 802.11** is a standard made by the *IEEE* to make a united technique to transfer the data wirelessly, so by seeing it in the `iwconfig` that means that this wireless network adapter supports this standard
2. **Mode:Managed** means that the **monitor** mode is off, and the monitor mode is used for cracking WIFI  passwords.
3. **Access Point: Not-Associated** That means that this network adapter not connected to any access point
4. **Tx-Power=20 dBm** This is the power of the network adapter to locate and connect other devices or access points.
---
#### Changing Your Network Information **😈**

###### Being able to change your IP address and other network information is a useful skill because it will help you access other networks while appearing as a trusted device on those networks.

- Changing the IP address
```bash
ifconfig eth0 192.168.181.115
```

- Changing the `broadcast` and the `netmask`
```bash
ifconfig eth0 192.168.181.115 netmask 255.255.0.0 broadcast 192.168.1.255
```

###### It is not mentioned in the book, but if you want, you can change the mac address by `macchanger`
- How to install it
  ```bash
	sudo apt install macchanger
	```
-  it will ask you if you want `macchanger` to change your mac-address automatically  whenever you restart the WIFI or the Ethernet  if you want this say yes
- to change your mac address randomly :
  ```bash
	# macchanger {the mac address you want or -r for random} {the net adapter}
	sudo macchanger -r wlan0
	```
