# module object filename
obj-m += scull.o

# 'make all' 
all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

# 'make all' 
clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean

# [...] make will read Makefile in ~/kernel-2.6
# and assign your present working directory to variable M. Typically,
# this will allow for make to return to your current directory after 
# processing Makefile.
