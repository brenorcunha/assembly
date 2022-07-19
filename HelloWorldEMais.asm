%include "io.inc"
extern printf

section .data
    global  _main
    extern  printf
    section .text

_main:
    push message
    call printf
    add esp, 4
    ret

message:
    db  'Hello, world!', 10, 0
 
======================================== HELLO WORLD NASM SEM PRINTF=======================================================
section	.text
	global _start       ;must be declared for using gcc
_start:                 ;tell linker entry point
	mov	edx, len    ;message length
	mov	ecx, msg    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
	mov	eax, 1	    ;system call number (sys_exit)
	int	0x80        ;call kernel

section	.data

msg	db	'Hello, world!',0xa	;our dear string
len	equ	$ - msg			;length of our dear string
===========================================================================================================================

; Criando uma variável (todas são genéricas em Assembly): SIZE EQU 100 (SIZE = 100). 
; MOVE #SIZE,D0 = Move o valor de SIZE para o registrador D0 (eax = registrador especial). 

; %macro nome_da_MACRO nº de argumentos
; corpo
; %endmacro

; Exemplo:
; %macro func X
; move aex,x
; %endmacro

; call func 0,001

 ; Eu criei a função func, que solicita um valor x, e o move para o registrado eax. 

 ; Multiplicação: 
; mov ax,5
; mov cx,10
; mul cx ; Aqui faz 10*5 e guarda em ax o resultado, ou ax = ax*cx

