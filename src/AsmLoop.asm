; AsmLoop.asm
EXTERN _exit
GLOBAL start

SECTION .data
  align 8
  iterationCount DD 100000000
  result DD 0

SECTION .text
start:
   ; Copy the iteration count to the ecx register
   ; which is used by the loopnz instruction
   mov ecx, [iterationCount]

loopBlock:
   inc dword [result] ; Increment the value at the address of result
   loopnz loopBlock   ; Decrement the ecx counter and loop until ecx is zero

exitBlock:
   push dword 0 ; Set the exit code to zero
   mov  eax, 1  ; Place the system call number (exit) in the eax reg
   sub  esp, 4  ; I have to add some dummy space to the stack for
                ; some reason
   int  0x80    ; Exit