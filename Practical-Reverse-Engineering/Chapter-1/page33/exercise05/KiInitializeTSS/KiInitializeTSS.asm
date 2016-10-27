kd> uf KiInitializeTSS
nt!KiInitializeTSS:
804ff400 8bff            mov     edi,edi
804ff402 55              push    ebp
804ff403 8bec            mov     ebp,esp
804ff405 8b4508          mov     eax,dword ptr [ebp+8]
804ff408 6683606400      and     word ptr [eax+64h],0
804ff40d 6683606000      and     word ptr [eax+60h],0
804ff412 66c74066ac20    mov     word ptr [eax+66h],20ACh
804ff418 66c740081000    mov     word ptr [eax+8],10h
804ff41e 5d              pop     ebp
804ff41f c20400          ret     4
