struct struct_arg1
{
	/* 0x22 bytes of stuff */
	BYTE member0;
	/* 0x3D bytes of some unknown fields */
	struct_arg1 * member1;
	/* 0x14 bytes of some unknown fields */
	struct_arg2 * member2;
}

struct struct_arg2
{
	/* 8 bytes of stuff */
	DWORD something;
	/* maybe there's something else */
}


unknown_type __fastcall sub_13842(struct_arg1 arg_1, struct_arg2 arg_2)
{
	arg_1.member0 -= 1;
	arg_1->member1 -= 0x24;
	arg_1->member2 = arg_2;

	(* unknown_fnc)(arg_2 ,arg_1);
}