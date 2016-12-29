VOID KeInitializeQueue(
  _Out_ PRKQUEUE Queue,
  _In_  ULONG    Count
)
{
	// line 7
	Queue->SignalState = null;
	
	// line 8
	Queue->Header.Type = 4;
	
	// line 9
	Queue->Header.Size = 0xA;
	
	// line 10 - 11
	Queue->Header->WaitListHead.Blink = &(Queue->Header->WaitListHead);
	Queue->Header->WaitListHead.Flink = &(Queue->Header->WaitListHead);
	
	// line 13 - 14
	Queue->EntryListHead.Blink = &(Queue->EntryListHead);
	Queue->EntryListHead.Flink = &(Queue->EntryListHead);
	
	// line 16 - 17
	Queue->ThreadListHead->Blink = &(Queue-ThreadListHead);
	Queue->ThreadListHead->Flink = &(Queue-ThreadListHead);
	
	// line 19 - 20
	Queue.CurrentCount = 0;
	
	// line 22
	if (Count == 0)
	{	// line 25
		Queue.MaximumCount = KeNumberProcessors();
	} else {
		// line 28
		Queue.MaximumCount = Count;
	}
	return ;
}

/*
kd> dt _KQUEUE
ntdll!_KQUEUE
   +0x000 Header           : _DISPATCHER_HEADER
   +0x010 EntryListHead    : _LIST_ENTRY
   +0x018 CurrentCount     : Uint4B
   +0x01c MaximumCount     : Uint4B
   +0x020 ThreadListHead   : _LIST_ENTRY
   
kd> dt _DISPATCHER_HEADER
ntdll!_DISPATCHER_HEADER
   +0x000 Type             : UChar
   +0x001 Absolute         : UChar
   +0x002 Size             : UChar
   +0x003 Inserted         : UChar
   +0x004 SignalState      : Int4B
   +0x008 WaitListHead     : _LIST_ENTRY

kd> dt _LIST_ENTRY
ntdll!_LIST_ENTRY
   +0x000 Flink            : Ptr32 _LIST_ENTRY
   +0x004 Blink            : Ptr32 _LIST_ENTRY
*/