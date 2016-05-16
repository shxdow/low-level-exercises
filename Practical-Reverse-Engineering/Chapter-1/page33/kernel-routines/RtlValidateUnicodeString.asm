nt!RtlValidateUnicodeString:
8285e015 8bff            mov     edi,edi
8285e017 55              push    ebp
8285e018 8bec            mov     ebp,esp
8285e01a 56              push    esi
8285e01b 33f6            xor     esi,esi
8285e01d 397508          cmp     dword ptr [ebp+8],esi
8285e020 7407            je      nt!RtlValidateUnicodeString+0x14 (8285e029)

nt!RtlValidateUnicodeString+0xd:
8285e022 b80d0000c0      mov     eax,0C000000Dh
8285e027 eb3f            jmp     nt!RtlValidateUnicodeString+0x53 (8285e068)

nt!RtlValidateUnicodeString+0x14:
8285e029 8b450c          mov     eax,dword ptr [ebp+0Ch]
8285e02c 3bc6            cmp     eax,esi
8285e02e 7436            je      nt!RtlValidateUnicodeString+0x51 (8285e066)

nt!RtlValidateUnicodeString+0x1b:
8285e030 0fb710          movzx   edx,word ptr [eax]
8285e033 f6c201          test    dl,1
8285e036 7529            jne     nt!RtlValidateUnicodeString+0x4c (8285e061)

nt!RtlValidateUnicodeString+0x23:
8285e038 0fb74802        movzx   ecx,word ptr [eax+2]
8285e03c f6c101          test    cl,1
8285e03f 7520            jne     nt!RtlValidateUnicodeString+0x4c (8285e061)

nt!RtlValidateUnicodeString+0x2c:
8285e041 663bd1          cmp     dx,cx
8285e044 771b            ja      nt!RtlValidateUnicodeString+0x4c (8285e061)

nt!RtlValidateUnicodeString+0x31:
8285e046 57              push    edi
8285e047 bffeff0000      mov     edi,0FFFEh
8285e04c 663bcf          cmp     cx,di
8285e04f 5f              pop     edi
8285e050 770f            ja      nt!RtlValidateUnicodeString+0x4c (8285e061)

nt!RtlValidateUnicodeString+0x3d:
8285e052 397004          cmp     dword ptr [eax+4],esi
8285e055 750f            jne     nt!RtlValidateUnicodeString+0x51 (8285e066)

nt!RtlValidateUnicodeString+0x42:
8285e057 663bd6          cmp     dx,si
8285e05a 7505            jne     nt!RtlValidateUnicodeString+0x4c (8285e061)

nt!RtlValidateUnicodeString+0x47:
8285e05c 663bce          cmp     cx,si
8285e05f 7405            je      nt!RtlValidateUnicodeString+0x51 (8285e066)

nt!RtlValidateUnicodeString+0x4c:
8285e061 be0d0000c0      mov     esi,0C000000Dh

nt!RtlValidateUnicodeString+0x51:
8285e066 8bc6            mov     eax,esi

nt!RtlValidateUnicodeString+0x53:
8285e068 5e              pop     esi
8285e069 5d              pop     ebp
8285e06a c20800          ret     8