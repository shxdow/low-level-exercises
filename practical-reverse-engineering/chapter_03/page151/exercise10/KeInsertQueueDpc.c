BOOLEAN KeInsertQueueDpc(
  _Inout_  PRKDPC Dpc,
  _In_opt_ PVOID  SystemArgument1,
  _In_opt_ PVOID  SystemArgument2
)
{
	KIRQL oldIRQL;
	PRCB CpuPRCB;
	
	KeRaiseIrql(0x1F, &oldIRQL);

	// DS contains _KPCR (FFDFF000 on XP) (+ 0x20 _KPRCB)
	CpuPRCB = KeGetCurrentPrcb();
	
	// line 16 - 17
	// wat Dpc.Type = CpuPRCB.DpcLock;
	= CpuPRCB.DpcLock;
	
	// line 18 retrives the _KPRCB+0x1C (wat)
	CpuPRCB.MinorVersion = CpuPRCB.ProcessorState;
	
	// line 23
	if (CpuPRCB == 0) {
		CpuPRCB = Dpc;
	}
	else if (Dpc == 0) {
		++CpuPRCB.DpcCount;
		++CpuPRCB.DpcQueueDepth;
		
		// 
		CpuPRCB.Setmember = CpuPRCB.IdleThread;
		
		// line 34 - 35
		CpuPRCB.CpuType = Dpc.DefferedRoutine;
		
		// line 31 is clearly checking if a (nvm
		if (CpuPRCB.MajorVersion == 2) {
			// CpuPRCB.CurrentThread = CpuPRCB.DpcListHead;
			InsertTailList(CpuPRCB.DpcListHead, Dpc.DpcListEntry);
		} eles {
			// cba, it does stuff
		}
		
		// lin 56
		if (CpuPRCB.DpcRoutineActive == 0) {
			// line 60
			if (CpuPRCB.DpcInterruptRequested == 0) {
				// line 64 this has to jump in the code in the inner if aswell
				if (CpuPRCB.MajorVersion == 0) {
					// line 69
					if (CpuPRCB.DpcQueueDepth >= CpuPRCB.MaximumDpcQueueDepth) {
						// line 79
						CpuPRCB.DpcInterruptRequested = 1;
						HalRequestSoftwareInterrupt();
					}
				}				
			}
		}
	}
	
	// If stuff is ok / failed (I think it's a fail case)
	KeLowerIrql(&oldIRQL);
	
	if (CpuPRCB == 0) {
		return FALSE;
	}
	
	return TRUE;
}
