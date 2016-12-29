1. - [ ] On Windows 8 x64, the following kernel functions have
	 	 InitalizeListHead inlined at least once:

		- [x] CcAllocateInitializeMbcb
		- [x] CmpInitCallbacks
		- [x] ExCreateCallback
		- [x] ExpInitSystemPhase0
		- [x] ExpInitSystemPhase1
		- [x] ExpTimerInitialization
		- [x] InitBootProcessor
		- [x] IoCreateDevice
		- [x] IoInitializeIrp
		- [x] KeInitThread
		- [x] KeInitializeMutex
		- [x] KeInitializeProcess
		- [x] KeInitializeTimerEx
		- [x] KeInitializeTimerTable
		- [x] KiInitializeProcessor
		- [x] KiInitializeThread
		- [x] MiInitializeLoadedModuleList
		- [x] MiInitializePrefetchHead
		- [x] PspAllocateProcess
		- [ ] PspAllocateThread

Identify where InitializeListHead is inlined in these routines
