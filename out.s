.text
    .global _start

_start:
    movl    $10, %ebx
    movl    $1, %eax
    int     $0x80
