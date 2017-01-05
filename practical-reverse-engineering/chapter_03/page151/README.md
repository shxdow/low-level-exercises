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

2. - [ ]  Repeat the previous exercise for InsertHeadList in the
		  following routines:

		- [x] CcSetVacbInFreeList
		- [x] CmpDoSort
		- [x] ExBurnMemory
		- [x] ExFreePoolWithTag
		- [x] IoPageRead
		- [x] IovpCallDriver1
		- [x] KeInitThread
		- [x] KiInsertQueueApc
		- [x] KeInsertQueueDpc
		- [x] KiQueueReadyThread
		- [ ] MiInsertInSystemSpace
		- [x] MiUpdateWsle
		- [x] ObpInsertCallbackByAltitude

3. - [x]  Repeat the previous exercise for InsertTailList in the
		  following routines:

	  	- [x] AlpcpCreateClientPort
	  	- [x] AlpcpCreateSection
	  	- [x] AlpcpCreateView
	  	- [x] AuthzBasepAddSecurityAttributeToLists
	  	- [x] CcFlushCachePriv
		- [x] CcInitializeCacheManager
		- [x] CcInsertVacbArray
		- [x] CcSetFileSizesEx
		- [x] CmRenameKey
		- [x] ExAllocatePoolWithTag
		- [x] ExFreePoolWithTag
		- [x] ExQueueWorkItem
		- [x] ExRegisterCallback
		- [x] ExpSetTimer
		- [x] IoSetIoCompletionEx2
		- [x] KeInsertQueueDpc
		- [x] KeStartThread
		- [x] KiAddThreadToScbQueue
		- [x] KiInsertQueueApc
		- [x] KiQueueReadyThread
		- [x] MiInsertNewProcess
		- [x] PnpRequestDeviceAction
		- [x] PspInsertProcess
		- [x] PspInsertThread

4. - [ ] Repeat the previous exercise for RemoveHeadList
		 in the following routines:

		- [x] AlpcpFlushResourcesPort
		- [x] CcDeleteMbcb
		- [x] CcGetVacbMiss
		- [x] CmpLazyCommitWorker
		- [x] ExAllocatePoolWithTag
		- [x] FsRtlNotifyCompleteIrpList
		- [ ] IopInitializeBootDrivers
		- [x] KiProcessDisconnectList
		- [x] PnpDeviceCompletionQueueGetCompletedRequest
		- [x] RtlDestroyAtomTable
		- [x] RtlEmptyAtomTable
		- [x] RtlpFreeAllAto

5. - [ ] Repeat the previous exercise for RemoveTailList
		 in the following routines:

		- [ ] BootApplicationPersistentDataProcess
		- [ ] CmpCallCallBacks
		- [ ] CmpDelayCloseWorker
		- [ ] ObpCallPostOperationCallbacks
		- [ ] RaspAddCacheEntry






