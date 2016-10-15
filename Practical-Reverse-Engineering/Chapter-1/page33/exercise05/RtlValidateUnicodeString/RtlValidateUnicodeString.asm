lkd> uf RtlValidateUnicodeString
nt!RtlValidateUnicodeString:
8286a342 8bff            mov     edi,edi
8286a344 55              push    ebp
8286a345 8bec            mov     ebp,esp
8286a347 56              push    esi
8286a348 33f6            xor     esi,esi
8286a34a 397508          cmp     dword ptr [ebp+8],esi
8286a34d 7407            je      nt!RtlValidateUnicodeString+0x14 (8286a356)

nt!RtlValidateUnicodeString+0xd:
8286a34f b80d0000c0      mov     eax,0C000000Dh
8286a354 eb3f            jmp     nt!RtlValidateUnicodeString+0x53 (8286a395)

nt!RtlValidateUnicodeString+0x14:
8286a356 8b450c          mov     eax,dword ptr [ebp+0Ch]
8286a359 3bc6            cmp     eax,esi
8286a35b 7436            je      nt!RtlValidateUnicodeString+0x51 (8286a393)

nt!RtlValidateUnicodeString+0x1b:
8286a35d 0fb710          movzx   edx,word ptr [eax]
8286a360 f6c201          test    dl,1
8286a363 7529            jne     nt!RtlValidateUnicodeString+0x4c (8286a38e)

nt!RtlValidateUnicodeString+0x23:
8286a365 0fb74802        movzx   ecx,word ptr [eax+2]
8286a369 f6c101          test    cl,1
8286a36c 7520            jne     nt!RtlValidateUnicodeString+0x4c (8286a38e)

nt!RtlValidateUnicodeString+0x2c:
8286a36e 663bd1          cmp     dx,cx
8286a371 771b            ja      nt!RtlValidateUnicodeString+0x4c (8286a38e)

nt!RtlValidateUnicodeString+0x31:
8286a373 57              push    edi
8286a374 bffeff0000      mov     edi,0FFFEh
8286a379 663bcf          cmp     cx,di
8286a37c 5f              pop     edi
8286a37d 770f            ja      nt!RtlValidateUnicodeString+0x4c (8286a38e)

nt!RtlValidateUnicodeString+0x3d:
8286a37f 397004          cmp     dword ptr [eax+4],esi
8286a382 750f            jne     nt!RtlValidateUnicodeString+0x51 (8286a393)

nt!RtlValidateUnicodeString+0x42:
8286a384 663bd6          cmp     dx,si
8286a387 7505            jne     nt!RtlValidateUnicodeString+0x4c (8286a38e)

nt!RtlValidateUnicodeString+0x47:
8286a389 663bce          cmp     cx,si
8286a38c 7405            je      nt!RtlValidateUnicodeString+0x51 (8286a393)

nt!RtlValidateUnicodeString+0x4c:
8286a38e be0d0000c0      mov     esi,0C000000Dh

nt!RtlValidateUnicodeString+0x51:
8286a393 8bc6            mov     eax,esi

nt!RtlValidateUnicodeString+0x53:
8286a395 5e              pop     esi
8286a396 5d              pop     ebp
8286a397 c20800          ret     8