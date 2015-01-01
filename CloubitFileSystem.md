WARNING: Using the information could damage your CloudBit beyond repair. *Use this information at your own risk*.



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
	* `cp /Volumes/little/usr/lib/systemd/system/sshdgenkeys.service`
	* `cp /Volumes/little/usr/lib/systemd/system/sshd.service`
* TODO: decribe howto setup password
* Unmount SDCARD
* Put back into CloudBit and ssh to device
	
	
## References

* [systemd](https://wiki.archlinux.org/index.php/DeveloperWiki:Systemd)
* [Japanese chobie@github](http://qiita.com/chobie@github/items/d41cfa2d60df5d7d1a3f)
* 