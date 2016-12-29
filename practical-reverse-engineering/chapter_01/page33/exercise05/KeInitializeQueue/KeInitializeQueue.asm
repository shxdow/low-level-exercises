kd> uf KeInitializeQueue
nt!KeInitializeQueue:
804fb09a 8bff            mov     edi,edi
804fb09c 55              push    ebp
804fb09d 8bec            mov     ebp,esp
804fb09f 8b4508          mov     eax,dword ptr [ebp+8]
804fb0a2 83600400        and     dword ptr [eax+4],0
804fb0a6 c60004          mov     byte ptr [eax],4
804fb0a9 c640020a        mov     byte ptr [eax+2],0Ah
804fb0ad 8d4808          lea     ecx,[eax+8]
804fb0b0 894904          mov     dword ptr [ecx+4],ecx
804fb0b3 8909            mov     dword ptr [ecx],ecx
804fb0b5 8d4810          lea     ecx,[eax+10h]
804fb0b8 894904          mov     dword ptr [ecx+4],ecx
804fb0bb 8909            mov     dword ptr [ecx],ecx
804fb0bd 8d4820          lea     ecx,[eax+20h]
804fb0c0 894904          mov     dword ptr [ecx+4],ecx
804fb0c3 8909            mov     dword ptr [ecx],ecx
804fb0c5 8b4d0c          mov     ecx,dword ptr [ebp+0Ch]
804fb0c8 83601800        and     dword ptr [eax+18h],0
804fb0cc 85c9            test    ecx,ecx
804fb0ce 7507            jne     nt!KeInitializeQueue+0x3d (804fb0d7)

nt!KeInitializeQueue+0x36:
804fb0d0 0fbe0de0c65480  movsx   ecx,byte ptr [nt!KeNumberProcessors (8054c6e0)]

nt!KeInitializeQueue+0x3d:
804fb0d7 89481c          mov     dword ptr [eax+1Ch],ecx
804fb0da 5d              pop     ebp
8
