# Gentoo LiveCD for IBM System z

This is a trivial build system for building a bootable LiveCD for IBM System z.
The aim was to have a rescue system readily available that can easily be booted
on an LPAR from FTP or DVD without relying on DASD being available.

## Build

```
make
```

Then copy all files mentioned in `gentoo.ins` to an FTP server or DVD.
IPL `gentoo.ins`.

## Usage

Networking is done like this (OSA, Layer2):

```
modprobe qeth
echo 0.0.0e20,0.0.0e21,0.0.0e22 > /sys/bus/ccwgroup/drivers/qeth/group
echo 1 > /sys/bus/ccwgroup/drivers/qeth/0.0.0e20/online
net-setup 192.168.11.2 192.168.11.1
```

You can then use `passwd` to set a root password and login via SSH as root.

For Hercules the device statement is `0E20.3 QETH ifname qeth0`.

See the [Gentoo wiki for Hercules](https://wiki.gentoo.org/wiki/S390/Hercules)
for more tips and tricks.
