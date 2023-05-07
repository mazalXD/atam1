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
    movq (%r9), %rbx
    movq %rbx, (%r10)
    dec %rax
    dec %r9
    dec %r10
    jnz Inverse_First_HW1

NoInverseNeeded_HW1:
    movq $8, %rbx
    shr %rcx
    and $7, %rax

    # copy in 64-bit chunks
    cmp $0, %rcx
    jz LoopFinally_HW1_8
    mov %rsi, %r8
    add %rcx, %r8
    sub $8, %r8
Loop_HW1_8:
    movq (%rsi), %rbx
    movq %rbx, (%rdi)
    add $8, %rsi
    add $8, %rdi
    cmp %rsi, %r8
    jne Loop_HW1_8

LoopFinally_HW1_8:
    # copy remaining bytes
    cmp $0, %rax
    jz END_OF_EX2_HW1
    mov %rsi, %r8
    add %rcx, %r8
    sub $1, %r8
LoopFinally_HW1_1:
    movb (%rsi), %bl
    movb %bl, (%rdi)
    inc %rsi
    inc %rdi
    dec %rax
    jnz LoopFinally_HW1_1

END_OF_EX2_HW1:
