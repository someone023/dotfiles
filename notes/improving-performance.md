# Notes on improving performance following the arch wiki

[Ext4#Improving performance](https://wiki.archlinux.org/title/Ext4#Improving_performance)

boot options at: `/etc/fstab`
disable bluetooth to `/etc/modprobe.d/`

 Append (adding to the end of the file) to /etc/pacman.conf:
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
