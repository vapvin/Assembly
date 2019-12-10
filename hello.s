section .data
    msg db "Hello World"
section .text
    global _start

_start:
    mov rax, 1
    mov rdi, 1
    mov rsi, msg