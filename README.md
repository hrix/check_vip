# check_vip
nagios plugin, check the VIP of the whereabouts in a pair of server

## examples

* clustering servers by heartbeat (web, db, etc...)
```
$ check_vip.sh active.hostname standby.hostname 192.168.x.x(VIP)
```
