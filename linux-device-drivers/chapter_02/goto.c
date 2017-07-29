#include <linux/module.h>
#include <linux/init.h>
MODULE_LICENSE("GPL");


// This code attempts to register three (fictitious )facilities. The
// goto statement is used in case of failure to cause the unregistration of only 
// the facilities that had been successfully registered before things went bad

int __init my_init_function(void)
{
	int err;

	/* registration takes a pointer and a name */
	err = register_this(ptr1, "skull");
	if (err) goto fail_this;

	err = register_that(ptr2, "skull");
	if (err) goto fail_that;

	err = register_those(ptr3, "skull");
	if (err) goto fail_those;

	return 0; /* success */

	fail_those: unregister_that(ptr2, "skull");
	fail_that: unregister_this(ptr1, "skull");
	fail_this: return err; /* propagate the error */
}