BITS 64

extern printf

global main

section .text

main:
	mov rdi, replica
	mov rsi, 10
	mov rdx, 34
	mov rcx, 9
	mov r8, replica
	xor rax, rax
	call printf wrt ..plt

	mov rdi, 0
	mov rax, 60
	syscall

section .data
	replica: db "BITS 64%1$c%1$cextern printf%1$c%1$cglobal main%1$c%1$csection .text%1$c%1$cmain:%1$c%3$cmov rdi, replica%1$c%3$cmov rsi, 10%1$c%3$cmov rdx, 34%1$c%3$cmov rcx, 9%1$c%3$cmov r8, replica%1$c%3$cxor rax, rax%1$c%3$ccall printf wrt ..plt%1$c%1$c%3$cmov rdi, 0%1$c%3$cmov rax, 60%1$c%3$csyscall%1$c%1$csection .data%1$c%3$creplica: db %2$c%4$s%2$c, 0", 0