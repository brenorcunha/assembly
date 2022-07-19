%include "io.inc"
section .data
    ;Definição de mensagens a serem exibidas: 
    msg1: db '- Bem vindo ao programa de calculo de area de figuras geometricas. ',10,0
    msg2: db 'Digite a operacao desejada: ', 10, 0
    msg3: db '1- Area retangulo 2- Area triangulo 3-Area trapezio.', 10, 0
    msg4: db 'Informe a base: ', 10, 0
    msg5: db 'Informe a altura: ', 10, 0
    msg6: db 'Informe a medida do topo: ', 10, 0
    msgres: db 'Area do retangulo= %d', 10, 0
    msgres2: db 'Area do triangulo= %d', 10, 0
    msgres3: db 'Area do trapezio= %d', 10, 0
    formatin: db "%d", 0
    formatout: db "%d", 10, 0
    
    ;Criação das "variáveis inteiras":
    opcao: times 4 db 0
    valor: times 4 db 0
    valor2: times 4 db 0
    valor3: times 4 db 0
    resultado: times 4 db 0
    
section .text
global CMAIN
extern printf
extern scanf
CMAIN:
    push msg1; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha

    push msg2; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push msg3; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push opcao; Guarda em um espaço de memória chamado opcao
    push formatin; Pega o formato de entrada; Pega o formato de en
    call scanf; chama função que lê o dado; chama função que lê o dado
    add esp, 8; Limpa a pilha
    mov eax, 1; Passsa valor 1 para registrador eax
    mov ebx, [opcao]; Pego o valor inteiro e coloco em ebx, para calculo.
    
    LOOP:
	;Compara a a opção: 
    cmp ebx, 1; Se 1, executa bloco opcao1
    je OPCAO1
    cmp ebx, 2; Se 2, executa bloco opcao2
    je OPCAO2
    cmp ebx, 3; Se 3, executa bloco opcao3
    je OPCAO3; Se não se enquadrar, finaliza, pois opção incorreta.
    jmp END_OPCAO
    
    OPCAO1:
	;Cálculo de área do retangulo
    push msg4; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push valor; Guarda em um espaço de memória chamado valor
    push formatin; Pega o formato de entrada; Pega o formato de entrada
    call scanf; chama função que lê o dado; chama função que lê o dado
    add esp, 8; Limpa a pilha
    mov eax, 1; Passsa valor 1 para registrador eax
    
    push msg5; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push valor2; Guarda em um espaço de memória chamado valor2
    push formatin; Pega o formato de entrada
    call scanf; chama função que lê o dado
    add esp, 8; Limpa a pilha

    call AREARETANGULO
    ;Exibe resultado na tela:
    mov eax, [resultado]; Move resultado pra registrador eax. 
    push eax; Puxo o registrador
    push msgres; Puxo a mensagem final
    call printf; Chamo função que escreve na tela
    add esp, 8; Limpo pilha
    jmp END_OPCAO
    ;==============================================================
    OPCAO2:
	;Cálculo de área do triangulo
    push msg4; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push valor; Guarda em um espaço de memória chamado valor
    push formatin; Pega o formato de entrada
    call scanf; chama função que lê o dado
    add esp, 8; Limpa a pilha
    mov eax, 1; Passsa valor 1 para registrador eax
    
    push msg5; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push valor2; Guarda em um espaço de memória chamado valor2
    push formatin; Pega o formato de entrada
    call scanf; chama função que lê o dado
    add esp, 8; Limpa a pilha
    
    call AREATRIANGULO
    ;Exibe resultado na tela:
    mov eax, [resultado]; Move resultado pra registrador eax. 
    push eax; Puxo o registrador
    push msgres2; Puxo a mensagem final
    call printf; Chamo função que escreve na tela
    add esp, 8; Limpo pilha
    jmp END_OPCAO
    ;==============================================================
    OPCAO3:
	;Cálculo de área do trapezio
    push msg4; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push valor; Guarda em um espaço de memória chamado valor
    push formatin; Pega o formato de entrada
    call scanf; chama função que lê o dado
    add esp, 8; Limpa a pilha
    mov eax, 1; Passsa valor 1 para registrador eax
    
    push msg5; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push valor2; Guarda em um espaço de memória chamado valor2
    push formatin; Pega o formato de entrada
    call scanf; chama função que lê o dado
    add esp, 8; Limpa a pilha

    push msg6; Coloca o texto na RAM
    call printf;Pega a msg do topo da pilha
    add esp, 4; Limpa a pilha
    
    push valor3; Guarda em um espaço de memória chamado valor3
    push formatin; Pega o formato de entrada
    call scanf; chama função que lê o dado
    add esp, 8; Limpa a pilha
    mov eax, 1; Passsa valor 1 para registrador eax

    call AREATRAPEZIO
    ;Exibe resultado na tela:
    mov eax, [resultado]; Move resultado pra registrador eax. 
    push eax; Puxo o registrador
    push msgres3; Puxo a mensagem final
    call printf; Chamo função que escreve na tela
    add esp, 8; Limpo pilha
    jmp END_OPCAO

    END_OPCAO:
    
    xor eax, eax
    ret
    AREARETANGULO:
        ;Cálculo da area do retangulo: 
    mov ecx, [valor];Movo a base para ecx
    mov eax, [valor2];Movo a altura pra eax
    mov ebx, 1; Passsa valor 1 para registrador ebx
    
    mul ecx; eax = eax*ecx
    mov [resultado], eax; Movo o resultado pra "variável" resultado 
    ret
    
    PERIMRETANGULO:
    ;Cálculo da area do retangulo: 
    mov ecx, [valor];Movo a base para ecx
    mov eax, [valor2];Movo a altura pra eax
    mov ebx, 1; Passsa valor 1 para registrador ebx
    
    mul ecx, [2]
    mul eax, [2]
    add eax, [ecx]
    mov [resultado], eax; Movo o resultado pra "variável" resultado 
    ret
    
    AREATRIANGULO:
    mov ecx, [valor]; passa valor da base para ecx
    mov eax, [valor2]; passa valor da altura para eax
    mov ebx, 1; Passa valor 1 para registrador ebx
    
    mul ecx; eax = eax*ecx
    mov ecx, 2; Move 2 pra ecx, pra futuras operações
    div ecx; eax = eax/ecx
    mov [resultado], eax; Move resultado de eax pra "variavel".
    ret
    
    AREATRAPEZIO:
    mov eax, [valor] ;base para eax
    mov ecx, [valor2] ;altura
    
    add eax, [valor3]; adiciono valor do topo a eax, conforme fórmula.
    mul ecx; eax = eax*ecx
	mov ecx, 2; Move 2 pra ecx, pra futuras operações
    div ecx; eax = eax/ecx
    mov [resultado], eax; Move resultado de eax pra "variavel".
    ret