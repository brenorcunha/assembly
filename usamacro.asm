%include "io.inc"

section .data
    dado: db "Testando macro...", 10, 0
    msg1: db "O valor é: %d", 10, 0
    numero: dd 4.0
    
%macro escreva 1
    push %1
    call printf
    add esp, 4
%endmacro

%macro escreva 2
    push %2
    push %1
    call printf
    add esp, 8
    add esp, 0
%endmacro

section .text
extern printf
global CMAIN
CMAIN:
    escreva dado
    escreva msg1, numero
    xor eax, eax
    ret
