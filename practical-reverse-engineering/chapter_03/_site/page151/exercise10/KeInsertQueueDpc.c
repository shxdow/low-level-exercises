BOOLEAN KeInsertQueueDpc(
  _Inout_  PRKDPC Dpc,
  _In_opt_ PVOID  SystemArgument1,
  _In_opt_ PVOID  SystemArgument2
)
{
	KIRQL oldIRQL;
	PRCB CpuPRCB, otherPRCB;
	
	KeRaiseIrql(0x1F, &oldIRQL);

	// DS contains _KPCR (FFDFF000 on XP) (+ 0x20 _KPRCB)
	CpuPRCB = KeGetCurrentPrcb();
	
	// line 16 - 17
	// CpuPRCB.DpcLock wat?
	// Locks stuff
	KeAcquireSpinLock(&CpuPRCB.DpcLock);
	
	// line 18 retrives the _KPRCB+0x1C (wat)
	
	// line 23 (this is 100% bs by me)
	// there must be another PRCB structure that I'm missing
	if (CpuPRCB == 0) {
		// CpuPRCB = Dpc;
		CpuPRCB	= otherPRCB;
	}
	else if (== 0) {
		++CpuPRCB.DpcCount;
		++CpuPRCB.DpcQueueDepth;
		
		// 
		CpuPRCB.Setmember = CpuPRCB.IdleThread;
		
		// line 34 - 35
		CpuPRCB.CpuType = Dpc.DefferedRoutine;
		
		// line 31 is clearly checking if a (wat?)
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
	
	// If stuff failed (I think it's a fail case)
	KeLowerIrql(&oldIRQL);
	
	if (CpuPRCB == 0) {
		return FALSE;
	}
	return TRUE;
}
