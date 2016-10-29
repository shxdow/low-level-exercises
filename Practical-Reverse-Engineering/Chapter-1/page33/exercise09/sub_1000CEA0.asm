.text:1000CEA0 sub_1000CEA0    proc near               ; CODE XREF: sub_10007A4B+1D7p
.text:1000CEA0                                         ; sub_1000AD4D+3Ap ...
.text:1000CEA0
.text:1000CEA0 arg_0           = dword ptr  8
.text:1000CEA0 arg_4           = byte ptr  0Ch
.text:1000CEA0
.text:1000CEA0                 push    ebp
.text:1000CEA1                 mov     ebp, esp
.text:1000CEA3                 push    edi
.text:1000CEA4                 mov     edi, [ebp+arg_0]
.text:1000CEA7                 xor     eax, eax
.text:1000CEA9                 or      ecx, 0FFFFFFFFh
.text:1000CEAC                 repne scasb
.text:1000CEAE                 add     ecx, 1
.text:1000CEB1                 neg     ecx
.text:1000CEB3                 sub     edi, 1
.text:1000CEB6                 mov     al, [ebp+arg_4]
.text:1000CEB9                 std
.text:1000CEBA                 repne scasb
.text:1000CEBC                 add     edi, 1
.text:1000CEBF                 cmp     [edi], al
.text:1000CEC1                 jz      short loc_1000CEC7
.text:1000CEC3                 xor     eax, eax
.text:1000CEC5                 jmp     short loc_1000CEC9
.text:1000CEC7 ; ---------------------------------------------------------------------------
.text:1000CEC7
.text:1000CEC7 loc_1000CEC7:                           ; CODE XREF: sub_1000CEA0+21j
.text:1000CEC7                 mov     eax, edi
.text:1000CEC9
.text:1000CEC9 loc_1000CEC9:                           ; CODE XREF: sub_1000CEA0+25j
.text:1000CEC9                 cld
.text:1000CECA                 pop     edi
.text:1000CECB                 leave
.text:1000CECC                 retn
.text:1000CECC sub_1000CEA0    endp
