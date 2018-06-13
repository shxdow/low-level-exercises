01: KiSystemCall64 proc near
02:
03: var_110= byte ptr -110h
04:
05:   swapgs				 ; | sets GS to kernel data structures
06:   mov     gs:10h, rsp    ; KPCR->UserRsp | saves the user SP
07:   mov     rsp, gs:1A8h   ; KPCR->KPRCB->RspBase | loads kernel SP
08:                          ; setup a new kernel stack frame
09:   push    2Bh
10:   push    qword ptr gs:10h ; KPCR->UserRsp
11:   push    r11
12:
13:   sti                      ; enable interrupts
14:   mov     [rbx+88h], rcx   ; KTHREAD->FirstArgument
15:   mov     [rbx+80h], eax   ; KTHREAD->SystemCallNumber
16: KiSystemServiceStart proc near
17:   mov     [rbx+90h], rsp   ; KTHREAD->TrapFrame
18:   mov     edi, eax         ; eax = syscall #
19:   shr     edi, 7           ; determine which syscall table
20:   and     edi, 20h
21:   and     eax, 0FFFh     ; index into table (recall 64bit syscall encoding)
22: KiSystemServiceRepeat proc near
23:   lea     r10, KeServiceDescriptorTable
24:   lea     r11, KeServiceDescriptorTableShadow
25:   test    dword ptr [rbx+78h], 40h ; determines if it is a GUI thread
26:   cmovnz  r10, r11         ; which table to use?
27:   cmp     eax, [rdi+r10+10h] ; is that syscall table within the table Limit?
28:                              ; i.e., KSERVICE_TABLE_DESCRIPTOR.Limit
29:   jnb     case_invalidcallnumber
30:   mov     r10, [rdi+r10]     ; select the right table
31:   movsxd  r11, dword ptr [r10+rax*4] ; get the syscall offset
32:   mov     rax, r11
33:   sar     r11, 4
34:   add     r10, r11   ; add it to the base of the table to get syscall VA
35:   cmp     edi, 20h   ; edi determines which table. here it is used to
                         ; determined if it is a GUI
36:   jnz     short case_nonguirequest
37:   mov     r11, [rbx+0F0h]
38:
39: KiSystemServiceCopyEnd proc near
40:   test    cs:dword_140356088, 40h
41:   jnz     case_loggingenabled
42:   call    r10        ; invoke the system call
