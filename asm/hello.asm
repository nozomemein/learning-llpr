global _start

section .data
message: db 'hello, world!', 10

section .text
_start:
    mov rax, 1 ; システムコールの番号をraxに入れる
    mov rdi, 1 ; rdiで書き込み先を指定する(fd 1 -> 標準出力)
    mov rsi, message ; rsiは文字列の先頭を渡す
    mov rdx, 14 ; 書き込むバイト数
    syscall ; syscallを呼ぶ

    mov rax, 60 ; exitのsyscall番号
    xor rdi, rdi
    syscall
