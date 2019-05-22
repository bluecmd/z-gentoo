.PHONY: all

all: netboot-s390x-kernel netboot-s390x-initramfs initramfs.off initramfs.siz

netboot-s390x-kernel:
	curl http://distfiles.gentoo.org/releases/s390/autobuilds/$(shell curl http://distfiles.gentoo.org/releases/s390/autobuilds/latest-netboot-s390x-kernel.txt | grep -v '^#' | cut -f 1 -d ' ') -o $@

netboot-s390x-initramfs:
	curl http://distfiles.gentoo.org/releases/s390/autobuilds/$(shell curl http://distfiles.gentoo.org/releases/s390/autobuilds/latest-netboot-s390x-initramfs.txt | grep -v '^#' | cut -f 1 -d ' ') -o $@

initramfs.off:
	# Set the address offset to 0x01000000 (which is what gentoo.ins points to)
	echo -n '\01\0\0\0' > $@

initramfs.siz: netboot-s390x-initramfs
	python -c 'import os, struct; s = os.stat("netboot-s390x-initramfs"); os.write(1, struct.pack(">L", s.st_size))' > $@
