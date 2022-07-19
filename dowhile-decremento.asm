%include "io.inc"
section .data

    formatout: db "%d", 10,0

section .text

global CMAIN

extern printf

CMAIN:

	mov ebx, 20; Move 20 pro contador

	dowhile:

        push ebx; Puxo ebx

        push formatout; formato para saída

        call printf; Imprimo ebx

        add esp, 8; Limpo a pilha

	dec ebx; decremento ebx em 1

        cmp ebx, -10; se igual a -10

        je end_dowhile; finaliza

        jmp dowhile; ou volta pro começo do laço

	end_dowhile:

		xor eax, eax

		ret
