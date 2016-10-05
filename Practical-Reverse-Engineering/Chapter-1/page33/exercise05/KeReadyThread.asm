lkd> uf KeReadyThread
nt!KeReadyThread:
829080f6 8bff            mov     edi,edi
829080f8 56              push    esi
829080f9 8bf0            mov     esi,eax
829080fb 8b4650          mov     eax,dword ptr [esi+50h]
829080fe 8b4874          mov     ecx,dword ptr [eax+74h]
82908101 f6c107          test    cl,7
82908104 7409            je      nt!KeReadyThread+0x19 (8290810f)

nt!KeReadyThread+0x10:
82908106 e8e7cef6ff      call    nt!KiInSwapSingleProcess (82874ff2)
8290810b 84c0            test    al,al
8290810d 7505            jne     nt!KeReadyThread+0x1e (82908114)

nt!KeReadyThread+0x19:
8290810f e87c70feff      call    nt!KiFastReadyThread (828ef190)

nt!KeReadyThread+0x1e:
82908114 5e              pop     esi
82908115 c3              ret