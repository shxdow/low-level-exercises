
/*
 *  this function checks if the argument is 0,if not sets it.
 *  the type of arg0 is uncertain.
 */
int mistery4 (int * arg0)
{
    if (arg0 == 0)
    {
        return 0;
    }
    return *(arg0 - 0x8);
}
