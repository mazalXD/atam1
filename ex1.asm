.global _start

.section .text
_start:
#your code here


movq (num), %rax 
movq $64 , %rcx    #sets iterator of loop to 64
xorb %r11b, %r11b     #r11b will save the result of amount of 1 in num
movl $1 ,%bl       #set bl to 1 to use as count++


BIT_COUNT_LOOP_HW1:
xorb %dl, %dl 
rolq %rax
cmovbb %bl ,%dl 
addb %dl ,%r11b

loop BIT_COUNT_LOOP_HW1       
movb %r11b ,(Bool)
END_HW1: