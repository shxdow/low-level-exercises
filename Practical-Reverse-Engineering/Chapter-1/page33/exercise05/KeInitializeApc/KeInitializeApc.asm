kd> uf KeInitializeApc
nt!KeInitializeApc:
804faa6e 8bff            mov     edi,edi
804faa70 55              push    ebp
804faa71 8bec            mov     ebp,esp
804faa73 8b4508          mov     eax,dword ptr [ebp+8]
804faa76 8b5510          mov     edx,dword ptr [ebp+10h]
804faa79 83fa02          cmp     edx,2
804faa7c 8b4d0c          mov     ecx,dword ptr [ebp+0Ch]
804faa7f 66c7001200      mov     word ptr [eax],12h
804faa84 66c740023000    mov     word ptr [eax+2],30h
804faa8a 7506            jne     nt!KeInitializeApc+0x24 (804faa92)

nt!KeInitializeApc+0x1e:
804faa8c 8a9165010000    mov     dl,byte ptr [ecx+165h]

nt!KeInitializeApc+0x24:
804faa92 894808          mov     dword ptr [eax+8],ecx
804faa95 8b4d14          mov     ecx,dword ptr [ebp+14h]
804faa98 894814          mov     dword ptr [eax+14h],ecx
804faa9b 8b4d18          mov     ecx,dword ptr [ebp+18h]
804faa9e 88502c          mov     byte ptr [eax+2Ch],dl
804faaa1 894818          mov     dword ptr [eax+18h],ecx
804faaa4 8b4d1c          mov     ecx,dword ptr [ebp+1Ch]
804faaa7 33d2            xor     edx,edx
804faaa9 3bca            cmp     ecx,edx
804faaab 89481c          mov     dword ptr [eax+1Ch],ecx
804faaae 740e            je      nt!KeInitializeApc+0x50 (804faabe)

nt!KeInitializeApc+0x42:
804faab0 8a4d20          mov     cl,byte ptr [ebp+20h]
804faab3 88482d          mov     byte ptr [eax+2Dh],cl
804faab6 8b4d24          mov     ecx,dword ptr [ebp+24h]
804faab9 894820          mov     dword ptr [eax+20h],ecx
804faabc eb06            jmp     nt!KeInitializeApc+0x56 (804faac4)

nt!KeInitializeApc+0x50:
804faabe 88502d          mov     byte ptr [eax+2Dh],dl
804faac1 895020          mov     dword ptr [eax+20h],edx

nt!KeInitializeApc+0x56:
804faac4 88502e          mov     byte ptr [eax+2Eh],dl
804faac7 5d              pop     ebp
804faac8 c22000          ret     20h

NTKERNELAPI VOID KeInitializeApc (

	IN PRKAPC Apc,
	
	IN PKTHREAD Thread,
	
	IN KAPC_ENVIRONMENT Environment,
	
	IN PKKERNEL_ROUTINE KernelRoutine,
	
	IN PKRUNDOWN_ROUTINE RundownRoutine OPTIONAL,
	
	IN PKNORMAL_ROUTINE NormalRoutine OPTIONAL,
	
	IN KPROCESSOR_MODE ApcMode,
	
	IN PVOID NormalContext

);

kd> dt _KAPC
dtx is unsupported for this scenario.  It only recognizes dtx [<type>] [<address>] with -a, -h, and -r.  Reverting to dt.
nt!_KAPC
   +0x000 Type             : Int2B
   +0x002 Size             : Int2B
   +0x004 Spare0           : Uint4B
	    +0x008 Thread           : Ptr32 _KTHREAD
	       +0x00c ApcListEntry     : _LIST_ENTRY
	          +0x014 KernelRoutine    : Ptr32     void
		     +0x018 RundownRoutine   : Ptr32     void
		        +0x01c NormalRoutine    : Ptr32     void
			   +0x020 NormalContext    : Ptr32 Void
			      +0x024 SystemArgument1  : Ptr32 Void
			         +0x028 SystemArgument2  : Ptr32 Void
				    +0x02c ApcStateIndex    : Char
				       +0x02d ApcMode          : Char
				          +0x02e Inserted         : UChar
