BITS 64

extern printf

extern fflush

;comment outside

global main

section .text

main:
	mov rdi, replica
	mov rsi, 10
	mov rdx, 34
	mov rcx, 9
	mov r8, 59
	mov r9, replica
	xor rax, rax
	push rbp
	call printf wrt ..plt
	pop rbp
	;comment inside
	mov rdi, 0
	call fflush

	mov rdi, 0
	mov rax, 60
	syscall

section .data
	replica: db "BITS 64%1$c%1$cextern printf%1$c%1$cextern fflush%1$c%1$c%4$ccomment outside%1$c%1$cglobal main%1$c%1$csection .text%1$c%1$cmain:%1$c%3$cmov rdi, replica%1$c%3$cmov rsi, 10%1$c%3$cmov rdx, 34%1$c%3$cmov rcx, 9%1$c%3$cmov r8, 59%1$c%3$cmov r9, replica%1$c%3$cxor rax, rax%1$c%3$cpush rbp%1$c%3$ccall printf wrt ..plt%1$c%3$cpop rbp%1$c%3$c%4$ccomment inside%1$c%3$cmov rdi, 0%1$c%3$ccall fflush%1$c%1$c%3$cmov rdi, 0%1$c%3$cmov rax, 60%1$c%3$csyscall%1$c%1$csection .data%1$c%3$creplica: db %2$c%5$s%2$c, 0", 0