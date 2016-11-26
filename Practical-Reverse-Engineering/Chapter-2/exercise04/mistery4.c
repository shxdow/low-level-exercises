
/*
 *  this function checks if the argument is 0,if not sets it.
 *  the type of arg0 is uncertain.
 */
pointer_type mistery4 (pointer_type * arg0)
{
    if (arg0 != 0)
    {   // what's the point of this line
        return *(arg0 - 0x8);
    }
    return 0;
}
