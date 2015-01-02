__WARNING__: Using the information could damage your CloudBit beyond repair. 

__Use this information at your own risk__.



## Read CloubBit FileSystem

This webpage from LittleBits meant to post a link to the open parts of CloubBits source code. Looks like they put a wrong link there.

Based on the componenetly used by the device it seems easy enough to just mount CloudBits filesystem on Mac and try and find the web interfaces manually.


### Prerequisites

The CloudBits filesystem is ext4 which in not natvily supported by OSX. You will need to install some tools to enable support for ext4.

* [OSXFuse](http://sourceforge.net/projects/osxfuse/) *Note you need the MacFuse compat layer*
* [fuse-ext2](http://sourceforge.net/projects/fuse-ext2/)

NOTO: If I can get permission from LittleBits I will provide access to a CloudBit image that already has SSHD running and ready..


### Backup SD Card (just incase)

Warning `dd` can be a very dagerous command that can wipe your SDCard or worse you Mac harddrive. You should study up on this command before you use it.

* Open terminal
* connect sdcard to Mac
* type `sudo dd if=/dev/disk1s3 of=/tmp/backupfile.img`
* type `open /tmp`
* put the file somewhere safe
* Create a duplicate of the card to keep the original safe
* TODO: descibe how to do this....


### Mount FileSystem

* Remove SD card from the CloudBit
* Use Spotlight to open `Disk Utility`
* Connct SD card to your Mac and *Note the new names*
* Open Terminal
	* `mkdir /Volumes/little`
	* `sudo fuse-ext2 -o force /dev/disk1s3 /Volumes/little`
	* `cd /Volumes/little` (or view in finder with: `open /Volume/little` )

One line form:
`mkdir /Volumes/little && sudo fuse-ext2 -o force /dev/disk1s3 /Volumes/little && cd /Volumes/little`

### Enable sshd on CloudBit
	
This part assume you already mounted the SD card from the CloudBit.

* edit /Volumes/little/etc/ssh/sshd_config
	* change `UsePAM yes` to `UsePAM no`
	* uncommnet `#PermitRootLogin yes` to `PermitRootLogin yes`
	* save and close file
* edit /Volumes/little/usr/lib/sysctl.d/50-default.conf
	* Add line `net.ipv4.conf.default.rp_filter = 0`
* Disable iptables
	*  `mv /Volumes/little/etc/systemd/system/multi-user.target.wants/iptables.service /Volumes/little/etc/systemd/`
* `cd /Volumes/little/etc/systemd/system`
	* `cp /Volumes/little/usr/lib/systemd/system/sshdgenkeys.service .`
	* `cp /Volumes/little/usr/lib/systemd/system/sshd.service .`
* TODO: decribe howto setup password
* Unmount SDCARD
* Put back into CloudBit and ssh to device
	
### Linux Access

* Shadow file
	* Generate password: `openssl passwd -1 -salt bit  cloud`
	* Original root shadow password `$6$p9leKwKF$MkCEuyjkObA0/Yl7GD93WaqHHEA/yFY4sWpUqN5vB2YVIdBOf/UoQfMUgB0uh1enC7q2BrEaCRJfcD0tkheXZ/`

### Other Info

* `netstat -an`
	* `tcp        0      0 10.0.6.181:56173        54.235.112.129:9480     ESTABLISHED`

`````
ps -efxw
 PID TTY      STAT   TIME COMMAND
   2 ?        S      0:00 [kthreadd]
   3 ?        S      0:06  \_ [ksoftirqd/0]
   4 ?        S      0:03  \_ [kworker/0:0]
   5 ?        S<     0:00  \_ [kworker/0:0H]
   7 ?        S<     0:00  \_ [kworker/u:0H]
   8 ?        S      0:01  \_ [watchdog/0]
   9 ?        S<     0:00  \_ [cpuset]
  10 ?        S<     0:00  \_ [khelper]
  11 ?        S      0:00  \_ [kdevtmpfs]
  12 ?        S<     0:00  \_ [netns]
  13 ?        S      0:00  \_ [kworker/u:1]
 159 ?        S      0:00  \_ [bdi-default]
 160 ?        S<     0:00  \_ [kintegrityd]
 162 ?        S<     0:00  \_ [kblockd]
 205 ?        S      0:00  \_ [khubd]
 305 ?        S      0:00  \_ [khungtaskd]
 308 ?        S      0:00  \_ [kswapd0]
 309 ?        S      0:00  \_ [fsnotify_mark]
 310 ?        S<     0:00  \_ [cifsiod]
 311 ?        S<     0:00  \_ [crypto]
 368 ?        S<     0:00  \_ [ci_otg]
 380 ?        S      0:00  \_ [kworker/u:2]
 391 ?        S<     0:00  \_ [deferwq]
 394 ?        S      0:14  \_ [mmcqd/0]
 400 ?        S      0:00  \_ [jbd2/mmcblk0p3-]
 401 ?        S<     0:00  \_ [ext4-dio-unwrit]
 419 ?        S      0:00  \_ [kworker/0:2]
 806 ?        S      0:14  \_ [RTW_CMD_THREAD]
   1 ?        Ss     0:56 /sbin/init HOME=/ TERM=linux
 425 ?        Ss     0:01 /usr/lib/systemd/systemd-journald LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin NOTIFY_SOCKET=@/org/freedesktop/systemd1/notify LISTEN_PID=425 LISTEN_FDS
 528 ?        Ss     0:00 /usr/lib/systemd/systemd-udevd LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin NOTIFY_SOCKET=@/org/freedesktop/systemd1/notify LISTEN_PID=528 LISTEN_FDS=2
 717 ?        Ss     0:00 /usr/bin/sshd -D LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
1018 ?        Ss     0:16  \_ sshd: root@pts/0                                                                         n
1020 pts/0    Ss     0:07      \_ -bash USER=root LOGNAME=root HOME=/root PATH=/usr/bin:/bin:/usr/sbin:/sbin MAIL=/var/mail/root SHELL=/bin/bash SSH_CLIENT=10.0.6.169 58324 22 SSH_CONNECTION=10.0.6.169 583
3226 pts/0    R+     0:00          \_ ps -efxw TERM=xterm-256color SHELL=/bin/bash SSH_CLIENT=10.0.6.169 58324 22 SSH_TTY=/dev/pts/0 USER=root MAIL=/var/mail/root PATH=/usr/local/sbin:/usr/local/bin:/usr/b
 720 ?        Ss     0:00 /usr/local/lb/ADC/bin/ADC.d LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
 723 ?        Ss     0:00 login -- root                                                                                       
 786 ttyAMA0  Ss+    0:00  \_ -bash HOME=/root USER=root SHELL=/bin/bash TERM=vt102 PATH=/usr/local/lb/ADC/bin:/usr/local/lb/Button/bin:/usr/local/lb/DAC/bin:/usr/local/lb/LEDcolor/bin:/usr/local/lb/cloud_
 725 ?        Ss     0:00 /usr/local/lb/DAC/bin/DAC.d LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
 731 ?        Ss     0:26 /usr/local/lb/Button/bin/button.d LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
 781 ?        Ss     0:00 /usr/lib/systemd/systemd-logind LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin NOTIFY_SOCKET=@/org/freedesktop/systemd1/notify WATCHDOG_PID=781 WATCHDOG_U
 782 ?        Ss     0:00 /usr/lib/systemd/systemd --user LANG=en_US.UTF-8 PATH=/usr/local/lb/ADC/bin:/usr/local/lb/Button/bin:/usr/local/lb/DAC/bin:/usr/local/lb/LEDcolor/bin:/usr/local/lb/cloud_client/bi
 784 ?        S      0:00  \_ (sd-pam)   HOME=/ TERM=linux
 811 ?        Ss     0:01 wpa_supplicant -B -P /run/wpa_supplicant_wlan0.pid -i wlan0 -D nl80211,wext -c/etc/wpa_supplicant/cloudbit.conf OLDPWD=/ PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin PWD
 947 ?        Ss     0:00 dhcpcd -4qL -t 30 wlan0 OLDPWD=/ PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin PWD=/ LANG=en_US.UTF-8 SHLVL=1 _=/usr/sbin/dhcpcd
 977 ?        Ss     0:04 /usr/local/lb/cloud_client/bin/cloud_client LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
 980 ?        Ss     0:00 /usr/local/lb/LEDcolor/bin/LEDcolor.d LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
 981 ?        Ss     0:27 /bin/bash /usr/local/lb/bit-util/monitorNetctl.sh &> /dev/null & LANG=en_US.UTF-8 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin
3225 ?        S      0:00  \_ sleep 5 PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin PWD=/ LANG=en_US.UTF-8 SHLVL=1 _=/usr/sbin/sleep
[root@alarm etc]# 

`````

### Set output level

* Set output to max `/usr/local/lb/DAC/bin/setDAC ffff`
* Set output to min `/usr/local/lb/DAC/bin/setDAC 0`

### Query ADC

`````
[root@alarm /]# /usr/local/lb/ADC/bin/getADC -1
126
15
[root@alarm /]# /usr/local/lb/ADC/bin/getADC -1
0
0

`````

### Other commands

`````
[root@alarm /]# ls /usr/local/lb/
ADC  bit-util  Button  cloud_client  comm-util	DAC  etc  hw_util  LEDcolor  mfg_test

`````


## References

* [systemd](https://wiki.archlinux.org/index.php/DeveloperWiki:Systemd)
* [Japanese chobie@github](http://qiita.com/chobie@github/items/d41cfa2d60df5d7d1a3f)
* 