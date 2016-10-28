VOID NTAPI KeReadyThread(PKTHREAD Thread)
{
	// The KeRaiseIrqlToDpcLevel routine raises the hardware priority to 
	// IRQL = DISPATCH_LEVEL, thereby masking off interrupts of equivalent or
	// lower IRQL on the current processor.
	KIRQL IRQL = KeRaiseIrqlToDpcLevel(void);
	
	KiReadyThread();
	KiUnlockDispatcherDatabase();
	return ;
}