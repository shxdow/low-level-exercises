#include <iostream>




int open_dev_avflt (void *ptr) {

	int result = 0;

	void *dev = open("/dev/avflt", a2);

	if (dev) {

	} else {
		// errno_location ()
		result = -1;
	}

	return result;
}

void load_framework () {

	void * buf;
	void * ptr;
	char * err;
	
	

	ptr = readlink("/proc/self/exe", buf, 0x800u);

	if (!ptr) {
		v2 = __errno_location();
		err = strerror(*v2);
		fprintf(stderr, "%s\n", err);
		exit(1);
	}

	v4 = dlopen("./libFRAMEWORK.so", 1);
	handle = v4;
	if ( !v4 ){

	}
}

int main () {

	return 0;
}