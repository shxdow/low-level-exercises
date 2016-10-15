lkd> uf ObFastDereferenceObject
nt!ObFastDereferenceObject:
8288c48b 8bff            mov     edi,edi
8288c48d 55              push    ebp
8288c48e 8bec            mov     ebp,esp
8288c490 51              push    ecx
8288c491 8b0a            mov     ecx,dword ptr [edx]
8288c493 56              push    esi
8288c494 57              push    edi
8288c495 8bc1            mov     eax,ecx
8288c497 eb13            jmp     nt!ObFastDereferenceObject+0x21 (8288c4ac)

nt!ObFastDereferenceObject+0xe:
8288c499 8d4101          lea     eax,[ecx+1]
8288c49c 8bf0            mov     esi,eax
8288c49e 8bfa            mov     edi,edx
8288c4a0 8bc1            mov     eax,ecx
8288c4a2 f00fb137        lock cmpxchg dword ptr [edi],esi
8288c4a6 3bc1            cmp     eax,ecx
8288c4a8 7412            je      nt!ObFastDereferenceObject+0x31 (8288c4bc)

nt!ObFastDereferenceObject+0x1f:
8288c4aa 8bc8            mov     ecx,eax

nt!ObFastDereferenceObject+0x21:
8288c4ac 334508          xor     eax,dword ptr [ebp+8]
8288c4af 83f807          cmp     eax,7
8288c4b2 72e5            jb      nt!ObFastDereferenceObject+0xe (8288c499)

nt!ObFastDereferenceObject+0x29:
8288c4b4 8b4d08          mov     ecx,dword ptr [ebp+8]
8288c4b7 e807ba0200      call    nt!ObfDereferenceObject (828b7ec3)

nt!ObFastDereferenceObject+0x31:
8288c4bc 5f              pop     edi
8288c4bd 5e              pop     esi
8288c4be 59              pop     ecx
8288c4bf 5d              pop     ebp
8288c4c0 c20400          ret     4