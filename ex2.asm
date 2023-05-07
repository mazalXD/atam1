.global _start

.section .text
_start:
#mazalReut


section .text

; Copies <num> bytes starting at the source address to the destination address
; If <num> is positive, it behaves like memmove
; If <num> is negative, it copies |<num>| bytes to destination
ex2:
;  push rbp           Preserve the base pointer
;  mov rbp, rsp      ; Set up the new base pointer

  mov (num),eax    ; Load the value of num
  cmp eax, 0        ; Compare num to zero
  je end            ; If num is zero, return

  mov (source), rsi ; Load the source address into rsi
  mov (destination), rdi ; Load the destination address into rdi

  cmp eax, 0        ; Check if num is positive or negative
  jg forward        ; If num is positive, jump to forward
  neg eax           ; If num is negative, negate it
  sub rsi, rax      ; Adjust the source address
  sub rdi, rax      ; Adjust the destination address
  jmp forward       ; Jump to forward

backward:
  mov(rsi + rax - 1),al  ; Load the byte from the source address
  mov al, (rdi + rax - 1)   ; Store the byte to the destination address
  dec eax           ; Decrement the counter
  jnz backward      ; If the counter is not zero, repeat


forward:
  mov ecx, eax      ; Copy num into ecx
  xor eax, eax      ; Clear eax
  cld               ; Clear the direction flag
  rep movsb         ; Move ecx bytes from rsi to rdi

  jmp end           ; Jump to end

end:
;  pop rbp           ; Restore the base pointer
;  ret              ; Return from the function
