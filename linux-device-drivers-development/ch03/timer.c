#include <linux/init.h>
#include <linux/kernel.h>
#include <linux/module.h>
#include <linux/timer.h>

/* declare the timer */
static struct timer_list my_timer;

/* declare the callback function to be executed when the timer expires */
void my_timer_callback (unsigned long data)
{
    pr_info("[%s] called (%ld).\n", __FUNCTION__, jiffies);
}

static int __init my_init (void) {
    int r;
    pr_info("Timer module loaded");

    setup_timer(&my_timer, my_timer_callback, 0);

    pr_info("[%s] Setup timer to fire in 300ms (%ld)\n", __FUNCTION__, jiffies);

    /* modify a timer's timeout  */
    r = mod_timer(&my_timer, jiffies + msecs_to_jiffies(300));
    if (r)
        pr_info("Timer firing failed\n");
    else
        pr_info("Timer fired\n");

    return 0;
}

static void my_exit (void) {
    int r;
    r = del_timer(&my_timer);
    /* Is timer still active (1) or no (0) */
    if (r)
        pr_info("The timer is still in use");

    pr_info("Timer module unloaded\n");
}

module_init(my_init);
module_exit(my_exit);
MODULE_AUTHOR("shxdow");
MODULE_LICENSE("Dual MIT/GPL");
MODULE_DESCRIPTION("timer test");