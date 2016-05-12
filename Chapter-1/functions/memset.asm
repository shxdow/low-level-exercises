dest db "almost every programmer should know memset$"

	; ##### MAIN #####

	mov eax,0 ; input :: constant byte
	mov edx,6 ; input :: length
	
	mov edi,dest ; assigns a pointer to the first character of the string
	push edx  ;     constant byte
	push eax  ;	length
	call _memset

ret

_memset :
	push edi 	  ; STOSB changes the value of edi,therefore we have to save it
	
	mov edi, [esp+8] ; string pointer 32 bit that points to the data segment, the string is not saved in the stack
	mov ecx, [esp+16]  ; length
	mov eax, [esp+12] ; constant byte
	rep stosb

	pop edi ; restore the string pointer
ret
