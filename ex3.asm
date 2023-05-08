.global _start

.section .text
_start:
#your code here
leaq array1, %r8
leaq array2, %r9
leaq mergedArray, %r10
movl (%r8), %eax
cmpl %eax, (%r9)
jb Before_Main_Loop_HW1
movl (%r9), %eax

Before_Main_Loop_HW1:
cmp $0, %eax
je After_2_Loops_HW1

movl %eax, (%r10)
add $4, %r10

Main_Loop_HW1:
    cmpl $0, (%r8)
    je Prolog_Final_Loop_HW1
    cmpl $0, (%r9)
    je Prolog_Final_Loop_HW1
    movl (%r8), %ebx
    cmpl %ebx, (%r9)
    ja Take_Right_HW1
    jb Take_Left_HW1
    jmp Take_Mid_HW1
    Take_Right_HW1:
        movl (%r9), %edi
        add $4, %r9
        jmp AfterTaking_HW1
    Take_Left_HW1:
        movl (%r8), %edi
        add $4, %r8
        jmp AfterTaking_HW1        
    Take_Mid_HW1:
        movl (%r8), %edi
        add $4, %r8        
        add $4, %r9    
    AfterTaking_HW1:
        cmp %eax, %edi
        je Main_Loop_HW1
        movl %edi, %eax
        movl %edi, (%r10)
        add $4, %r10    
    jmp Main_Loop_HW1


Prolog_Final_Loop_HW1:
    mov $0, %rcx
    movq %r8, %rsi

Final_Loop_HW1:
    cmpl $0, (%rsi)
    je After_Final_Loop_HW1
    movl (%rsi), %ebx
    add $4, %rsi
    cmpl %eax, %ebx
    jae Final_Loop_HW1
    movl %ebx, (%r10)
    add $4, %r10
    jmp Final_Loop_HW1

       
After_Final_Loop_HW1:    
    cmp $1, %rcx
    je After_2_Loops_HW1
    mov $1, %rcx
    movq %r9, %rsi
    jmp Final_Loop_HW1
    
    
After_2_Loops_HW1:    
    movl $0, (%r10)
