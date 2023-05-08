.global _start
    
.section .text
_start:
   movq root, %rax #address of root
    cmpq $0, %rax
    jne search
    movq $new_node, root
    jmp end
search:
    movq (%rax), %rbx #data in current node
    movq %rax, %rcx
    cmpq new_node, %rbx
    je end
    js right_tree
left_tree:
    movq 8(%rax), %rax
    movq $8, %rsi
    cmpq $0, %rax
    je insert
    jmp search
right_tree:
    movq 16(%rax), %rax
    movq $16, %rsi
    cmpq $0, %rax
    je insert
    jmp search
insert:
    movq $new_node, %r9
    movq %r9, (%rcx,%rsi)
end:
