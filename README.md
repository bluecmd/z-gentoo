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

See the [Gentoo wiki for Hercules](https://wiki.gentoo.org/wiki/S390/Hercules)
for more tips and tricks.
