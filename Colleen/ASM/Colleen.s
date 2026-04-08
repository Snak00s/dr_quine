extern __errno_location
global main

section .bss
	readbuff resb 101

section .data
	filename db 'Colleen.s', 0

section .text

;isssoooooou

main:

	mov rdi, filename
	mov rsi, 0
	mov rdx, 0
	mov rax, 2 ; -> open syscall rax value
	syscall

	test rax, rax		; test is usefull to check for return value
	js .openErrorEnd	; js -> check the sign flag (SF), si rax < 0 sf = 1 sinon sf = 0

	mov rbx, rax ; -> save the fd

	.readWriteLoop:
		mov rax, rbx

		mov rdi, rax
		mov rsi, readbuff
		mov rdx, 100
		call ft_read

		test rax, rax
		js .normalEnd

		test rax, rax
		jz .normalEnd	; jz <=> je -> check the zero flag (ZF) si rax == 0 alors ZF = 1

		mov rdi, 1
		mov rsi, readbuff
		mov rdx, rax
		call ft_write

		test rax, rax
		js .normalEnd

		jmp .readWriteLoop

	.normalEnd:

		mov rdi, rbx
		mov rax, 3
		syscall

		mov rdi, 0
		mov rax, 60 ; -> exit syscall rax value
		syscall
	
	.openErrorEnd:
		mov rdi, 1
		mov rax, 60 ; -> exit syscall rax value
		syscall



ft_read:
	xor rax, rax	; -> read syscall rax value
	syscall

	test rax, rax
	js .readError
	ret

	.readError:
		neg rax
		mov edi, eax
		call __errno_location
		mov [rax], rdi
		mov rax, -1
		ret



ft_write:

	mov rax, 1	; -> write syscall rax value
	syscall

	test rax, rax
	js	.negativeRax
	ret

	.negativeRax:
		neg rax
		mov edi, eax
		call __errno_location
		mov [rax], rdi
		mov rax, -1
		ret