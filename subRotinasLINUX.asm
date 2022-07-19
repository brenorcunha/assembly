section	.text
	global _start       ;must be declared for using gcc
_start: ;tell linker entry point
mov ecx, variable
call LEITURA
mov ecx, variable
call ESCRITA
mov	eax, 1	    ;system call number (sys_exit)
int	0x80        ;call kernel

LEITURA:
    mov eax, 3
    mov ebx, 0
    mov edx, 1
    int 0x80
    ret

ESCRITA:
    mov eax, 4
    mov ebx, 1
    mov edx, 1
    int 0x80
    ret
section	.data
variable:	db	"", 10, 0

