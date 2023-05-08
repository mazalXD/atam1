.global _start

.section .text
_start:


	movq (src), %r10
	movq (dst), %r11
	cmp %r10, %r11
	je Finish_HW1


	movq (head), %rcx
	movq $head, %rbp
	mov $0, %r8
	mov $0, %r9
TraverseList_HW1:
    cmp $0, %rcx
    je AfterLoop_HW1
    
    movq (%rcx), %rdx
    cmp %r10, %rdx
    jne SecondCheck_HW1
    cmp $0, %r8
    jnz Finish_HW1
    movq %rbp, %r12
    movq %rcx, %rsi
    movq 8(%rcx) ,%r13
    inc %r8
    
SecondCheck_HW1:    

    movq (%rcx), %rdx
    cmp %r11, %rdx
    jne Epilog_Loop_HW1
    cmp $0, %r9
    jnz Finish_HW1
    movq %rbp, %r14    
    movq %rcx, %rdi
    movq 8(%rcx) ,%r15
    inc %r9
    
Epilog_Loop_HW1:    
    movq %rcx, %rbp
    movq 8(%rcx), %rcx   
    jmp TraverseList_HW1

AfterLoop_HW1:
    cmp $1, %r8
    jne Finish_HW1
    cmp $1, %r9
    jne Finish_HW1
    
    movq 8(%rsi), %rcx
    cmp %rdi, %rcx
    je NeighborsCaseOne_HW1
    movq 8(%rdi), %rcx
    cmp %rsi, %rcx
    je NeighborsCaseTwo_HW1    
    jmp NotNeighbors_HW1
    
NeighborsCaseOne_HW1:
    cmpq $head, %r12
    jne NotRootOne_HW1
        movq %rdi, (%r12)    
        jmp RootOne_HW1
    NotRootOne_HW1:                
        movq %rdi, 8(%r12)
    RootOne_HW1:                
        movq %rsi, 8(%rdi)
        movq %r15, 8(%rsi)    
        jmp Finish_HW1

NeighborsCaseTwo_HW1:
    cmpq $head, %r14
    jne NotRootTwo_HW1
        movq %rsi, (%r14)    
        jmp RootTwo_HW1
    NotRootTwo_HW1:    
        movq %rsi, 8(%r14)
    RootTwo_HW1:
        movq %rdi, 8(%rsi)
        movq %r13, 8(%rdi)
        jmp Finish_HW1
    
NotNeighbors_HW1:    
    cmpq $head, %r12
    jne NotRootThree_HW1
        movq %rdi, (%r12)    
        jmp RootCheckAgain_HW1
    NotRootThree_HW1:                
        movq %rdi, 8(%r12)

    RootCheckAgain_HW1:
    cmpq $head, %r14
    jne NotRootFour_HW1
        movq %rsi, (%r14)    
        jmp Finally_HW1
    NotRootFour_HW1:    
        movq %rsi, 8(%r14)

Finally_HW1:
    movq %r13, 8(%rdi)
    movq %r15, 8(%rsi)
    jmp Finish_HW1
    
Finish_HW1:
