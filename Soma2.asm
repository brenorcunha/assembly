%include "io.inc"
extern printf

    SECTION .data ;O que  tiver dois pontos na seção .data, é variável
    a: dd 5
    fmt: db "a=%d, eax=%d", 10, 0
    
    SECTION .text
    global _main
    
    _main:
    push ebp
    mov ebp, esp
    mov eax, [a];Poe o valor de a no registrador eax
    add eax, 2 ;Pegue o que estiver em eax (o valor da variável a), e some 2.
    push eax;valor de a+2
    push dword [a]
    push dword fmt
    call printf
    add esp,12
    mov esp, ebp
    pop ebp
    
    mov eax, 0
    ret
    
    ;multiplicação: 
    ;mov ebp,2
    ;mov esp,5
    ;mul esp ; Faz 5*2 e guarda em esp (esp = esp*ebp)
