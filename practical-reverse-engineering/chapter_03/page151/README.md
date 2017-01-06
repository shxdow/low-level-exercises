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
		- [x] CmpCallCallBacks
		- [x] CmpDelayCloseWorker
		- [x] ObpCallPostOperationCallbacks
		- [x] RaspAddCacheEntry

6. - [ ] Repeat the previous exercise for RemoveEntryList
		 in the following routines:

		- [x] AlpcSectionDeleteProcedure
		- [ ] AlpcpDeletePort
		- [x] AlpcpUnregisterCompletionListDatabase
		- [ ] AuthzBasepRemoveSecurityAttributeFromLists
		- [ ] CcDeleteBcbs
		- [ ] CcFindNextWorkQueueEntry
		- [ ] CcLazyWriteScan
		- [ ] CcSetFileSizesEx
		- [ ] CmShutdownSystem
		- [ ] CmUnRegisterCallback
		- [ ] CmpCallCallBacks
		- [ ] CmpPostApc
		- [ ] ExFreePoolWithTag
		- [ ] ExQueueWorkItem
		- [ ] ExTimerRundown
		- [ ] ExpDeleteTimer
		- [ ] ExpSetTimer
		- [ ] IoDeleteDevice
		- [ ] IoUnregisterFsRegistrationChange
		- [ ] IopfCompleteRequest
		- [ ] KeDeregisterBugCheckCallback
		- [ ] KeDeregisterObjectNotification
		- [ ] KeRegisterObjectNotification
		- [ ] KeRemoveQueueApc
		- [ ] KeRemoveQueueDpc
		- [ ] KiCancelTimer
		- [ ] KeTerminateThread
		- [ ] KiDeliverApc
		- [ ] KiExecuteAllDpcs
		- [ ] KiExpireTimerTable
		- [ ] KiFindReadyThread
		- [ ] KiFlushQueueApc
		- [ ] KiInsertTimerTable
		- [ ] KiProcessExpiredTimerList
		- [ ] MiDeleteVirtualAddresses
		- [ ] NtNotifyChangeMultipleKeys
		- [ ] ObRegisterCallbacks
		- [ ] ObUnRegisterCallbacks

7. - [ ] Repeat the previous exercises on Windows 8 x86/ARM and Windows 7 
		 x86/x64. What were the differences (if any)?

8. - [ ] If you did the exercises for InsertHeadList, InsertTailList,
		 RemoveHeadList, RemoveTailList, and RemoveEntryList on Windows 8,
		 you should have observed a code construct common to all these func-
	 	 tions. This construct should also enable you to easily spot the inlined
		 list insertion and removal routines. Explain this code construct and
		 why it is there.
		 Hint: This construct exists only on Windows 8 and it requires you to
		 look at the IDT.

9. - [ ] In the walk-through, we mentioned that a driver can enumerate all
		 loaded modules with the documented API AuxKlibQueryModuleInformation.
		 Does this API guarantee that the returned module list is always
		 up-to-date? Explain your answer.
		 Next, reverse engineer AuxKlibQueryModuleInformation on Windows 8 and
		 explain how it works. How does it handle the case when multiple threads
		 are requesting access to the loaded module list? Note: The internal
		 function handling this request (and others) is fairly large, so you
		 will need some patience. Alternatively, you can use a debugger to help
		 you trace the interesting code.
