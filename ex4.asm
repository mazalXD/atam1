.global _start

.section .text
_start:
    cmpq $0, head
    je end
    movq src, %rax
    cmpq dst, %rax
    je end
    movq head, %rax
    movq $0, %r8 #previous node src
    movq %rax, %r9 #pervious node dst
    movq src, %rsi
    movq dst, %rdx

search_src:
    movq %rax, %r10 #src
    cmpq %rsi, (%rax) #check if src==curr
    je search_dst
    cmpq $0, 8(%rax) #check if null
    je end
    movq %rax, %r8 #store prev
    movq 8(%rax), %rax
    jmp search_src

search_dst:
    cmpq %rdx, (%rax) #check if dst==curr
    je swap
    #leaq 8(%rax), %r15
    cmpq $0 , 8(%rax) #check if null
    je end
    movq %rax, %r9 #store prev
    movq 8(%rax), %rax
    jmp search_dst
     
swap:#r10=src rax=dst r8=presrc r9=predst
    cmpq $0, %r8
    jz no_pre_dst
    movq %rax, 8(%r8)
no_pre_dst:
    movq %r10, 8(%r9)
    movq 8(%rax), %rbx
    movq 8(%r10), %rcx
    movq %rbx, 8(%r10) 
    movq %rcx, 8(%rax)
    cmpq %r10, head
    jne end
    movq %rax, head
     
end:
    
