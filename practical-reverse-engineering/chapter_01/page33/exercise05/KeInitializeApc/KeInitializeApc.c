NTKERNELAPI VOID KeInitializeApc (
	
	IN PRKAPC Apc,
	
	IN PKTHREAD Thread,
	
	IN KAPC_ENVIRONMENT Environment,
	
	IN PKKERNEL_ROUTINE KernelRoutine,
	
	IN PKRUNDOWN_ROUTINE RundownRoutine OPTIONAL,
	
	IN PKNORMAL_ROUTINE NormalRoutine OPTIONAL,
	
	IN KPROCESSOR_MODE ApcMode,
	
	IN PVOID NormalContext

){
	BYTE byte_var;
	Apc.Type = 0x12;
	Apc.Size = 0x30;

	// line 12
	if (Apc.Size == 2)
	{
		// line 15
		byte_var = Thread.UserIdealProcessor;
	}
	
	// line 18
	Apc.Thread = Thread;

	// line 19 - 20
	Apc.KernelRoutine = KernelRoutine;

	// line 22
	Apc.StateIndex = byte_var;
	
	// line 21 - 23
	Apc.RundownRoutine = RundownRoutine;

	// line 23 - 24
	Apc.NormalRoutine = NormalRoutine;

	// line 28
	if (Apc.NormalRoutine == 0) // 0 is for kernel APC's and 1 for user ones.
	{
		// line 38 - 39
		Apc.ApcMode = byte_var;
		Apc.NormalContext = 0;

	} else {
		// line 31 - 34
		Apc.Mode = ApcMode;
		Apc.NormalContext = NormalContext;
	}

	// line 42
	Apc.Inserted = 0;
}
