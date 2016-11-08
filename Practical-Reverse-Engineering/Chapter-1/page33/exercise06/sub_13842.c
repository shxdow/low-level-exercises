struct s1
{
	DWORD var1;// 4 bytes
	DWORD var2;// 4 bytes
	DWORD var3;// 4 bytes
	DWORD var4;// 4 bytes
	DWORD var5;// 4 bytes
	DWORD var6;// 4 bytes
	DWORD var7;// 4 bytes
	DWORD var8;// 4 bytes
	DWORD var9;// 4 bytes
	DWORD var10;// 4 bytes
	DWORD var11;// 4 bytes
	DWORD var12;// 4 bytes
	DWORD var13;// 4 bytes
	DWORD var14;// 4 bytes
	
	
}

/* I can tell where members are as long as there's sth before / after them */

/* the calle has 4 arguments,so they may have sth to do */
unknown_type __fastcall sub_13842(s1 xxx,previous_arg_4)
{
	xxx.var1 -= 0x24;
	xxx.var14--;
	
	(* unknown_fnc)(previous_arg_4,ecx);
}


/*
	sub_11798:
			contains the fnc call + eax
	
*/