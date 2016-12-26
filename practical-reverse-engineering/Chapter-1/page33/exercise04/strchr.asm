_strchr proc
    ;__stdcall
    push ebp
    push edi
    mov ebp, esp
    mov edi, DWORD PTR [ebp+8]
    mov edx, ds:_strlen
    call edx
    mov ecx, eax
    mov eax, [ebp+0Ch]
while:
    scasb
    jz found
    dec ecx
    jcxz proc_end
    jz while
    xor eax, eax
    jmp proc_end
found:
    mov eax,DWORD PTR [edi]
proc_end:
    mov esp, ebp
    pop edi
    pop ebp
    ret
_strchr endp