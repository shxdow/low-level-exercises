
kd>uf ObFastDereferenceObject
nt!ObFastDereferenceObject:
805bbf90 8bff            mov     edi,edi
805bbf92 55              push    ebp
805bbf93 8bec            mov     ebp,esp
805bbf95 83ec0c          sub     esp,0Ch
805bbf98 53              push    ebx
805bbf99 56              push    esi
805bbf9a 57              push    edi
805bbf9b 8bf9            mov     edi,ecx
805bbf9d 8bda            mov     ebx,edx
805bbf9f 897df8          mov     dword ptr [ebp-8],edi

nt!ObFastDereferenceObject+0x12:
805bbfa2 8b37            mov     esi,dword ptr [edi]
805bbfa4 8bc6            mov     eax,esi
805bbfa6 33c3            xor     eax,ebx
805bbfa8 83f807          cmp     eax,7
805bbfab 8975f4          mov     dword ptr [ebp-0Ch],esi
805bbfae 7318            jae     nt!ObFastDereferenceObject+0x38 (805bbfc8)

nt!ObFastDereferenceObject+0x20:
805bbfb0 8d4601          lea     eax,[esi+1]
805bbfb3 8945fc          mov     dword ptr [ebp-4],eax
805bbfb6 8b45f4          mov     eax,dword ptr [ebp-0Ch]
805bbfb9 8b4df8          mov     ecx,dword ptr [ebp-8]
805bbfbc 8b55fc          mov     edx,dword ptr [ebp-4]
805bbfbf 0fb111          cmpxchg dword ptr [ecx],edx
805bbfc2 3bc6            cmp     eax,esi
805bbfc4 75dc            jne     nt!ObFastDereferenceObject+0x12 (805bbfa2)

nt!ObFastDereferenceObject+0x36:
805bbfc6 eb07            jmp     nt!ObFastDereferenceObject+0x3f (805bbfcf)

nt!ObFastDereferenceObject+0x38:
805bbfc8 8bcb            mov     ecx,ebx
805bbfca e8876cf6ff      call    nt!ObfDereferenceObject (80522c56)

nt!ObFastDereferenceObject+0x3f:
805bbfcf 5f              pop     edi
805bbfd0 5e              pop     esi
805bbfd1 5b              pop     ebx
805bbfd2 c9              leave
805bbfd3 c3              ret
