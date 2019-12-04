section .bss
    input resb 1
    temp resb 1    
section .data
    num db "num : "
    len1 equ $ -num
    odd db "odd"
    len2 equ $ -odd
    even db "even "
    len3 equ $ -even
    end db 0ah
section .text
    global_start

_start:
    mov eax,4
    mov ebx,1
    mov ecx,num
    mov edx,len1
    int 0x80

    mov eax,3
    mov ebx,1
    mov ecx,input
    mov edx,1
    int 0x80

    mov eax,3
    mov edx,1
    mov ecx,temp
    mov edx,1
    int 0x80

    mov al,[input]
    sub al,00h

    and al,1
    jz _even

    mov eax,4
    mov edx,1
    mov ecx,odd
    mov edx,len2
    int 0x80

    mov eax,4
    mov edx,1
    mov ecx,end
    mov edx,1
    int 0x80

    jmp _exit

_even:
    mov eax,4
    mov edx,1
    mov ecx,even
    mov edx,len3
    int 0x80

    mov eax,4
    mov edx,1
    mov ecx,end
    mov edx,1
    int 0x80

    jmp _exit
_exit:
    mov eax,1
    int 0x80

