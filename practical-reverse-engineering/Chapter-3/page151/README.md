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
		- [ ] KeInitializeProcess
		- [ ] KeInitializeTimerEx
		- [ ] KeInitializeTimerTable
		- [ ] KiInitializeProcessor
		- [ ] KiInitializeThread
		- [ ] MiInitializeLoadedModuleList
		- [ ] MiInitializePrefetchHead
		- [ ] PspAllocateProcess
		- [ ] PspAllocateThread

Identify where InitializeListHead is inlined in these routines
