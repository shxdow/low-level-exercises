kd> uf KeInsertQueueDpc
nt!KeInsertQueueDpc:
804f9f80 8bff            mov     edi,edi
804f9f82 55              push    ebp
804f9f83 8bec            mov     ebp,esp
804f9f85 51              push    ecx
804f9f86 51              push    ecx
804f9f87 56              push    esi
804f9f88 57              push    edi
804f9f89 b11f            mov     cl,1Fh
804f9f8b ff15f4764d80    call    dword ptr [nt!_imp_KfRaiseIrql (804d76f4)]
804f9f91 8845ff          mov     byte ptr [ebp-1],al
804f9f94 3ea120f0dfff    mov     eax,dword ptr ds:[FFDFF020h]
804f9f9a 8b7d08          mov     edi,dword ptr [ebp+8]
804f9f9d 8bf0            mov     esi,eax
804f9f9f 8d86a0080000    lea     eax,[esi+8A0h]
804f9fa5 8945f8          mov     dword ptr [ebp-8],eax
804f9fa8 8d471c          lea     eax,[edi+1Ch]
804f9fab 894508          mov     dword ptr [ebp+8],eax
804f9fae b800000000      mov     eax,0
804f9fb3 8b4d08          mov     ecx,dword ptr [ebp+8]
804f9fb6 8b55f8          mov     edx,dword ptr [ebp-8]
804f9fb9 0fb111          cmpxchg dword ptr [ecx],edx
804f9fbc 85c0            test    eax,eax
804f9fbe 894508          mov     dword ptr [ebp+8],eax
804f9fc1 0f8589000000    jne     nt!KeInsertQueueDpc+0xd0 (804fa050)

nt!KeInsertQueueDpc+0x47:
804f9fc7 ff866c080000    inc     dword ptr [esi+86Ch]
804f9fcd 83867008000001  add     dword ptr [esi+870h],1
804f9fd4 807f0302        cmp     byte ptr [edi+3],2
804f9fd8 8b450c          mov     eax,dword ptr [ebp+0Ch]
804f9fdb 894714          mov     dword ptr [edi+14h],eax
804f9fde 8b4510          mov     eax,dword ptr [ebp+10h]
804f9fe1 894718          mov     dword ptr [edi+18h],eax
804f9fe4 8d8e60080000    lea     ecx,[esi+860h]
804f9fea 8d4704          lea     eax,[edi+4]
804f9fed 750e            jne     nt!KeInsertQueueDpc+0x7d (804f9ffd)

nt!KeInsertQueueDpc+0x6f:
804f9fef 8b11            mov     edx,dword ptr [ecx]
804f9ff1 8910            mov     dword ptr [eax],edx
804f9ff3 894804          mov     dword ptr [eax+4],ecx
804f9ff6 894204          mov     dword ptr [edx+4],eax
804f9ff9 8901            mov     dword ptr [ecx],eax
804f9ffb eb0d            jmp     nt!KeInsertQueueDpc+0x8a (804fa00a)

nt!KeInsertQueueDpc+0x7d:
804f9ffd 8b5104          mov     edx,dword ptr [ecx+4]
804fa000 8908            mov     dword ptr [eax],ecx
804fa002 895004          mov     dword ptr [eax+4],edx
804fa005 8902            mov     dword ptr [edx],eax
804fa007 894104          mov     dword ptr [ecx+4],eax

nt!KeInsertQueueDpc+0x8a:
804fa00a 83be7408000000  cmp     dword ptr [esi+874h],0
804fa011 753d            jne     nt!KeInsertQueueDpc+0xd0 (804fa050)

nt!KeInsertQueueDpc+0x93:
804fa013 83be7808000000  cmp     dword ptr [esi+878h],0
804fa01a 7534            jne     nt!KeInsertQueueDpc+0xd0 (804fa050)

nt!KeInsertQueueDpc+0x9c:
804fa01c 807f0300        cmp     byte ptr [edi+3],0
804fa020 751c            jne     nt!KeInsertQueueDpc+0xbe (804fa03e)

nt!KeInsertQueueDpc+0xa2:
804fa022 8b8670080000    mov     eax,dword ptr [esi+870h]
804fa028 3b8684080000    cmp     eax,dword ptr [esi+884h]
804fa02e 730e            jae     nt!KeInsertQueueDpc+0xbe (804fa03e)

nt!KeInsertQueueDpc+0xb0:
804fa030 8b8680080000    mov     eax,dword ptr [esi+880h]
804fa036 3b8688080000    cmp     eax,dword ptr [esi+888h]
804fa03c 7312            jae     nt!KeInsertQueueDpc+0xd0 (804fa050)

nt!KeInsertQueueDpc+0xbe:
804fa03e b102            mov     cl,2
804fa040 c7867808000001000000 mov dword ptr [esi+878h],1
804fa04a ff1500774d80    call    dword ptr [nt!_imp_HalRequestSoftwareInterrupt (804d7700)]

nt!KeInsertQueueDpc+0xd0:
804fa050 8a4dff          mov     cl,byte ptr [ebp-1]
804fa053 ff151c774d80    call    dword ptr [nt!_imp_KfLowerIrql (804d771c)]
804fa059 33c0            xor     eax,eax
804fa05b 394508          cmp     dword ptr [ebp+8],eax
804fa05e 5f              pop     edi
804fa05f 0f94c0          sete    al
804fa062 5e              pop     esi
804fa063 c9              leave
804fa064 c20c00          ret     0Ch
