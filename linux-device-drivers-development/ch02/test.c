#include <linux/init.h>
#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/moduleparam.h>
#include <linux/list.h>


struct node {
    int n;
    struct list_head list;
};

static int __init hello_init(void) {

    pr_debug("entering kernel land");
    return 0;
}

static void __exit hello_exit(void) {
    pr_info("leaving kernel...");
}

module_init(hello_init);
module_exit(hello_exit);

MODULE_AUTHOR("shxdow");
MODULE_LICENSE("Dual BSD/GPL");
MODULE_PARM_DESC(n, "number of [...]");

