_strset proc
    push ebp
    push edi            ; STOSB changes the value of edi,therefore we have to save it
    mov edi, [ebp+Dh]   ; length
    mov ecx, [ebp+Ch]   ; char
    mov eax, [ebp+8]    ; pointer
    rep stosb
    mov ebp, esp
    pop ebp
    pop edi             ; restore the string pointer
_strset endp