_memset :
    push ebp
    push edi            ; STOSB changes the value of edi,therefore we have to save it
    mov edi, [ebp+8]   	; set edi to the string pointer
    mov ecx, [ebp+0xC]  ; set ecx to the counter
    mov eax, [ebp+0x10] ; set eax to the byte we want to write
    rep stosb
    mov ebp, esp
    pop edi
    pop ebp             ; restore the string pointer
ret
