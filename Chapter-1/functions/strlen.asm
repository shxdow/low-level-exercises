_strlen proc
    push ebp
    mov ebp, esp
    mov edi, [ebp+8]   ; pointer to the string
    mov al, 0
    mov ecx, FFFFFFFFh
    repne scasb
    neg ecx
    add ecx,1
    mov eax, ecx
    mov esp, ebp
    pop ebp
    ret
_strlen endp
