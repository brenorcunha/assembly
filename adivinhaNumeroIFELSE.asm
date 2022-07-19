%include "io.inc"
section .data
    msg1: db 'Adivinhe o numero que estou pensando... Entre 0 e 5: ',10, 0
    msgCerto: db "Parabens, voce acertou!",10,0
    msgErrado: db "Nao foi desta vez...", 10, 0
    formatin: db "%d", 0
    usrinput: times 4 db 0;Inteiro de 32 bits (= 4bytes, multiplico 1 byte por 4).
section .text
    extern scanf
    extern printf
global CMAIN
CMAIN:
    ;Pedindo que usuario digite um numero: 
    push msg1
    call printf
    add esp, 4
    ;Armazenando o numero digitado na variavel usrprint: 
    push usrinput
    push formatin
    call scanf
    add esp, 8
    mov ebx, [usrinput]
    cmp ebx, 2
    je if_block
    jmp else_block
    
     if_block: 
        push msgCerto
        call printf
        add esp, 4
        jmp end_if
    else_block:
        push msgErrado
        call printf
        add esp, 4
        jmp end_if
    end_if:
    xor eax, eax
    ret