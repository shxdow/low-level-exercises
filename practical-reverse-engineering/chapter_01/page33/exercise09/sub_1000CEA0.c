

sub_1000CEA0(const char * ptr,__int8 val)
{
	/*
	 * looks for the '\0' in arg_0 so it can retrieve it's length,
	 * then it sets all it's bytes to arg_4 and returns ?
	 */
	int length = 0;
	while (ptr != '\0')
	{
		ptr = val;
		ptr++;
		length++;
	}
	while (length != 0)
	{
		ptr--;
		length--;
	}
	
	if (ptr == val)
	{
		return ptr;
	}
	else
		return 0;
}