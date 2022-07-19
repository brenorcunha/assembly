section	.text
	global _start       ;must be declared for using gcc
_start:                     ;tell linker entry point
	mov	edx, len    ;message length
	mov	ecx, msg    ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
		
	;Print msg2
    mov	edx, len2    ;message length
	mov	ecx, msg2   ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int	0x80        ;call kernel
	
	;Read user input
	mov edx, 5
	mov ecx, num
	mov ebx, 0
	mov eax, 3
	int 0x80

	;Num +2 sai pra SUM
	mov eax, [ecx] ;take eacx valor to eax
	sub eax, '0' ;formatting eax
	mov ebx, '2'    ;adding 2 to ebx
	sub ebx, '0'    ;formatting ebx
	add eax, ebx    ;add ebx to eax
	add eax, '0'    ;FORMATTING EAX
	add [sum], eax  ;adding result to SUM
	int 0x80
	
    ;Output the entered number: 
    mov	ecx, sum
	mov	edx, 1      ;length
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int 80h
	
	;Exit code: 
	mov eax, 1
	mov ebx, 0
	int 80h

section	.data
msg	db	'Insira um numero: ',0xa	;our dear string
len	equ	$ - msg			;length of our dear string

msg2	db	'Numero +2: ',0xa	;our dear string
len2	equ	$ - msg2			;length of our dear string

section .bss
num resb 5
sum resb 1
