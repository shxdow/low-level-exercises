_memcpy proc
    push ebp
    push esi
    push edi
    mov ebp, esp
    mov ecx, [ebp+10h]
    mov eax, [ebp+Ch]
    mov edi, [ebp+8h]
    rep stosb
    pop edi
    pop esi
    pop ebp
_memcpy endp