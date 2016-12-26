VOID NTAPI KeReadyThread(PKTHREAD Thread)
{
	// The KeRaiseIrqlToDpcLevel routine raises the hardware priority to 
	// IRQL = DISPATCH_LEVEL, thereby masking off interrupts of equivalent or
	// lower IRQL on the current processor.
	KIRQL irql = KeRaiseIrqlToDpcLevel();
	
	KiReadyThread(Thread);
	/*
	 * The Windows scheduling code is implemented in the kernel.
	 * There’s no single “scheduler” module or routine, however—the code is spread
	 * throughout the kernel in which scheduling-related events occur.
	 * The routines that perform these duties are collectively called the kernel’s dispatcher
	 */

	KiUnlockDispatcherDatabase();

	return ;
}
