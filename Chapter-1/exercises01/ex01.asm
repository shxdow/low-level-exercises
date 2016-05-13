1. This function uses a combination SCAS and STOS to do its work. First, explain what is the type of the [EBP+8] and [EBP+C] in line 1 and 8, respectively. Next, explain what this snippet does.

01: 8B 7D 08         mov   edi, [ebp+8]     ;   edi = first argument
02: 8B D7            mov   edx, edi         ;
03: 33 C0            xor   eax, eax         ;   sets eax to 0
04: 83 C9 FF         or    ecx, 0FFFFFFFFh  ;   sets ecx to -1
05: F2 AE            repne scasb            ;   repeats if ZF = 0, max ecx times. Compares a byte from eax with the one pointed by edi
06: 83 C1 02         add   ecx, 2           ;   
07: F7 D9            neg   ecx              ;   ecx is a negative number
08: 8A 45 0C         mov   al, [ebp+0Ch]    ;   al = second argument
09: 8B FA            mov   edi, edx         ;   edi = first argument
10: F3 AA            rep stosb              ;   memset(edi, al)
11: 8B C2            mov   eax, edx         ;   returns a pointer to the string