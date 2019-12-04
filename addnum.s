section .data
    first db "first : "
    len1 equ $ -first
    second db "second : "
    len2 equ $ -second
    third db "third : "
    end db 0x0a
section .bss
    num1 resb 5
    num2 resb 5
    num3 resb 5
    result resb 5
section .text
    global_start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,first
    mov edx,len1
    int 0x80

    mov eax,3
    mov ebx,1
    mov ecx,second
    mov edx,len2
    int 0x80

    mov eax,4
    mov ebx,1
    mov ecx,third
    mov edx,len3
    int 0x80

    mov eax, [num1]
    sub eax,"00"
    mov ebx, [num2]
    sub ebx,"00"
    mov ecx, [num3]
    sub ecx,"00"

    add eax,ebx
    add eax,ecx
    add eax,"00"

    mov [result],eax

    call _print

    mov eax,4
    mov ebx,1
    mov ecx,end
    mov edx,1
    int 0x80

    mov eax,1
    int 0x80

_print:
    mov eax,4
    mov ebx,1
    mov ecx,resultmov edx,2
    int 0x80
    ret

