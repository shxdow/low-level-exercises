VOID KeInitializeDpc(
  _Out_    PRKDPC             Dpc,
  _In_     PKDEFERRED_ROUTINE DeferredRoutine,
  _In_opt_ PVOID              DeferredContext)
{  
        Dpc.Data = 0;
        Dpc.Type = 0x13;
        Dpc.Importance = 1;
        Dpc.Number = 0;
        Dpc->DeferredRoutine = DeferredRoutine;
        Dpc->DeferredContext = DeferredContext;
}
