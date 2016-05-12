_strcmp proc
    push ebp
    mov ebp, esp
    mov edi, [ebp+8]   ; pointer to the string
    mov al, 0
    mov ecx, FFFFFFFFh
    repne scasb
    neg ecx
    add ecx,1
    mov esp, ebp
    pop ebp
	ret
_strcmp endp