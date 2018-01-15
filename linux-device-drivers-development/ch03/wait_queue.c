#include <linux/init.h>         /* module_init() */
#include <linux/module.h>       /* module_* macros */
#include <linux/kernel.h>       /* pr_* macros */
#include <linux/sched.h>        /* */
#include <linux/time.h>         /* */
#include <linux/delay.h>        /* */
#include <linux/workqueue.h>    /* */

/* statically declare a wait queue */
static DECLARE_WAIT_QUEUE_HEAD(my_wq);
static int condition = 0;

/* declare a work queue */
static struct work_struct wrk;

static void work_handler (struct work_struct *work) {
    pr_info("[%s] Waitqueue module handler \n", __FUNCTION__);
    msleep(5000);
    pr_info("Wake up the sleeping module\n");
    condition = 1;
    wake_up_interruptible(&my_wq);
}

static int __init my_init(void) {

    printk("Wait queue example\n");

    INIT_WORK(&wrk, work_handler);

    /* adds task to the list */
    schedule_work(&wrk);

    pr_info("[%s] Going to spleep \n", __FUNCTION__);

    /* sleep until condition != 0 */
    wait_event_interruptible(my_wq, condition != 0);

    pr_info("Woken up by the work job\n");

    return 0;
}

static void __exit my_exit(void) {
    pr_info("waitqueue example cleanup\n");
}

module_init(my_init);
module_exit(my_exit);

MODULE_AUTHOR("shxdow");
MODULE_LICENSE("Dual BSD/GPL");
MODULE_DESCRIPTION("waitqueues tests");

