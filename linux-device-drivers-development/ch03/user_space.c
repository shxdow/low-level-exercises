#include <linux/init.h>         /* __init */
#include <linux/kernel.h>       /* pr_ */
#include <linux/module.h>       /* module_ */
#include <linux/workqueue.h>    /* _work */
#include <linux/kmod.h>         /* user space stuff */


static struct delayed_work initiate_shutdown_work;
static void delayed_shutdown(void);
/* static DECLARE_DELAYED_WORK(initiate_shutdown_work, delayed_shutdown); */

static void delayed_shutdown(void) {
    char *cmd = "/sbin/shutdown";
    char *argv[] = {
        cmd,
        "-h",
        "now",
        NULL,
    };
    char *envp[] = {
        "HOME=/",
        "PATH=/sbin/:/bin:/usr/sbin:/usr/bin",
        NULL,
    };

    call_usermodehelper(cmd, argv, envp, 0);
}

static int __init my_shutdown_init(void) {
    printk("%s: entered kernel space", __FILE__);
    /* schedule_delayed_work(initiate_shutdown_work, msecs_to_jiffies(200)); */
    return 0;
}

static void __exit my_shutdown_exit(void) {
    return ;
}


module_init(my_shutdown_init);
module_exit(my_shutdown_exit);
MODULE_LICENSE("Dual MIT/GPL");
MODULE_AUTHOR("shxdow");
