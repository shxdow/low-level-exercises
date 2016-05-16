_memset :
    push ebp
    push edi            ; STOSB changes the value of edi,therefore we have to save it
    mov edi, [ebp+16]   ; length
    mov ecx, [ebp+12]   ; byte
    mov eax, [ebp+8]    ; pointer
    rep stosb
    mov ebp, esp
    pop ebp
    pop edi             ; restore the string pointer
ret
