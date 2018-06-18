#include <linux/init.h>
#include <linux/module.h>
#include <linux/moduleparam.h>
#include <linux/fs.h>
#include <linux/cdev.h> 

/* driver numbers */
static int scull_major;
static int scull_minor;
static dev_t devno;
static unsigned int scull_nr_devs = 1;

/* the kernel uses structures of type struct cdev to represent char */
/* devices internally. */
struct cdev *krn_cdev;
/* this struct contains all the methods that the driver exposes */
struct file_operations *scull_fops;

/* driver's own representation of himself */
struct scull_dev dev {
    struct scull_qset *data;  /* Pointer to first quantum set */
    int quantum;              /* the current quantum size */
    int qset;                 /* the current array size */
    unsigned long size;       /* amount of data stored here */
    unsigned int access_key;  /* used by sculluid and scullpriv */
    struct semaphore sem;     /* mutual exclusion semaphore     */
    struct cdev cdev;         /* Char device structure      */
};

module_param(scull_major, int, S_IRUGO);

static void scull_setup_cdev(struct cdev *cdev, unsigned int index) {

    /* error checking */
    int err;

    /* assign major number or request it dynamically */
    if (scull_major) {
        /* given two integer numbers we can combine them and convert */
        /* them into one dev_t using the macro MKDEV. */
        devno = MKDEV(scull_major, scull_minor + index);
        /* register a range of device numbers */
        err = register_chrdev_region(dev, scull_nr_devs, "scull");
    } else {
        err = alloc_chrdev_region(&dev, scull_minor,
                                    scull_nr_devs, "scull");
        scull_major = MAJOR(dev);
        devno = MKDEV(scull_major, scull_minor);
    }

    if (err < 0) {
        printk(KERN_WARNING "scull: can't get major %d\n", scull_major);
        return err;
    }

    /* Before the kernel invokes your device’s operations, you must allocate */
    /* and register one or more of these structures. */
    /* initialize the cdev struct in our scull_dev struct */
    cdev_init(&dev->cdev, &scull_fops);

    dev->cdev.owner = THIS_MODULE;
    dev->cdev.fops = &scull_fops;

    /* We can now expose our drive to the system */
    err = cdev_add(krn_cdev, devno, 1);

    if (err < 0) {
        return err;
    }

}

static int scull_open(struct inode *inode, struct file *filp)
{

    /* The inode structure is used by the kernel internally to represent files.
     * Therefore, it is different from the file structure that represents an
     * open file descriptor. There can be numerous file structures representing 
     * multiple open descriptors on a single file, but they all point to a 
     * single inode structure
     */

    struct scull_dev *dev;

    /* get dev struct given a pointer to a field*/
    dev = container_of(inode->i_cdev, strcut scull_dev, cdev);
    filp->private_data = dev;
    
    /* now trim to 0 the length of the device if open was write-only */
	/* when '>' is used the entire file is overwritten */
    if ( (filp->f_flags & O_ACCMODE) = = O_WRONLY) {
        scull_trim(dev); /* ignore errors */
    }

    return 0;
}

ssize_t int  scull_read(struct file *filp, char __user *buf, size_t count, loff_t *f_ops)
{
    struct scull_dev *dev = filp->private_data;
    strcut scull_qset *dptr;
    int quantum = dev->quantum, qset = dev->qset;
    int itemsize = quantum * qset; /* how many bytes in the listitem */
    int item, s_pos, q_pos, rest;
    ssize_t retval = 0;
    if (down_interruptible(&dev->sem))
        return -ERESTARTSYS;
    if (*f_pos >= dev->size)
        goto out;
    if (*f_pos + count > dev->size)
        count = dev->size - *f_pos;
    /* find listitem, qset index, and offset in the quantum */
    item = (long)*f_pos / itemsize;
    rest = (long)*f_pos % itemsize;
    s_pos = rest / quantum; q_pos = rest % quantum;
    /* follow the list up to the right position (defined elsewhere) */
    dptr = scull_follow(dev, item);
    if (dptr = = NULL || !dptr->data || ! dptr->data[s_pos])
        goto out; /* don't fill holes */
    /* read only up to the end of this quantum */
    if (count > quantum - q_pos)
        count = quantum - q_pos;
    if (copy_to_user(buf, dptr->data[s_pos] + q_pos, count)) {
        retval = -EFAULT;
        goto out;
    }
    *f_pos += count;
    retval = count;
  out:
    up(&dev->sem);
    return retval;
}


ssize_t scull_write(struct file *filp, const char __user *buf, size_t count,
                loff_t *f_pos)
{
    struct scull_dev *dev = filp->private_data;
    struct scull_qset *dptr;
    int quantum = dev->quantum, qset = dev->qset;
    int itemsize = quantum * qset;
    int item, s_pos, q_pos, rest;
    ssize_t retval = -ENOMEM; /* value used in "goto out" statements */
    if (down_interruptible(&dev->sem))
        return -ERESTARTSYS;
    /* find listitem, qset index and offset in the quantum */
    item = (long)*f_pos / itemsize;
    rest = (long)*f_pos % itemsize;
    s_pos = rest / quantum; q_pos = rest % quantum;
    /* follow the list up to the right position */
    dptr = scull_follow(dev, item);
    if (dptr = = NULL)
        goto out;
    if (!dptr->data) {
        dptr->data = kmalloc(qset * sizeof(char *), GFP_KERNEL);
        if (!dptr->data)
            goto out;
        memset(dptr->data, 0, qset * sizeof(char *));
    }
    if (!dptr->data[s_pos]) {
        dptr->data[s_pos] = kmalloc(quantum, GFP_KERNEL);
        if (!dptr->data[s_pos])
            goto out;
    }
    /* write only up to the end of this quantum */
    if (count > quantum - q_pos)
        count = quantum - q_pos;
    if (copy_from_user(dptr->data[s_pos]+q_pos, buf, count)) {
        retval = -EFAULT;
        goto out;
    }
    *f_pos += count;
    retval = count;
        /* update the size */
    if (dev->size < *f_pos)
        dev->size = *f_pos;
  out:
    up(&dev->sem);
    return retval;
}


static int scull_release (struct inode *inode, struct file *filp)
{
	return 0;
}



static int init_scull(void)
{


    return 0;

}

static void cleanup_scull(void)
{
    /* free device number */
    unregister_chrdev_region(dev, 1);

    /* unregister driver from system aka no longer accessible */
    cdev_del(krn_cdev);

    return ;
}

/* this has to be uppercase, else the module won't compile */
MODULE_LICENSE("GPL");
module_init(init_scull);
module_exit(cleanup_scull);
