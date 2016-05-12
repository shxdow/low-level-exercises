; Version 1.0  ------------------------------------------------------------
;
;	The function doesn't initialize registers.
;	It sets up a stack frame for no reasons.
;	It stores untouched registers.
;	It does not take into account the return value.
;	Stack offsets were all off by 4 bytes, I forgot that 'call' pushes EIP.

; Version 2.0  ------------------------------------------------------------
;
;
;
;
;
; ############################################################ MEMSET ############################################################

dest db "almost every programmer should know memset$"

	; ##### MAIN #####

	mov eax,0 ; input :: constant byte
	mov edx,6 ; input :: length
	
	mov edi,dest ; assigns a pointer to the first character of the string
	push eax  ; constant byte
	push edx  ;	length
	call _memset

ret

_memset :
	push edi ; STOSB changes the value of edi,therefore we have to save it
	
	mov edi, [esp+16] ; string pointer 32 bit that points to the data segment, the string is not saved in the stack
	mov ecx, [esp+8]  ; length
	mov eax, [ebp+12] ; constant byte
	rep stosb

	pop edi ; restore the string pointer
ret