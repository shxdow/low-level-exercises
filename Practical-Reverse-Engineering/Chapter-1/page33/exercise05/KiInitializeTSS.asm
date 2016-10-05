lkd> uf KiInitializeTSS
nt!KiInitializeTSS:
82851a6c 8bff            mov     edi,edi
82851a6e 55              push    ebp
82851a6f 8bec            mov     ebp,esp
82851a71 8b4508          mov     eax,dword ptr [ebp+8]
82851a74 b9ac200000      mov     ecx,20ACh
82851a79 66894866        mov     word ptr [eax+66h],cx
82851a7d 33c9            xor     ecx,ecx
82851a7f 6a10            push    10h
82851a81 66894864        mov     word ptr [eax+64h],cx
82851a85 66894860        mov     word ptr [eax+60h],cx
82851a89 59              pop     ecx
82851a8a 66894808        mov     word ptr [eax+8],cx
82851a8e 5d              pop     ebp
82851a8f c20400          ret     4