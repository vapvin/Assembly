SYS_WRITE  equ 4
SYS_STDOUT equ 1
SYS_READ   equ 3
SYS_EXIT   equ 1

section .  data
msg db 'Hello World'
len        equ $ -msg
end db 0x0a

section .  bss

section .  text
           global_start

_start:
           mov             eax,SYS_WRITE
           mov             ebx,SYS_STDOUT
           mov             ecx,msg
           mov             edx,len
           int             0x80

           mov             eax,SYS_WRITE
           mov             ebx,SYS_STDOUT
           mov             ecx,end
           mov             edx,1
           int             0x80

           mov             [msg], dword 'Hi'

           mov             eax,SYS_WRITE
           mov             ebx,SYS_STDOUT
           mov             ecx,msg
           mov             edx,len
           int             0x80

           mov             eax,SYS_WRITE
           mov             ebx,SYS_STDOUT
           mov             ecx,end
           mov             edx,1
           int             0x80

           mov             eax,SYS_EXIT
           int             0x80


            