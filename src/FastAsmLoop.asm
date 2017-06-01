; FastAsmLoop.asm
EXTERN _exit
GLOBAL start

SECTION .text
start:
   ; Copy the iteration count to the ecx register
   ; which is used by the loopnz instruction
   mov rcx, 0
   mov rax, 100000000

loopBlock:
   inc qword rcx     ; Increment the value at the address of result
   cmp rcx, rax;
   jl loopBlock      ; Decrement the ecx counter and loop until ecx is zero

exitBlock:
  mov     rax, 0x2000001 ; exit
  mov     rdi, 0
  syscall