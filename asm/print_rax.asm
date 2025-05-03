section .data
codes:
  db '0123456789ABCDEF'


section .text
global _start
_start:
  ; hex表記
  mov rax, 0x1122334455667788

  mov rdi, 1
  mov rdx, 1
  mov rcx, 64

.loop:
  push rax
  sub rcx, 4

  sar rax, cl ; clはrcxの最下位8bit
  and rax, 0xf

  lea rsi, [codes + rax]
  mov rax, 1

  push rcx
  syscall
  pop rcx

  pop rax

  test rcx, rcx
  jnz .loop

  mov rax, 60 ; exit
  xor rdi, rdi
  syscall
