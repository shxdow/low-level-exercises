
NTKERNELAPI VOID KeInitializeApc (
	
	IN PRKAPC Apc,			// eax = ebp+8
	
	IN PKTHREAD Thread,		// 
	
	IN KAPC_ENVIRONMENT Environment,
	
	IN PKKERNEL_ROUTINE KernelRoutine,
	
	IN PKRUNDOWN_ROUTINE RundownRoutine OPTIONAL,
	
	IN PKNORMAL_ROUTINE NormalRoutine OPTIONAL,
	
	IN KPROCESSOR_MODE ApcMode,
	
	IN PVOID NormalContext

)
{
	BYTE var;
	Apc.Type = 0x12
	Apc.Size = 0x30

	// line 12
	if (Apc.Size == 2)
	{
		// line 15
		var = Thread.UserIdealProcessor;
	}
	
	// line 18
	Environment = Apc;

	// line 19 - 20
	NormalRoutine = KernelRoutine;

	// line 21 - 22
	ApcMode = RundownRoutine;

	// line 23 - 24
	NormalContext = NormalRoutine;

	// line 28
	if (NormalRoutine == 0) // 0 is for kernel APC's and 1 for user ones.
	{
		// line 38 - 39
		// = NormalRoutine;		
	} else {
		// line 31 - 34
		// d = var;
	}
}



	

