_strcmp proc
    push ebp
    push edi
    push esi
    mov ebp, esp
    mov edi, DWORD PTR [ebp+Ch]
    mov esi, DWORD PTR [ebp+8]
    mov ecx, -1
    repz cmpsb
    jz equal
    jns pos
    xor eax, eax
    mov eax, -1
    jmp cmp_end
pos:
    xor eax, eax
    mov eax, 1
    jmp cmp_end
equal:
    xor eax, eax
cmp_end:
    mov esp, ebp
    pop esi
    pop edi
    pop ebp
    ret
_strcmp endp