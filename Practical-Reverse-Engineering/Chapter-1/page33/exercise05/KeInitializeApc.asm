lkd> uf KeInitializeApc
nt!KeInitializeApc:
82909850 8bff            mov     edi,edi
82909852 55              push    ebp
82909853 8bec            mov     ebp,esp
82909855 8b4508          mov     eax,dword ptr [ebp+8]
82909858 8b5510          mov     edx,dword ptr [ebp+10h]
8290985b 8b4d0c          mov     ecx,dword ptr [ebp+0Ch]
8290985e c60012          mov     byte ptr [eax],12h
82909861 c6400230        mov     byte ptr [eax+2],30h
82909865 83fa02          cmp     edx,2
82909868 7506            jne     nt!KeInitializeApc+0x20 (82909870)

nt!KeInitializeApc+0x1a:
8290986a 8a9134010000    mov     dl,byte ptr [ecx+134h]

nt!KeInitializeApc+0x20:
82909870 894808          mov     dword ptr [eax+8],ecx
82909873 8b4d14          mov     ecx,dword ptr [ebp+14h]
82909876 894814          mov     dword ptr [eax+14h],ecx
82909879 8b4d18          mov     ecx,dword ptr [ebp+18h]
8290987c 88502c          mov     byte ptr [eax+2Ch],dl
8290987f 894818          mov     dword ptr [eax+18h],ecx
82909882 8b4d1c          mov     ecx,dword ptr [ebp+1Ch]
82909885 33d2            xor     edx,edx
82909887 89481c          mov     dword ptr [eax+1Ch],ecx
8290988a 3bca            cmp     ecx,edx
8290988c 740e            je      nt!KeInitializeApc+0x4c (8290989c)

nt!KeInitializeApc+0x3e:
8290988e 8a4d20          mov     cl,byte ptr [ebp+20h]
82909891 88482d          mov     byte ptr [eax+2Dh],cl
82909894 8b4d24          mov     ecx,dword ptr [ebp+24h]
82909897 894820          mov     dword ptr [eax+20h],ecx
8290989a eb06            jmp     nt!KeInitializeApc+0x52 (829098a2)

nt!KeInitializeApc+0x4c:
8290989c 88502d          mov     byte ptr [eax+2Dh],dl
8290989f 895020          mov     dword ptr [eax+20h],edx

nt!KeInitializeApc+0x52:
829098a2 88502e          mov     byte ptr [eax+2Eh],dl
829098a5 5d              pop     ebp
829098a6 c22000          ret     20h