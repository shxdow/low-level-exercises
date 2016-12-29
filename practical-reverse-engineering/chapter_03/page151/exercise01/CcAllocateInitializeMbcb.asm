1   0: kd> uf CcAllocateInitializeMbcb
2   nt!CcAllocateInitializeMbcb:
3   fffff800`11d632bc fff3            push    rbx
4   fffff800`11d632be 4883ec20        sub     rsp,20h
5   fffff800`11d632c2 bac0000000      mov     edx,0C0h
6   fffff800`11d632c7 b900020000      mov     ecx,200h
7   fffff800`11d632cc 41b843634d62    mov     r8d,624D6343h
8   fffff800`11d632d2 e8394d1800      call    nt!ExAllocatePoolWithTag (fffff800`11ee8010)
9   fffff800`11d632d7 488bd8          mov     rbx,rax
10  fffff800`11d632da 4885c0          test    rax,rax
11  fffff800`11d632dd 7456            je      nt!CcAllocateInitializeMbcb+0x79 (fffff800`11d63335)
12  
13  nt!CcAllocateInitializeMbcb+0x23:
14  fffff800`11d632df 33d2            xor     edx,edx
15  fffff800`11d632e1 41b8c0000000    mov     r8d,0C0h
16  fffff800`11d632e7 488bc8          mov     rcx,rax
17  fffff800`11d632ea e8d147f9ff      call    nt!memset (fffff800`11cf7ac0)
18  fffff800`11d632ef 488d4310        lea     rax,[rbx+10h]
19  fffff800`11d632f3 488d4b30        lea     rcx,[rbx+30h]
20  fffff800`11d632f7 41bbfb020000    mov     r11d,2FBh
21  fffff800`11d632fd 6644891b        mov     word ptr [rbx],r11w
22  fffff800`11d63301 48894008        mov     qword ptr [rax+8],rax ; // line 18 22 23 InitializeListHead(PLIST_ENTRY)
23  fffff800`11d63305 488900          mov     qword ptr [rax],rax
24  fffff800`11d63308 488901          mov     qword ptr [rcx],rax
25  fffff800`11d6330b 48894108        mov     qword ptr [rcx+8],rax
26  fffff800`11d6330f 483900          cmp     qword ptr [rax],rax
27  fffff800`11d63312 7523            jne     nt!CcAllocateInitializeMbcb+0x7b (fffff800`11d63337)
28  
29  nt!CcAllocateInitializeMbcb+0x58:
30  fffff800`11d63314 488908          mov     qword ptr [rax],rcx
31  fffff800`11d63317 48894808        mov     qword ptr [rax+8],rcx
32  fffff800`11d6331b 834b48ff        or      dword ptr [rbx+48h],0FFFFFFFFh
33  fffff800`11d6331f 48834b28ff      or      qword ptr [rbx+28h],0FFFFFFFFFFFFFFFFh
34  fffff800`11d63324 488d4360        lea     rax,[rbx+60h]
35  fffff800`11d63328 48894358        mov     qword ptr [rbx+58h],rax
36  fffff800`11d6332c 488bc3          mov     rax,rbx
37  
38  nt!CcAllocateInitializeMbcb+0x73:
39  fffff800`11d6332f 4883c420        add     rsp,20h
40  fffff800`11d63333 5b              pop     rbx
41  fffff800`11d63334 c3              ret
42  
43  nt!CcAllocateInitializeMbcb+0x79:
44  fffff800`11d63335 ebf8            jmp     nt!CcAllocateInitializeMbcb+0x73 (fffff800`11d6332f)
45  
46  nt!CcAllocateInitializeMbcb+0x7b:
47  fffff800`11d63337 b903000000      mov     ecx,3
48  fffff800`11d6333c cd29            int     29h
49  fffff800`11d6333e 90              nop
50  fffff800`11d6333f 90              nop
51  fffff800`11d63340 90              nop
52  fffff800`11d63341 90              nop
53  fffff800`11d63342 90              nop
54  fffff800`11d63343 90              nop
55  fffff800`11d63344 fff3            push    rbx
56  fffff800`11d63346 55              push    rbp
57  fffff800`11d63347 56              push    rsi
58  fffff800`11d63348 57              push    rdi
59  fffff800`11d63349 4154            push    r12
60  fffff800`11d6334b 4155            push    r13
61  fffff800`11d6334d 4156            push    r14
62  fffff800`11d6334f 4157            push    r15
63  fffff800`11d63351 4883ec38        sub     rsp,38h
64  fffff800`11d63355 488ba998000000  mov     rbp,qword ptr [rcx+98h]
65  fffff800`11d6335c 4533db          xor     r11d,r11d
66  fffff800`11d6335f 488bf9          mov     rdi,rcx
67  fffff800`11d63362 4c8b6560        mov     r12,qword ptr [rbp+60h]
68  fffff800`11d63366 418bdb          mov     ebx,r11d
69  fffff800`11d63369 4c89a42498000000 mov     qword ptr [rsp+98h],r12
70  fffff800`11d63371 899c2480000000  mov     dword ptr [rsp+80h],ebx
71  fffff800`11d63378 44395958        cmp     dword ptr [rcx+58h],r11d
72  fffff800`11d6337c 0f8c66010000    jl      nt!MiValidateInPage+0x1a4 (fffff800`11d634e8)
73  
74  nt!MiValidateInPage+0x3e:
75  fffff800`11d63382 488b81c0000000  mov     rax,qword ptr [rcx+0C0h]
76  fffff800`11d63389 448b8984000000  mov     r9d,dword ptr [rcx+84h]
77  fffff800`11d63390 4c8da9c8000000  lea     r13,[rcx+0C8h]
78  fffff800`11d63397 4885c0          test    rax,rax
79  fffff800`11d6339a 41baff0f0000    mov     r10d,0FFFh
80  fffff800`11d633a0 458bf3          mov     r14d,r11d
81  fffff800`11d633a3 4c0f45e8        cmovne  r13,rax
82  fffff800`11d633a7 418b5528        mov     edx,dword ptr [r13+28h]
83  fffff800`11d633ab 458b452c        mov     r8d,dword ptr [r13+2Ch]
84  fffff800`11d633af 418b4d20        mov     ecx,dword ptr [r13+20h]
85  fffff800`11d633b3 4103c8          add     ecx,r8d
86  fffff800`11d633b6 8bf2            mov     esi,edx
87  fffff800`11d633b8 8bc2            mov     eax,edx
88  fffff800`11d633ba c1e80c          shr     eax,0Ch
89  fffff800`11d633bd 4123f2          and     esi,r10d
90  fffff800`11d633c0 4123ca          and     ecx,r10d
91  fffff800`11d633c3 4103f2          add     esi,r10d
92  fffff800`11d633c6 4d8d7d30        lea     r15,[r13+30h]
93  fffff800`11d633ca 03f1            add     esi,ecx
94  fffff800`11d633cc c1ee0c          shr     esi,0Ch
95  fffff800`11d633cf 03f0            add     esi,eax
96  fffff800`11d633d1 498d04f7        lea     rax,[r15+rsi*8]
97  fffff800`11d633d5 4889842488000000 mov     qword ptr [rsp+88h],rax
98  fffff800`11d633dd 418bc1          mov     eax,r9d
99  fffff800`11d633e0 2bc2            sub     eax,edx
100 fffff800`11d633e2 412bc0          sub     eax,r8d
101 fffff800`11d633e5 48014768        add     qword ptr [rdi+68h],rax
102 fffff800`11d633e9 452b4d28        sub     r9d,dword ptr [r13+28h]
103 fffff800`11d633ed 418bc3          mov     eax,r11d
104 fffff800`11d633f0 452b4d2c        sub     r9d,dword ptr [r13+2Ch]
105 fffff800`11d633f4 4585ca          test    r10d,r9d
106 fffff800`11d633f7 0f95c0          setne   al
107 fffff800`11d633fa 41c1e90c        shr     r9d,0Ch
108 fffff800`11d633fe 4403c8          add     r9d,eax
109 fffff800`11d63401 44018f88000000  add     dword ptr [rdi+88h],r9d
110 fffff800`11d63408 498b1c24        mov     rbx,qword ptr [r12]
111 fffff800`11d6340c 488bc3          mov     rax,rbx
112 fffff800`11d6340f 4883e0f8        and     rax,0FFFFFFFFFFFFFFF8h
113 fffff800`11d63413 4883f808        cmp     rax,8
114 fffff800`11d63417 0f8761010000    ja      nt!MiValidateInPage+0x23a (fffff800`11d6357e)
115 
116 nt!MiValidateInPage+0xd9:
117 fffff800`11d6341d 4c3bbc2488000000 cmp     r15,qword ptr [rsp+88h]
118 fffff800`11d63425 0f83b6000000    jae     nt!MiValidateInPage+0x19d (fffff800`11d634e1)
119 
120 nt!MiValidateInPage+0xe7:
121 fffff800`11d6342b 498bf7          mov     rsi,r15
122 fffff800`11d6342e 492bf5          sub     rsi,r13
123 fffff800`11d63431 4883ee30        sub     rsi,30h
124 
125 nt!MiValidateInPage+0xf1:
126 fffff800`11d63435 4d8b0f          mov     r9,qword ptr [r15]
127 fffff800`11d63438 48b80000000080050000 mov rax,58000000000h
128 fffff800`11d63442 4b8d1c49        lea     rbx,[r9+r9*2]
129 fffff800`11d63446 48c1e304        shl     rbx,4
130 fffff800`11d6344a 482bd8          sub     rbx,rax
131 fffff800`11d6344d 483b1db4d02600  cmp     rbx,qword ptr [nt!MiDummyPagePfn (fffff800`11fd0508)]
132 fffff800`11d63454 7467            je      nt!MiValidateInPage+0x179 (fffff800`11d634bd)
133 
134 nt!MiValidateInPage+0x112:
135 fffff800`11d63456 4d85f6          test    r14,r14
136 fffff800`11d63459 0f85b4000000    jne     nt!MiValidateInPage+0x1cf (fffff800`11d63513)
137 
138 nt!MiValidateInPage+0x11b:
139 fffff800`11d6345f 498b0424        mov     rax,qword ptr [r12]
140 fffff800`11d63463 4883e0f8        and     rax,0FFFFFFFFFFFFFFF8h
141 fffff800`11d63467 4883f808        cmp     rax,8
142 fffff800`11d6346b 0f87ed000000    ja      nt!MiValidateInPage+0x21a (fffff800`11d6355e)
143 
144 nt!MiValidateInPage+0x12d:
145 fffff800`11d63471 8b9c2480000000  mov     ebx,dword ptr [rsp+80h]
146 
147 nt!MiValidateInPage+0x134:
148 fffff800`11d63478 f6878e00000008  test    byte ptr [rdi+8Eh],8
149 fffff800`11d6347f 743c            je      nt!MiValidateInPage+0x179 (fffff800`11d634bd)
150 
151 nt!MiValidateInPage+0x13d:
152 fffff800`11d63481 41f6450a01      test    byte ptr [r13+0Ah],1
153 fffff800`11d63486 0f8482000000    je      nt!MiValidateInPage+0x1ca (fffff800`11d6350e)
154 
155 nt!MiValidateInPage+0x148:
156 fffff800`11d6348c 488bd6          mov     rdx,rsi
157 fffff800`11d6348f 48c1fa03        sar     rdx,3
158 fffff800`11d63493 48c1e20c        shl     rdx,0Ch
159 fffff800`11d63497 49035518        add     rdx,qword ptr [r13+18h]
160 
161 nt!MiValidateInPage+0x157:
162 fffff800`11d6349b 4d8b0f          mov     r9,qword ptr [r15]
163 fffff800`11d6349e 448b8788000000  mov     r8d,dword ptr [rdi+88h]
164 fffff800`11d634a5 488bcd          mov     rcx,rbp
165 fffff800`11d634a8 4c895c2420      mov     qword ptr [rsp+20h],r11
166 fffff800`11d634ad e8260b3b00      call    nt!MiRelocateImagePfn (fffff800`12113fd8)
167 fffff800`11d634b2 4533db          xor     r11d,r11d
168 fffff800`11d634b5 85c0            test    eax,eax
169 fffff800`11d634b7 0f88f89f0f00    js      nt! ?? ::FNODOBFM::`string'+0x2540d (fffff800`11e5d4b5)
170 
171 nt!MiValidateInPage+0x179:
172 fffff800`11d634bd 4881476800100000 add     qword ptr [rdi+68h],1000h
173 fffff800`11d634c5 ff8788000000    inc     dword ptr [rdi+88h]
174 fffff800`11d634cb 4983c708        add     r15,8
175 fffff800`11d634cf 4883c608        add     rsi,8
176 fffff800`11d634d3 4c3bbc2488000000 cmp     r15,qword ptr [rsp+88h]
177 fffff800`11d634db 0f8254ffffff    jb      nt!MiValidateInPage+0xf1 (fffff800`11d63435)
178 
179 nt!MiValidateInPage+0x19d:
180 fffff800`11d634e1 8b9c2480000000  mov     ebx,dword ptr [rsp+80h]
181 
182 nt!MiValidateInPage+0x1a4:
183 fffff800`11d634e8 4883caff        or      rdx,0FFFFFFFFFFFFFFFFh
184 fffff800`11d634ec f0480fc15568    lock xadd qword ptr [rbp+68h],rdx
185 fffff800`11d634f2 48ffca          dec     rdx
186 fffff800`11d634f5 0f84c69f0f00    je      nt! ?? ::FNODOBFM::`string'+0x25419 (fffff800`11e5d4c1)
187 
188 nt!MiValidateInPage+0x1b7:
189 fffff800`11d634fb 8bc3            mov     eax,ebx
190 fffff800`11d634fd 4883c438        add     rsp,38h
191 fffff800`11d63501 415f            pop     r15
192 fffff800`11d63503 415e            pop     r14
193 fffff800`11d63505 415d            pop     r13
194 fffff800`11d63507 415c            pop     r12
195 fffff800`11d63509 5f              pop     rdi
196 fffff800`11d6350a 5e              pop     rsi
197 fffff800`11d6350b 5d              pop     rbp
198 fffff800`11d6350c 5b              pop     rbx
199 fffff800`11d6350d c3              ret
200 
201 nt!MiValidateInPage+0x1ca:
202 fffff800`11d6350e 498bd3          mov     rdx,r11
203 fffff800`11d63511 eb88            jmp     nt!MiValidateInPage+0x157 (fffff800`11d6349b)
204 
205 nt!MiValidateInPage+0x1cf:
206 fffff800`11d63513 440f20c0        mov     rax,cr8
207 fffff800`11d63517 4889842490000000 mov     qword ptr [rsp+90h],rax
208 fffff800`11d6351f b902000000      mov     ecx,2
209 fffff800`11d63524 440f22c1        mov     cr8,rcx
210 fffff800`11d63528 f00fba6b1000    lock bts dword ptr [rbx+10h],0
211 fffff800`11d6352e 458be3          mov     r12d,r11d
212 fffff800`11d63531 0f82159f0f00    jb      nt! ?? ::FNODOBFM::`string'+0x253a4 (fffff800`11e5d44c)
213 
214 nt!MiValidateInPage+0x1f3:
215 fffff800`11d63537 48b90000000000008001 mov rcx,180000000000000h
216 fffff800`11d63541 48094b28        or      qword ptr [rbx+28h],rcx
217 fffff800`11d63545 f0836310fe      lock and dword ptr [rbx+10h],0FFFFFFFEh
218 fffff800`11d6354a 0fb6c0          movzx   eax,al
219 fffff800`11d6354d 440f22c0        mov     cr8,rax
220 fffff800`11d63551 4c8ba42498000000 mov     r12,qword ptr [rsp+98h]
221 fffff800`11d63559 e913ffffff      jmp     nt!MiValidateInPage+0x12d (fffff800`11d63471)
222 
223 nt!MiValidateInPage+0x21a:
224 fffff800`11d6355e 488b5768        mov     rdx,qword ptr [rdi+68h]
225 fffff800`11d63562 4183c8ff        or      r8d,0FFFFFFFFh
226 fffff800`11d63566 488bcd          mov     rcx,rbp
227 fffff800`11d63569 e88ebf3b00      call    nt!MiValidateImagePfn (fffff800`1211f4fc)
228 fffff800`11d6356e 4533db          xor     r11d,r11d
229 fffff800`11d63571 85c0            test    eax,eax
230 fffff800`11d63573 0f89f8feffff    jns     nt!MiValidateInPage+0x12d (fffff800`11d63471)
231 
232 nt!MiValidateInPage+0x235:
233 fffff800`11d63579 e9139f0f00      jmp     nt! ?? ::FNODOBFM::`string'+0x253e9 (fffff800`11e5d491)
234 
235 nt!MiValidateInPage+0x23a:
236 fffff800`11d6357e 83fe01          cmp     esi,1
237 fffff800`11d63581 0f8696feffff    jbe     nt!MiValidateInPage+0xd9 (fffff800`11d6341d)
238 
239 nt!MiValidateInPage+0x243:
240 fffff800`11d63587 410fb7450a      movzx   eax,word ptr [r13+0Ah]
241 fffff800`11d6358c b900400000      mov     ecx,4000h
242 fffff800`11d63591 6685c1          test    cx,ax
243 fffff800`11d63594 0f8483feffff    je      nt!MiValidateInPage+0xd9 (fffff800`11d6341d)
244 
245 nt!MiValidateInPage+0x256:
246 fffff800`11d6359a a805            test    al,5
247 fffff800`11d6359c 7434            je      nt!MiValidateInPage+0x28e (fffff800`11d635d2)
248 
249 nt!MiValidateInPage+0x25a:
250 fffff800`11d6359e 4d8b7518        mov     r14,qword ptr [r13+18h]
251 
252 nt!MiValidateInPage+0x25e:
253 fffff800`11d635a2 4d85f6          test    r14,r14
254 fffff800`11d635a5 0f8472feffff    je      nt!MiValidateInPage+0xd9 (fffff800`11d6341d)
255 
256 nt!MiValidateInPage+0x267:
257 fffff800`11d635ab 4c8b4f68        mov     r9,qword ptr [rdi+68h]
258 fffff800`11d635af c1e60c          shl     esi,0Ch
259 fffff800`11d635b2 4883e3f8        and     rbx,0FFFFFFFFFFFFFFF8h
260 fffff800`11d635b6 448bc6          mov     r8d,esi
261 fffff800`11d635b9 488bcb          mov     rcx,rbx
262 fffff800`11d635bc 498bd6          mov     rdx,r14
263 fffff800`11d635bf e8c0be3b00      call    nt!SeValidateImageData (fffff800`1211f484)
264 fffff800`11d635c4 4533db          xor     r11d,r11d
265 fffff800`11d635c7 85c0            test    eax,eax
266 fffff800`11d635c9 4d0f48f3        cmovs   r14,r11
267 fffff800`11d635cd e94bfeffff      jmp     nt!MiValidateInPage+0xd9 (fffff800`11d6341d)
268 
269 nt!MiValidateInPage+0x28e:
270 fffff800`11d635d2 4533c9          xor     r9d,r9d
271 fffff800`11d635d5 33d2            xor     edx,edx
272 fffff800`11d635d7 498bcd          mov     rcx,r13
273 fffff800`11d635da 458d4101        lea     r8d,[r9+1]
274 fffff800`11d635de c744242810000040 mov     dword ptr [rsp+28h],40000010h
275 fffff800`11d635e6 44895c2420      mov     dword ptr [rsp+20h],r11d
276 fffff800`11d635eb e800a2f9ff      call    nt!MmMapLockedPagesSpecifyCache (fffff800`11cfd7f0)
277 fffff800`11d635f0 4533db          xor     r11d,r11d
278 fffff800`11d635f3 4c8bf0          mov     r14,rax
279 fffff800`11d635f6 ebaa            jmp     nt!MiValidateInPage+0x25e (fffff800`11d635a2)
280 
281 nt!MiValidateInPage+0x2b4:
282 fffff800`11d635f8 f390            pause
283 fffff800`11d635fa e9739e0f00      jmp     nt! ?? ::FNODOBFM::`string'+0x253ca (fffff800`11e5d472)
284 
285 nt! ?? ::FNODOBFM::`string'+0x253a4:
286 fffff800`11e5d44c 41ffc4          inc     r12d
287 fffff800`11e5d44f 448525f62f1700  test    dword ptr [nt!HvlLongSpinCountMask (fffff800`11fd044c)],r12d
288 fffff800`11e5d456 0f859c61f0ff    jne     nt!MiValidateInPage+0x2b4 (fffff800`11d635f8)
289 
290 nt! ?? ::FNODOBFM::`string'+0x253b4:
291 fffff800`11e5d45c 8b050e2c1700    mov     eax,dword ptr [nt!HvlEnlightenments (fffff800`11fd0070)]
292 fffff800`11e5d462 a840            test    al,40h
293 fffff800`11e5d464 0f848e61f0ff    je      nt!MiValidateInPage+0x2b4 (fffff800`11d635f8)
294 
295 nt! ?? ::FNODOBFM::`string'+0x253c2:
296 fffff800`11e5d46a 418bcc          mov     ecx,r12d
297 fffff800`11e5d46d e8523ff8ff      call    nt!HvlNotifyLongSpinWait (fffff800`11de13c4)
298 
299 nt! ?? ::FNODOBFM::`string'+0x253ca:
300 fffff800`11e5d472 8b4310          mov     eax,dword ptr [rbx+10h]
301 fffff800`11e5d475 a801            test    al,1
302 fffff800`11e5d477 75d3            jne     nt! ?? ::FNODOBFM::`string'+0x253a4 (fffff800`11e5d44c)
303 
304 nt! ?? ::FNODOBFM::`string'+0x253d1:
305 fffff800`11e5d479 f00fba6b1000    lock bts dword ptr [rbx+10h],0
306 fffff800`11e5d47f 72cb            jb      nt! ?? ::FNODOBFM::`string'+0x253a4 (fffff800`11e5d44c)
307 
308 nt! ?? ::FNODOBFM::`string'+0x253d9:
309 fffff800`11e5d481 488b842490000000 mov     rax,qword ptr [rsp+90h]
310 fffff800`11e5d489 4533db          xor     r11d,r11d
311 fffff800`11e5d48c e9a660f0ff      jmp     nt!MiValidateInPage+0x1f3 (fffff800`11d63537)
312 
313 nt! ?? ::FNODOBFM::`string'+0x253e9:
314 fffff800`11e5d491 3d9a0000c0      cmp     eax,0C000009Ah
315 fffff800`11e5d496 7411            je      nt! ?? ::FNODOBFM::`string'+0x25401 (fffff800`11e5d4a9)
316 
317 nt! ?? ::FNODOBFM::`string'+0x253f0:
318 fffff800`11e5d498 bb340400c0      mov     ebx,0C0000434h
319 fffff800`11e5d49d 899c2480000000  mov     dword ptr [rsp+80h],ebx
320 fffff800`11e5d4a4 e9cf5ff0ff      jmp     nt!MiValidateInPage+0x134 (fffff800`11d63478)
321 
322 nt! ?? ::FNODOBFM::`string'+0x25401:
323 fffff800`11e5d4a9 c747589a0000c0  mov     dword ptr [rdi+58h],0C000009Ah
324 fffff800`11e5d4b0 e92c60f0ff      jmp     nt!MiValidateInPage+0x19d (fffff800`11d634e1)
325 
326 nt! ?? ::FNODOBFM::`string'+0x2540d:
327 fffff800`11e5d4b5 c747589a0000c0  mov     dword ptr [rdi+58h],0C000009Ah
328 fffff800`11e5d4bc e92760f0ff      jmp     nt!MiValidateInPage+0x1a4 (fffff800`11d634e8)
329 
330 nt! ?? ::FNODOBFM::`string'+0x25419:
331 fffff800`11e5d4c1 488bcd          mov     rcx,rbp
332 fffff800`11e5d4c4 e8d71beeff      call    nt!MiDeleteControlArea (fffff800`11d3f0a0)
333 fffff800`11e5d4c9 90              nop
334 fffff800`11e5d4ca e92c60f0ff      jmp     nt!MiValidateInPage+0x1b7 (fffff800`11d634fb)
