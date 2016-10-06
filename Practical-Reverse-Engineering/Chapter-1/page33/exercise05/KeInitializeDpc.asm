lkd> uf KeInitializeDpc
nt!KeInitializeDpc:
828ff039 8bff            mov     edi,edi
828ff03b 55              push    ebp
828ff03c 8bec            mov     ebp,esp
828ff03e 8b4508          mov     eax,dword ptr [ebp+8]   ; eax = & Dpc
828ff041 33c9            xor     ecx,ecx			     ; ecx = 0
828ff043 83601c00        and     dword ptr [eax+1Ch],0   ; SystemArgument1 = 0
828ff047 c60013          mov     byte ptr [eax],13h	     ; Dpc.Type = 19
828ff04a c6400101        mov     byte ptr [eax+1],1	     ; Dpc.Importance = 1
828ff04e 66894802        mov     word ptr [eax+2],cx   	 ; Dpc.Number = 0
828ff052 8b4d0c          mov     ecx,dword ptr [ebp+0Ch] ; ecx = &Dcp.ListEntry
828ff055 89480c          mov     dword ptr [eax+0Ch],ecx ; Dpc.DpcListEntry = ecx // It's now a pointer
828ff058 8b4d10          mov     ecx,dword ptr [ebp+10h] ; ecx = Dpc.Number
828ff05b 894810          mov     dword ptr [eax+10h],ecx ; Dpc.Number = ecx		  // Same ^
828ff05e 5d              pop     ebp
828ff05f c20c00          ret     0Ch


typedef struct _KDPC
{
     UCHAR Type;				// ebp+8
     UCHAR Importance;			// ebp+9 
     WORD Number;				// ebp+10
     LIST_ENTRY DpcListEntry;	// ebp+12
     PVOID DeferredRoutine;		// ebp+20
     PVOID DeferredContext;		// ebp+24
     PVOID SystemArgument1;		// ebp+28
     PVOID SystemArgument2;		// ebp+32
     PVOID DpcData;				// ebp+36
} KDPC, *PKDPC;