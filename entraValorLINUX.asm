section	.data
userMsg db 'Please enter a number: ', 0xA
lenUserMsg EQU $-userMsg
dispMsg db 'U have entered: ', 0xA
lenDispMsg EQU $-dispMsg

section .bss
num resb 5  ;Reserve already 5 bits of length for this number.
;Alternative: Write "num dd 0" command and ask for num_length by the normal way. 
section	.text
	global _start       ;must be declared for using gcc
_start:                 ;tell linker entry point
    ;orint messages in the screen: 
	mov	edx, lenUserMsg    ;message length
	mov	ecx, userMsg       ;message to write
	mov	ebx, 1	    ;file descriptor (stdout)
    mov	eax, 4	    ;system call number (sys_write)
	int 80h
	
	mov	edx, lenDispMsg ;message length
	mov	ecx, dispMsg    ;message length
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int 80h
	
    ;Read and store user input:
	mov	edx, 5  ;5 bytes (numeric, 1 for sign) of that information (NUM LENGTH)
	mov	ecx, num
	mov	ebx, 0  ;file descriptor (in)
	mov	eax, 3  ;system call number (sys_read)
	int 80h
	
	;Output the entered number: 
	mov	edx, 5   ;5 bytes (numeric, 1 for sign) of that information (NUM LENGTH)
	mov	ecx, num
	mov	ebx, 1	    ;file descriptor (stdout)
	mov	eax, 4	    ;system call number (sys_write)
	int 80h

	;Exit code: 
	mov eax, 1
	mov ebx, 0
	int 80h