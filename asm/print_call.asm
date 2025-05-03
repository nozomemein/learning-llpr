section .data

newline_char: db 10
codes: db '0123456789abcdef'

section .text
global _start

print_newline:
  mov rax, 1 ; write syscall id
  mov rdi, 1 ; stdoutの指定
  mov rsi, newline_char ; 書き込むデータの場所
  mov rdx, 1 ; 書き込むバイト数
  syscall
  ret


print_hex:
  mov rax, rdi
  mov rdi, 1
  mov rdx, 1
  mov rcx, 64
iterate:
  push rax
  sub rcx, 4
  sar rax, cl



  and rax, 0xf ; 0xfは1111なので下位4bit以外をクリア
  lea rsi, [codes + rax] ; 実行アドレスを計算してアドレスを読み込む

  mov rax, 1 ; write

  push rcx
  syscall

  pop rcx
  pop rax

  test rcx, rcx ; rcx = 0ならloopおわり
  jnz iterate

  ret

_start:
  mov rdi, 0x1122334455667788
  call print_hex
  call print_newline

  mov rax, 60 ; exit
  xor rdi, rdi
  syscall
