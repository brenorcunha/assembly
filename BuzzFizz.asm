%include "io.inc"
section .data
	buzz: db "Buzz", 10, 0
	fizz: db "Fizz", 10, 0
	buzzfizz: db "Buzzfizz", 10, 0
	msg: db "%d", 10,0
section .text
global CMAIN
extern printf
CMAIN:
	mov ebx, 1; Move 1 pro contador
	while:
		cmp ebx, 101; Comparo o contador com 101, se maior para a execu��o.
		je end_while; Pulo que para a execu��o.

		mov edx, 0; movo 0 pro registrador que vai receber o quociente da divis�o. movo 0 pro registrador que vai receber o quociente da divis�o.
		mov ecx, 2; movo 2 pra ecx, pra opera��o. 
		mov eax, ebx; Movo o valor pra eax, pra opera��o.
		div ecx ;edx recebe o resultado de ecx/eax

		cmp edx, 0; Comparo quociente com 0, se for, n�mero divisivel por 2.
		je printBuzz; Pulo pro bloco de printa buzz.
		jmp print_fizz; Se n�o, pro printa fizz.

		printBuzz:
			mov edx, 0; movo 0 pro registrador que vai receber o quociente da divis�o. movo 0 pro registrador que vai receber o quociente da divis�o.
			mov ecx, 3; movo 3 pra ecx, pra opera��o.
			mov eax, ebx; Movo o valor pra eax, pra opera��o.
			div ecx;edx recebe o resultado de ecx/eax
			cmp edx, 0; Comparo quociente com 0, se for, n�mero divisivel por 3.

			je print_buzzfizz; Sendo divisivel por ambos, printa buzzfizz na tela.
		    jmp fimbuzz; Sen�o, printa buzz somente.
            
		fimbuzz:
			push buzz; Puxa o buzz
			call printf; Chama fun��o printa na tela
			add esp, 4; Limpa pilha. 
			jmp endprint; Pula pra parte do contador; Pula pra parte do contador

			print_buzzfizz:
				push buzzfizz; Puxa o buzzfizz
				call printf; Chama fun��o printa na tela. 
				add esp, 4; Limpa pilha
				jmp endprint; Pula pra parte do contador; Pula pra parte do contador

		print_fizz:
			mov edx, 0; movo 0 pro registrador que vai receber o quociente da divis�o. movo 0 pro registrador que vai receber o quociente da divis�o.
			mov ecx, 3; movo 3 pra ecx, pra opera��o.
			mov eax, ebx; Movo o valor pra eax, pra opera��o.
			div ecx;edx recebe o resultado de ecx/eax
			cmp edx, 0; Comparo quociente com 0, se for, n�mero divisivel por 3.

			cmp edx, 0; Divisivel por 3
			je fimfizz; Se sim, pula pro fimfizz, pra printar o fizz de vez. 
			jmp printnumero; Sen�o, printa o n�mero, n�o divisivel por 2 nem por 3.

			fimfizz:
				push fizz; Puxo o fizz
				call printf; Chama fun��o printa na tela. 
				add esp, 4; Limpa pilha
                        jmp endprint; Pula pra parte do contador
				
			printnumero:
				push ebx
				push msg; Puxo o conte�do de msg. 
				call printf; Chama fun��o printa na tela.
				add esp, 8; Limpa pilha
		         jmp endprint; Pula pra parte do contador
				
		endprint:
			inc ebx; Incrementa o contador. 
			jmp while; Volta pro come�o do la�o while.

	end_while:
		xor eax, eax
		ret