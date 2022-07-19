%include "io.inc"
section .data
    msg: db 'Valor %d, Posicao %d', 10, 0
    DADOS: dd 42, 427, 533, 69, 25
    DADOSLEN: equ ($-DADOS)/4
section .text
global CMAIN
extern printf
CMAIN:
    mov ebx, 0;Incializa contador com 0
    for_each:
    ;Compara ebx com o tamanho do vetor DADOSLEN
    cmp ebx, DADOSLEN
    ;Se chegou no fim do vetor, finaliza programa
    je end_for_each
    
    ;Pega valor contido no vetor
    mov eax, [DADOS+4*ebx]
    
    ;Exibe o valor dos dados na tela.
    push ebx
    push eax
    push msg
    call printf
    add esp, 12
    
    ;Incremento o ebx em 1
    inc ebx
    jmp for_each
    
    end_for_each:    
		xor eax, eax
		ret