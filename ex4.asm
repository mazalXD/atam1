.global _start

.section .text
_start:


# Assume that the head of the linked list is stored in the global variable 'head'

    movq head, %rax    # Load the address of the head node
    cmpq $0, %rax      # Check if head is null
    je end_loop        # If so, terminate the loop
	movl (Value), %rdx
	
loop_start:
    # Process the data in the current node, if necessary
	movq (%rax), %rcx    # Load the value of the current node into RCX
	cmpq %rdx, %rcx   # Compare the value with the desired value
    je found_value
	
	
	
    movq 8(%rax), %rbx # Load the address of the next node
    cmpq $0, %rbx      # Check if the next node is null
    je end_loop        # If so, terminate the loop

    movq %rbx, %rax    # Move to the next node
    jmp loop_start     # Repeat from the beginning of the loop
	
	
found_value:
    movl %rdx, (Source)
    jmp end_loop
	
end_loop:
    # Loop terminated



