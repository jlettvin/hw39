; nasm -f macho \
;   -o hello_nasm.o   hello_nasm.asm
; ld -macosx_version_min 10.7.0 \
;   -o hello_nasm hello_nasm.o \
;   -e _main
;______________________________________
global _main

stdout  equ 1

%macro  write 2
     push    dword %2
     push    dword %1
     push    dword stdout
     mov     eax, 0x4
     call    _syscall
     add     esp, 12
%endmacro

;______________________________________
section .data

msg     db      "Hello, world!",0xa
len     equ     $-msg

section     .text

;______________________________________
_main:
     write msg, len     ; OUTPUT

     push    dword 0
     mov     eax, 0x1
     call    _syscall   ; EXIT

_syscall:           
     int     0x80
     ret
;______________________________________
