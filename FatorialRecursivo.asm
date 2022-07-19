%include "io.inc"

section .data
    message1: db 'Welcome 2 cálculo fatorial!',10,0
    message11: db "Digite o numero ate 19: ",10, 0
    message2: db "Digite 1 para pausar... ", 10, 0
    message3: db "Saindo... ", 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0
    integer: times 4 db 0
    PAUSE: db "pause"
section .text
global CMAIN
extern scanf
extern printf
extern system
CMAIN:
    push message1; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4
   
    push ebx; Topo da pilha
    push ecx;Fim da pilha
    push message11; Colooca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4 ;Limpa memória que havia guardado dado anteior (Noção: -4+4 = 0)
    push integer; Guarda em um espaço de memória chamado inteiro
    push formatin
    call scanf
    add esp, 8 ;Limpa tbm
    mov eax, 1
    mov ebx, dword [integer]; Pego o valor inteiro e coloco em ebx, para calculo.
    
    LOOP:
    mul ebx; eax = eax*abx
    DEC ebx; ebx--
    cmp ebx, 1; ebx>1?
    JG LOOP; Se for, volta pro loop
     
   push eax
   push formatout
   call printf
   add esp, 8

   push message2; Coloca o texto na RAM
   call printf;Pega a msg do topo da pilha
   add esp, 4   
    
   push integer; Guarda em um espaço de memória chamado inteiro
   push formatin; Chama e formata para o form. de entrada.
   call scanf
   add esp, 8 ;Limpa tbm
   
   push message3; Coloca o texto na RAM
   call printf;Pega a msg do topo da pilha
   add esp, 4
    
   pop ecx
   pop ebx
   mov eax, 0
   ret 