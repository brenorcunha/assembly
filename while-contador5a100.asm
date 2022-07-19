%include "io.inc"
section .data
    formatout: db "%d", 10,0
section .text
global CMAIN
extern printf
CMAIN:
	mov ebx, 5; Move 5 pro contador
	while:
		cmp ebx, 101; Comparo o contador com 101, se igual para a execu��o.
		je end_while; Pulo que para a execu��o.
                push ebx
                push formatout
                call printf
                add esp, 8
                
		inc ebx; Incrementa o contador. 
		jmp while; Volta pro come�o do la�o while.

	end_while:
		xor eax, eax
		ret