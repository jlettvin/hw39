; yasm -f macho64 -DDARWIN \
;   -o hw_yasm.o hw_yasm.asm
; ld -macosx_version_min 10.7.0 \
;   -o hw_yasm hw_yasm.o \
;   -e _main
;______________________________________
global _main

%define stdout 1

%macro  write 2
    mov     rdx, %2
    mov     rsi, qword %1
    mov     rdi, stdout
    mov     rax, 0x2000000 + 4
    syscall

%endmacro

;______________________________________
section .data

msg:    db  'hello, world!',0xa
len     equ $-msg

section .text

;______________________________________
_main:
    write msg, len  ; OUTPUT

    mov     rax, 0x2000000 + 1
    xor     rdi, rdi
    syscall         ; EXIT

# syscall is builtin


;______________________________________
