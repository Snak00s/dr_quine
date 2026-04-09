BITS 64

extern printf

global main

%macro exit
	mov rdi, 0
	mov rax, 60
	syscall
	%endmacro

%macro replica

	%endmacro

%macro print

	%endmacro

section .text
	main
