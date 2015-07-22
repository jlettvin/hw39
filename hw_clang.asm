// clang -c -arch i386 \
//   -o hw_clang.o hw_clang.asm
// ld -macosx_version_min 10.7.0 \
//   -o hw_clang hw_clang.o \
//   -e _main -no_pie -arch i386
//_____________________________________
.globl _main

.equ    stdout, 1

.macro  write msg, len
    push \len
    push \msg
    push $stdout
    movl $4, %eax
    call _syscall
    addl $12, %esp
.endm

//_____________________________________
.data

msg:    .string "Hello World!\n"
.equ    len, .-msg

.text

//_____________________________________
_main:
    write $msg, $len    // OUTPUT

    push $0
    movl $1, %eax
    call _syscall       // EXIT

_syscall:
    int $0x80
    ret
//_____________________________________
