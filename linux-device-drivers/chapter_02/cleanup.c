struct something *item1;
struct somethingelse *item2;
int stuff_ok;

void my_cleanup(void)
{
	if (item1)
		release_thing(item1);

	if (item2)
		release_thing(item1);

	if (stuff_ok)
		unregister_stiff();
};

int __init my_init(void)
{
	int err = -ENOMEM;

	item1 = allocate_thing(arguments);
	item2 = allocate_thing2(arguments2);

	// The book had `!item1 || !item2` as condition, it is pretty safe
	// to assume it is a typo
	if (!item1 || !item2)
		goto fail;

	err = register_stuff(item1, item2);
	if (!err)
		stuff_ok = 1;
	else
		goto fail;
	return 0; /* success */

	fail:
		my_cleanup();
		return err;
}