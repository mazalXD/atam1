.global _start

.section .text
_start:
    movq $source, %rax
    movq $destination, %rbx
    movl num, %ecx
    cmpl $0, %ecx
    je   end
    movq $0, %r8
    cmpl $0, %ecx
    jl negative
copy_loop:
    movb (%rax,%r8), %dl #dl = *(source + num)
    leaq (%rbx,%r8), %rsi #rsi = dest + num
    inc %r8	
    movb %dl, (%rsi)
    loop copy_loop
    jmp end
negative:
    movl %ecx, (%rbx)
end: