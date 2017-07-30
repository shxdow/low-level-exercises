#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>


static int scull_major;
module_parm(scull_major, int, S_IRUGO);

static int __init init_scull (void) {

	/* assign major number or request it dynamically */
	if (scull_major) {
		dev = MKDEV(scull_major, scull_minor);
		result = register_chrdev_region(dev, scull_nr_devs, "scull");
	} else {
		result = alloc_chrdev_region(&dev, scull_minor, scull_nr_devs, "scull");
		scull_major = MAJOR(dev);
	}

	if (result < 0) {
		printk(KERN_WARNING "scull: can't get major %d\n", scull_major);
		return result;
	}

}

module_init("init_scull");
module_license("GPL");
