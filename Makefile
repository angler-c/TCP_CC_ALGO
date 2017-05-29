obj-m += tcp_pulsar.o

all:
		make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules CC=/usr/bin/gcc-4.9

clean:
		make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

install:
		install tcp_pulsar.ko /lib/modules/$(shell uname -r)/kernel/net/ipv4
		insmod /lib/modules/$(shell uname -r)/kernel/net/ipv4/tcp_pulsar.ko
		depmod -a
