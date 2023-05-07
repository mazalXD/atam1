.global _start

.section .text
_start:
#mazalReut


# decide direction
    movl (num), %ecx
    cmp $0, %ecx
    jl Negative_Num_HW1
    leaq (source), %rsi
    leaq (destination), %rdi
    jmp PrologLoop1_HW1

Negative_Num_HW1:
    not %ecx
    inc %ecx
    leaq (destination), %rsi
    leaq (source), %rdi


PrologLoop1_HW1:
        movq $0, %rdx
        movsx %ecx, %rax
        cmp %rdi, %rsi
        jge NoInverseNeeded_HW1
        movq %rax, %r8
        add %rsi, %r8
        sub %rdi, %r8
        cmp $0, %r8
        jle NoInverseNeeded_HW1
        movq %rsi, %r9
        movq %rdi, %r10
        add %rax, %r9
        dec %r9
        add %rax, %r10
        dec %r10
Inverse_First_HW1: 
        movb (%r9), %bl
        movb %bl, (%r10)
        dec %rax
        dec %r9
        dec %r10
        dec %r8
        jz NoInverseNeeded_HW1
        jmp Inverse_First_HW1
        
NoInverseNeeded_HW1:        
        movq $8, %rbx
        div %rbx        # now rax = num / 8, rdx = num % 8
        
        cmp $0, %rax
        jz PrologLoopFinally_HW1
        mov $0, %rcx
Loop_HW1:
        movq (%rsi), %rbx
        movq %rbx, (%rdi)
        add $8, %rsi
        add $8, %rdi

        inc %rcx
        cmp %rcx, %rax
        je PrologLoopFinally_HW1
        jmp Loop_HW1


PrologLoopFinally_HW1:
        cmp $0, %rdx
        jz END_OF_EX2_HW1
        mov $0, %rcx
LoopFinally_HW1:
        movb (%rsi), %bl
        movb %bl, (%rdi)
        inc %rsi
        inc %rdi
        
        inc %rcx
        cmp %rcx, %rdx
        je END_OF_EX2_HW1
        jmp LoopFinally_HW1


END_OF_EX2_HW1:
