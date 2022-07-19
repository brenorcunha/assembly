%include "io.inc"

section .data
MEUVETOR: dd 100, 320, 400, 500
          dd 600, 700, 800, 900
COMPRIMENTO_MEUVETOR: equ ($-MEUVETOR) /4
formatout: db "%d", 10, 0

section .text
global CMAIN
CMAIN:
mov ebx, 0
LOOP:
    mov eax, [MEUVETOR+4*ebx];Pegue posi��o 4*ebx, que � o i, contador.
    ;OBS: 4 acima pq o vetor armazena os valores e sequ�ncia, ocupando 4 bits cada, ent�o o vetor varre de 4 em 4 posi��es.
    push eax;Coloca o valor anterior na pilha
    push formatout;formata��o pra exibir na tela
    call printf;printa na tela
    add esp, 8;limpa pilha
    inc ebx;ebx++
    cmp ebx, COMPRIMENTO_MEUVETOR; se ebx (Contador)>comprimento total do vertor, para, sen�o, segue o loop.
    JL LOOP
ret