.global _start

.section .text
_start:

movq root(%rip), %rax

cmpq $0, %rax
je EMPTY_HW1 

movq (new_node), %rbx
movq $16, %r10
movq $8, %r11
LOOP_HW1:
movq $0, %rdx
movq (%rax), %rcx
cmpq %rcx ,%rbx
cmova %r10, %rdx
cmpq %rcx ,%rbx
cmovb %r11,%rdx
cmpq %rcx ,%rbx
je END_HW1
movq (%rax,%rdx), %r9
cmpq $0, %r9
je ADD_HW1 
movq %r9, %rax
jmp LOOP_HW1


ADD_HW1:
leaq (%rax,%rdx),%r14
leaq new_node(%rip), %r9
movq %r9, (%rax,%rdx)
leaq (new_node+8), %r11
movq  8(%r14),%r9
movq %r9, (%r11)
leaq (new_node+16), %r11
movq  16(%r14),%r9
movq %r9, (%r11)

jmp END_HW1 
 
EMPTY_HW1:
movq $0, %rdx
leaq new_node(%rip), %r9
movq %r9, root(%rip)

movq $0, (new_node+8)
movq $0, (new_node+16)
 
END_HW1:

