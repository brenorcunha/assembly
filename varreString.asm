%include "io.inc"
%macro imprimir_string 2
    mov eax, [%2]; Movo o valor de %2 (argumento 2 da string pra eax).
    push eax;Ponho o valor na pilha
    push %1
    call printf
    add esp, 8
%endmacro
section .data
msg: db "int %d",10,0;o printf pede um dado de tipo dígito. 
num: dd 10; Significa char num=10, caractere sem formatação. 

section .text
    extern scanf
    extern printf
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    imprimir_string msg, num
    ret