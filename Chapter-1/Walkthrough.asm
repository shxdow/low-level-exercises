01:    ; BOOL __stdcall DllMain(HINSTANCE hinstDLL, DWORD fdwReason,LPVOID lpvReserved)
02:                _DllMain@12 proc near
03: 55               push    ebp		                  ; function prologue
04: 8B EC            mov     ebp, esp	                  ; function prologue
05: 81 EC 30 01 00+  sub     esp, 130h	                  ; makes room for local variables
06: 57               push    edi			              ; EDI is stored,therefore line 18 may modify it
07: 0F 01 4D F8      sidt    fword ptr [ebp-8]            ; gets the content of the IDTRegister
08: 8B 45 FA         mov     eax, [ebp-6]	              ; reads the limit (first 2 bytes)
09: 3D 00 F4 03 80   cmp     eax, 8003F400h	   			  
10: 76 10            jbe     short loc_10001C88 (line 18)
11: 3D 00 74 04 80   cmp     eax, 80047400h
12: 73 09            jnb     short loc_10001C88 (line 18) ;  if ( value < 8003F400h || 80047400h > value ) jmp line 18
13: 33 C0            xor     eax, eax					  ;  set EAX to 0
14: 5F               pop     edi						  
15: 8B E5            mov     esp, ebp					  ;  function epilogue
16: 5D               pop     ebp						  ;  function epilogue
17: C2 0C 00         retn    0Ch						  ;  
18:                loc_10001C88:						  ; 
19: 33 C0            xor     eax, eax                     ;  set EAX to 0, so we can later use it as an argument
20: B9 49 00 00 00   mov     ecx, 49h					  ;  49h = 73d
21: 8D BD D4 FE FF+  lea     edi, [ebp-12Ch]			  ;  130h - 12Ch = 4h which is exactly 4 bytes
22: C7 85 D0 FE FF+  mov     dword ptr [ebp-130h], 0	  ;  the dwSize member must be initialized in order to use the function. It beign the first field and this being a little - endian machine we can tell that the allocated space will be used for a PROCESSENTRY32 variable
23: 50               push    eax						  ;  _In_ DWORD th32ProcessID :: "The process identifier of the process to be included in the snapshot. This parameter can be zero to indicate the current process." :: In this case the latter case is in play.
24: 6A 02            push    2						      ;  _In_ DWORD dwFlags :: "TH32CS_SNAPPROCESS 0x00000002 Includes all processes in the system in the snapshot."
25: F3 AB            rep stosd							  ;  we set those 4 bytes to 0,starting from address 12Ch
26: E8 2D 2F 00 00   call    CreateToolhelp32Snapshot	  ;  Takes a snapshot of the specified processes, as well as the heaps, modules, and threads used by these processes.
27: 8B F8            mov     edi, eax					  ;  the return value of CreateToolhelp32Snapshot is stored in EAX,which is then assigned to EDI
28: 83 FF FF         cmp     edi, 0FFFFFFFFh			  ;  if ( edi == -1 )
29: 75 09            jnz     short loc_10001CB9 (line 35) ;  jump line 35
30: 33 C0            xor     eax, eax					  ;	 
31: 5F               pop     edi						  ;  restores the previous EDI value
32: 8B E5            mov     esp, ebp					  ;  function epilogue
33: 5D               pop     ebp						  ;  function epilogue
34: C2 0C 00         retn    0Ch
35:                loc_10001CB9:
36: 8D 85 D0 FE FF+  lea     eax, [ebp-130h]			  ;  
37: 56               push    esi						  ;  ESI will be later used for the _stricmp function
38: 50               push    eax						  ;  _Inout_ LPPROCESSENTRY32 lppe :: "A pointer to a PROCESSENTRY32 structure."
39: 57               push    edi						  ;  _In_ HANDLE hSnapshot :: "A handle to the snapshot returned from a previous call to the CreateToolhelp32Snapshot function."
40: C7 85 D0 FE FF+  mov     dword ptr [ebp-130h], 128h   ;  dwSize = 128h,therefore,the first 8 bytes are used for local variables
41: E8 FF 2E 00 00   call    Process32First				  ;	 BOOL WINAPI Process32First (_In_ HANDLE hSnapshot, _Inout_ LPPROCESSENTRY32 lppe) If successful returns a nonzero value. If an error occured the function returns zero.
42: 85 C0            test    eax, eax					  ;  if ( an error occured )
43: 74 4F            jz      short loc_10001D24 (line 70) ;	 jump line 70
44: 8B 35 C0 50 00+  mov     esi, ds:_stricmp			  ;  
45: 8D 8D F4 FE FF+  lea     ecx, [ebp-10Ch]			  ;  TCHAR szExeFile[MAX_PATH]
46: 68 50 7C 00 10   push    10007C50h					  ;  address of the second argument
47: 51               push    ecx                          ;	 first argument
48: FF D6            call    esi 						  ;  call _stricmp
49: 83 C4 08         add     esp, 8						  ;	 
50: 85 C0            test    eax, eax					  ;  if _stricmp returns 0
51: 74 26            jz      short loc_10001D16 (line 66) ;
52:                loc_10001CF0:
53: 8D 95 D0 FE FF+  lea     edx, [ebp-130h]			  ;
54: 52               push    edx						  ;  _Out_ LPPROCESSENTRY32 lppe
55: 57               push    edi						  ;  _In_  HANDLE hSnapshot
56: E8 CD 2E 00 00   call    Process32Next				  ;  BOOL WINAPI Process32Next(_In_  HANDLE hSnapshot, _Out_ LPPROCESSENTRY32 lppe) :: Retrieves information about the next process recorded in a system snapshot.
57: 85 C0            test    eax, eax					  ;  Returns TRUE if the next entry of the process list has been copied to the buffer or FALSE otherwise. 0 must be false
58: 74 23            jz      short loc_10001D24 (line 70) ;  if ( return == 0 ) jump 0 = false
59: 8D 85 F4 FE FF+  lea     eax, [ebp-10Ch]			  ;	 TCHAR szExeFile[MAX_PATH]
60: 68 50 7C 00 10   push    10007C50h					  ;  second argument
61: 50               push    eax						  ;	 first argument
62: FF D6            call    esi 					      ;  _stricmp
63: 83 C4 08         add     esp, 8						  ;  
64: 85 C0            test    eax, eax					  ;  
65: 75 DA            jnz     short loc_10001CF0 (line 52) ;  while ( _stricmp != 0 ) | this loop can be left when there are no entries in the process list, or 2 strings are equal
66:                loc_10001D16:
67: 8B 85 E8 FE FF+  mov     eax, [ebp-118h]			  ;  DWORD th32ParentProcessID
68: 8B 8D D8 FE FF+  mov     ecx, [ebp-128h]			  ;  DWORD th32ProcessID
69: EB 06            jmp     short loc_10001D2A (line 73)
70:                loc_10001D24:
71: 8B 45 0C         mov     eax, [ebp+0Ch]				  ;	 fdwReason
72: 8B 4D 0C         mov     ecx, [ebp+0Ch]				  ;  fdwReason
73:                loc_10001D2A:
74: 3B C1            cmp     eax, ecx					  ; 
75: 5E               pop     esi						  ;  restores esi
76: 75 09            jnz     short loc_10001D38 (line 82) ;  if ( fdwReason != 0 )
77: 33 C0            xor     eax, eax					  ;	 return 0
78: 5F               pop     edi
79: 8B E5            mov     esp, ebp					  ;  function epilogue
80: 5D               pop     ebp					  	  ;  function epilogue
81: C2 0C 00         retn    0Ch
82:                loc_10001D38:
83: 8B 45 0C         mov     eax, [ebp+0Ch]				  ;  fdwReason
84: 48               dec     eax						  ;  if ( fdwReason > 1 ) jump line 93
85: 75 15            jnz     short loc_10001D53 (line 93) ;  
86: 6A 00            push    0							  ;  lpThreadId [out, optional] A pointer to a variable that receives the thread identifier. If this parameter is NULL, the thread identifier is not returned.
87: 6A 00            push    0							  ;	 dwCreationFlags [in] The flags that control the creation of the thread. 0 = the thread runs immediately after creation.
88: 6A 00            push    0							  ;  lpParameter [in, optional] A pointer to a variable to be passed to the thread.
89: 68 D0 32 00 10   push    100032D0h					  ;  lpStartAddress [in] A pointer to the application-defined function to be executed by the thread. This pointer represents the starting address of the thread.
90: 6A 00            push    0							  ;  dwStackSize [in] The initial size of the stack, in bytes. The system rounds this value to the nearest page. If this parameter is zero, the new thread uses the default size for the executable. For more information, see Thread Stack Size.
91: 6A 00            push    0							  ;  lpThreadAttributes [in, optional] A pointer to a SECURITY_ATTRIBUTES structure that determines whether the returned handle can be inherited by child processes. If lpThreadAttributes is NULL, the handle cannot be inherited.
92: FF 15 20 50 00+  call    ds:CreateThread 			  ;  HANDLE WINAPI CreateThread(_In_opt_ LPSECURITY_ATTRIBUTES  lpThreadAttributes,_In_ SIZE_T dwStackSize,_In_ LPTHREAD_START_ROUTINE lpStartAddress,_In_opt_  LPVOID lpParameter,_In_ DWORD dwCreationFlags, _Out_opt_ LPDWORD lpThreadId)
93:                loc_10001D53:
94: B8 01 00 00 00   mov     eax, 1						  ;  return 1
95: 5F               pop     edi						  ;  restores edi
96: 8B E5            mov     esp, ebp					  ;  function epilogue
97: 5D               pop     ebp						  ;  function epilogue
98: C2 0C 00         retn    0Ch						  ;  ret
99:                _DllMain@12 endp


typedef struct tagPROCESSENTRY32 {
  DWORD     dwSize; 				ebp - 130h
  DWORD     cntUsage;				ebp - 12Ch
  DWORD     th32ProcessID;			ebp - 128h
  ULONG_PTR th32DefaultHeapID;  	ebp - 124h
  DWORD     th32ModuleID; 			ebp - 120h
  DWORD     cntThreads; 			ebp - 11Ch
  DWORD     th32ParentProcessID; 	ebp - 118h
  LONG      pcPriClassBase; 		ebp - 114h
  DWORD     dwFlags; 				ebp - 110h
  TCHAR     szExeFile[MAX_PATH]; 	ebp - 10Ch
} PROCESSENTRY32, *PPROCESSENTRY32
