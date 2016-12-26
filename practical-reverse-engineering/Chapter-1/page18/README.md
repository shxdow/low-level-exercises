1. Given what you learned about CALL and RET, explain how you would read the
value of EIP? Why can’t you just do MOV EAX, EIP?
2. Come up with at least two code sequences to set EIP to 0xAABBCCDD.
3. In the example function, addme, what would happen if the stack pointer were not
properly restored before executing RET?
4. In all of the calling conventions explained, the return value is stored in a 32-bit
register (EAX). What happens when the return value does not fit in a 32-bit register?
Write a program to experiment and evaluate your answer. Does the mechanism
change from compiler to compiler?