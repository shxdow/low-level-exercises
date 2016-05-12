
_memset :
		push edi 	  			; STOSB changes the value of edi,therefore we have to save it
		mov edi, [esp+16]	; length
		mov ecx, [esp+12] ; byte
		mov eax, [esp+8]	; pointer
		rep stosb					; 
		pop edi 					; restore the string pointer
ret
