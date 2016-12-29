1. - [x] Figure 2-8 shows a function that takes two arguments. It may seem some-what
		 challenging at first, but its functionality is very common.Have patience.
2. - [x] Figure 2-9 shows a function that was found in the export table.

3. - [x] Here is a simple function:
		 01:             mystery3
		 02: 83 68         LDR             R3, [R0,#8]
		 03: 0B 60         STR             R3, [R1]
		 04: C3 68         LDR             R3, [R0,#0xC]
		 05: 00 20         MOVS            R0, #0
		 06: 4B 60         STR             R3, [R1,#4]
		 07: 70 47         BX              LR
		 08:             ; End of function mystery3
4. - [x] Figure 2-10 shows another easy function.

5. - [x] Figure 2-11 is simple as well. The actual string names have been removed 
		 so you cannot cheat by searching the Internet.

6. - [x] Figure 2-12 involves some twiddling.

7. - [x] Figure 2-13 illustrates a common routine, but you may not have seen it 
		 implemented this way.

8. - [x] In Figure 2-14, byteArray is a 256-character array whose content is
		 byte-Array[] = {0, 1, ..., 0xff}.

9. - [x] What does the function shown in Figure 2-15 do?

10. - [x] Figure 2-16 is a function from Windows RT. Read MSDN if needed. Ignore 
		  the security PUSH/POP cookie routines.

11. - [ ] In Figure 2-17, sub_101651C takes three arguments and returns nothing. 
		  If you complete this exercise, you should pat yourself on the back.
