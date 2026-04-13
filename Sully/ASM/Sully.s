BITS 64

global main
extern sprintf
extern dprintf
extern fflush
extern system

section .text
main:
	mov r15, 5
	test r15, r15
	jz zero

	sub r15, 1

	mov rdi, buff
	mov rsi, filename
	mov rdx, r15
	push rbp
	call sprintf wrt ..plt
	pop rbp

	mov rax, 2
	mov rdi, buff
	mov rsi, 577
	mov rdx, 420
	syscall
	test rax, rax
	js zero
	mov rbx, rax

	mov rdi, rax
	mov rsi, replica
	mov rdx, 10
	mov rcx, 34
	mov r8, replica
	mov r9, r15
	push rbp
	call dprintf wrt ..plt
	pop rbp

	mov rdi, rbx
	mov rax, 3
	syscall

	mov rdi, buff
	mov rsi, run
	mov rdx, r15
	push rbp
	call sprintf wrt ..plt
	pop rbp

	mov rdi, buff
	push rbp
	call system wrt ..plt
	pop rbp

	mov rdi, 0
	mov rax, 60
	syscall

zero:
	mov rdi, 0
	mov rax, 60
	syscall

section .bss
	buff resb 500
section .data
	filename db "Sully_%d.s", 0
	run db "nasm -f elf64 Sully_%1$d.s && gcc -no-pie Sully_%1$d.o -o Sully_%1$d && ./Sully_%1$d", 0
	replica db "BITS 64%1$c%1$cglobal main%1$cextern sprintf%1$cextern dprintf%1$cextern fflush%1$cextern system%1$c%1$csection .text%1$cmain:%1$c	mov r15, %4$d%1$c	test r15, r15%1$c	jz zero%1$c%1$c	sub r15, 1%1$c%1$c	mov rdi, buff%1$c	mov rsi, filename%1$c	mov rdx, r15%1$c	push rbp%1$c	call sprintf wrt ..plt%1$c	pop rbp%1$c%1$c	mov rax, 2%1$c	mov rdi, buff%1$c	mov rsi, 577%1$c	mov rdx, 420%1$c	syscall%1$c	test rax, rax%1$c	js zero%1$c	mov rbx, rax%1$c%1$c	mov rdi, rax%1$c	mov rsi, replica%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, replica%1$c	mov r9, r15%1$c	push rbp%1$c	call dprintf wrt ..plt%1$c	pop rbp%1$c%1$c	mov rdi, rbx%1$c	mov rax, 3%1$c	syscall%1$c%1$c	mov rdi, buff%1$c	mov rsi, run%1$c	mov rdx, r15%1$c	push rbp%1$c	call sprintf wrt ..plt%1$c	pop rbp%1$c%1$c	mov rdi, buff%1$c	push rbp%1$c	call system wrt ..plt%1$c	pop rbp%1$c%1$c	mov rdi, 0%1$c	mov rax, 60%1$c	syscall%1$c%1$czero:%1$c	mov rdi, 0%1$c	mov rax, 60%1$c	syscall%1$c%1$csection .bss%1$c	buff resb 500%1$csection .data%1$c	filename db %2$cSully_%%d.s%2$c, 0%1$c	run db %2$cnasm -f elf64 Sully_%%1$d.s && gcc -no-pie Sully_%%1$d.o -o Sully_%%1$d && ./Sully_%%1$d%2$c, 0%1$c	replica db %2$c%3$s%2$c, 0", 0