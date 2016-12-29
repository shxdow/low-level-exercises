kd>uf RtlValidateUnicodeString
Flow analysis was incomplete, some code may be missing
ntdll!RtlValidateUnicodeString:
7c9156d2 8bff            mov     edi,edi
7c9156d4 55              push    ebp
7c9156d5 8bec            mov     ebp,esp
7c9156d7 837d0800        cmp     dword ptr [ebp+8],0
7c9156db 0f850a6a0300    jne     ntdll!RtlValidateUnicodeString+0xb (7c94c0eb)

ntdll!RtlValidateUnicodeString+0x12:
7c9156e1 8b4d0c          mov     ecx,dword ptr [ebp+0Ch]
7c9156e4 85c9            test    ecx,ecx
7c9156e6 56              push    esi
7c9156e7 57              push    edi
7c9156e8 7433            je      ntdll!RtlValidateUnicodeString+0x5a (7c91571d)

ntdll!RtlValidateUnicodeString+0x1b:
7c9156ea 668b39          mov     di,word ptr [ecx]
7c9156ed 0fb7c7          movzx   eax,di
7c9156f0 6a02            push    2
7c9156f2 99              cdq
7c9156f3 5e              pop     esi
7c9156f4 f7fe            idiv    eax,esi
7c9156f6 85d2            test    edx,edx
7c9156f8 7532            jne     ntdll!RtlValidateUnicodeString+0x53 (7c91572c)

ntdll!RtlValidateUnicodeString+0x2b:
7c9156fa 668b7102        mov     si,word ptr [ecx+2]
7c9156fe 53              push    ebx
7c9156ff 0fb7c6          movzx   eax,si
7c915702 6a02            push    2
7c915704 99              cdq
7c915705 5b              pop     ebx
7c915706 f7fb            idiv    eax,ebx
7c915708 5b              pop     ebx
7c915709 85d2            test    edx,edx
7c91570b 751f            jne     ntdll!RtlValidateUnicodeString+0x53 (7c91572c)

ntdll!RtlValidateUnicodeString+0x3e:
7c91570d 663bfe          cmp     di,si
7c915710 771a            ja      ntdll!RtlValidateUnicodeString+0x53 (7c91572c)

ntdll!RtlValidateUnicodeString+0x43:
7c915712 6685ff          test    di,di
7c915715 740e            je      ntdll!RtlValidateUnicodeString+0x48 (7c915725)

ntdll!RtlValidateUnicodeString+0x4d:
7c915717 83790400        cmp     dword ptr [ecx+4],0
7c91571b 740f            je      ntdll!RtlValidateUnicodeString+0x53 (7c91572c)

ntdll!RtlValidateUnicodeString+0x5a:
7c91571d 33c0            xor     eax,eax

ntdll!RtlValidateUnicodeString+0x5c:
7c91571f 5f              pop     edi
7c915720 5e              pop     esi
7c915721 5d              pop     ebp
7c915722 c20800          ret     8

ntdll!RtlValidateUnicodeString+0x48:
7c915725 6685f6          test    si,si
7c915728 75ed            jne     ntdll!RtlValidateUnicodeString+0x4d (7c915717)

ntdll!RtlValidateUnicodeString+0x4d:
7c91572a ebf1            jmp     ntdll!RtlValidateUnicodeString+0x5a (7c91571d)

ntdll!RtlValidateUnicodeString+0x53:
7c91572c b80d0000c0      mov     eax,0C000000Dh
7c915731 ebec            jmp     ntdll!RtlValidateUnicodeString+0x5c (7c91571f)
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
