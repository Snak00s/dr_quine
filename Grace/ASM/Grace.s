BITS 64

extern dprintf

extern fflush

global main

%macro data 0
section .data
	replica db "BITS 64%1$c%1$cextern dprintf%1$c%1$cextern fflush%1$c%1$cglobal main%1$c%1$c%%macro data 0%1$csection .data%1$c	replica db %2$c%4$s%2$c, 0%1$c	filename db %2$cGrace_kid.s%2$c, 0%1$c%%endmacro%1$c%1$c%%macro graceKid 0%1$c	mov rax, 2%1$c	mov rdi, filename%1$c	mov rsi, 577%1$c	mov rdx, 420%1$c	syscall%1$c	test rax, rax%1$c	js .error%1$c	mov rbx, rax%1$c	%3$cyoooooooooooooooo%1$c	mov rdi, rax%1$c	mov rsi, replica%1$c	mov rdx, 10%1$c	mov rcx, 34%1$c	mov r8, 59%1$c	mov r9, replica%1$c	xor rax, rax%1$c	push rbp%1$c	call dprintf wrt ..plt%1$c	pop rbp%1$c	mov rdi, 0%1$c	call fflush%1$c	mov rdi, rbx%1$c	mov rax, 3%1$c	syscall%1$c%%endmacro%1$c%1$c%%macro start 0%1$csection .text%1$cmain:%1$c	graceKid%1$c	mov rdi, 0%1$c	mov rax, 60%1$c	syscall%1$c	.error:%1$c		mov rdi, 1%1$c		mov rax, 60%1$c		syscall%1$c%%endmacro%1$c%1$cdata%1$cstart", 0
	filename db "Grace_kid.s", 0
%endmacro

%macro graceKid 0
	mov rax, 2
	mov rdi, filename
	mov rsi, 577
	mov rdx, 420
	syscall
	test rax, rax
	js .error
	mov rbx, rax
	;yoooooooooooooooo
	mov rdi, rax
	mov rsi, replica
	mov rdx, 10
	mov rcx, 34
	mov r8, 59
	mov r9, replica
	xor rax, rax
	push rbp
	call dprintf wrt ..plt
	pop rbp
	mov rdi, 0
	call fflush
	mov rdi, rbx
	mov rax, 3
	syscall
%endmacro

%macro start 0
section .text
main:
	graceKid
	mov rdi, 0
	mov rax, 60
	syscall
	.error:
		mov rdi, 1
		mov rax, 60
		syscall
%endmacro

data
start