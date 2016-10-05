lkd> uf KeInitializeDpc
nt!KeInitializeDpc:
828ff039 8bff            mov     edi,edi
828ff03b 55              push    ebp
828ff03c 8bec            mov     ebp,esp
828ff03e 8b4508          mov     eax,dword ptr [ebp+8]
828ff041 33c9            xor     ecx,ecx
828ff043 83601c00        and     dword ptr [eax+1Ch],0
828ff047 c60013          mov     byte ptr [eax],13h
828ff04a c6400101        mov     byte ptr [eax+1],1
828ff04e 66894802        mov     word ptr [eax+2],cx
828ff052 8b4d0c          mov     ecx,dword ptr [ebp+0Ch]
828ff055 89480c          mov     dword ptr [eax+0Ch],ecx
828ff058 8b4d10          mov     ecx,dword ptr [ebp+10h]
828ff05b 894810          mov     dword ptr [eax+10h],ecx
828ff05e 5d              pop     ebp
828ff05f c20c00          ret     0Ch