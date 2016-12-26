sub_13842 proc near
mov     eax, [ecx+60h]
push    esi
mov     esi, [edx+8]
dec     byte ptr [ecx+23h]
sub     eax, 24h
mov     [ecx+60h], eax
mov     [eax+14h], edx
movzx   eax, byte ptr [eax]
push    ecx
push    edx
call    dword ptr [esi+eax*4+38h]
pop     esi
retn
sub_13842 endp
