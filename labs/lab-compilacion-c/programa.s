	.file	"programa.c"
	.text
	.def	printf;	.scl	3;	.type	32;	.endef
	.seh_proc	printf
printf:
	pushq	%rbp
	.seh_pushreg	%rbp
	pushq	%rbx
	.seh_pushreg	%rbx
	subq	$56, %rsp
	.seh_stackalloc	56
	leaq	48(%rsp), %rbp
	.seh_setframe	%rbp, 48
	.seh_endprologue
	movq	%rcx, 32(%rbp)
	movq	%rdx, 40(%rbp)
	movq	%r8, 48(%rbp)
	movq	%r9, 56(%rbp)
	leaq	40(%rbp), %rax
	movq	%rax, -16(%rbp)
	movq	-16(%rbp), %rbx
	movl	$1, %ecx
	movq	__imp___acrt_iob_func(%rip), %rax
	call	*%rax
	movq	%rbx, %r8
	movq	32(%rbp), %rdx
	movq	%rax, %rcx
	call	__mingw_vfprintf
	movl	%eax, -4(%rbp)
	movl	-4(%rbp), %eax
	addq	$56, %rsp
	popq	%rbx
	popq	%rbp
	ret
	.seh_endproc
	.globl	llamadas
	.bss
	.align 4
llamadas:
	.space 4
	.text
	.globl	sumar
	.def	sumar;	.scl	2;	.type	32;	.endef
	.seh_proc	sumar
sumar:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	.seh_endprologue
	movl	%ecx, 16(%rbp)
	movl	%edx, 24(%rbp)
	movl	llamadas(%rip), %eax
	addl	$1, %eax
	movl	%eax, llamadas(%rip)
	movl	16(%rbp), %edx
	movl	24(%rbp), %eax
	addl	%edx, %eax
	popq	%rbp
	ret
	.seh_endproc
	.def	__main;	.scl	2;	.type	32;	.endef
	.section .rdata,"dr"
.LC1:
	.ascii "1.0\0"
	.align 8
.LC2:
	.ascii "=== Laboratorio de Compilacion en C (v%s) ===\12\12\0"
.LC3:
	.ascii "sumar(3, 4)       = %d\12\0"
.LC4:
	.ascii "CUADRADO(%d)      = %d\12\0"
.LC5:
	.ascii "MAX(7, 12)        = %d\12\0"
.LC6:
	.ascii "area_circulo(%.1f) = %.4f\12\0"
.LC7:
	.ascii "Factoriales:\12\0"
.LC8:
	.ascii "  %d! = %d\12\0"
.LC9:
	.ascii "Llamadas a sumar(): %d\12\0"
	.text
	.globl	main
	.def	main;	.scl	2;	.type	32;	.endef
	.seh_proc	main
main:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$64, %rsp
	.seh_stackalloc	64
	.seh_endprologue
	call	__main
	movsd	.LC0(%rip), %xmm0
	movsd	%xmm0, -16(%rbp)
	leaq	.LC1(%rip), %rdx
	leaq	.LC2(%rip), %rcx
	call	printf
	movl	$4, %edx
	movl	$3, %ecx
	call	sumar
	movl	%eax, -20(%rbp)
	movl	-20(%rbp), %eax
	movl	%eax, %edx
	leaq	.LC3(%rip), %rcx
	call	printf
	movl	$25, %r8d
	movl	$5, %edx
	leaq	.LC4(%rip), %rcx
	call	printf
	movl	$12, %edx
	leaq	.LC5(%rip), %rcx
	call	printf
	call	imprimir_separador
	movq	-16(%rbp), %rax
	movq	%rax, %xmm0
	call	area_circulo
	movq	%xmm0, %rax
	movq	%rax, %rdx
	movq	%rdx, %xmm1
	movq	%rax, %rdx
	movsd	-16(%rbp), %xmm0
	movq	-16(%rbp), %rax
	movapd	%xmm1, %xmm2
	movq	%rdx, %r8
	movapd	%xmm0, %xmm1
	movq	%rax, %rdx
	leaq	.LC6(%rip), %rcx
	call	printf
	leaq	.LC7(%rip), %rcx
	call	printf
	movl	$0, -4(%rbp)
	jmp	.L6
.L7:
	movl	-4(%rbp), %eax
	movl	%eax, %ecx
	call	factorial
	movl	%eax, %edx
	movl	-4(%rbp), %eax
	movl	%edx, %r8d
	movl	%eax, %edx
	leaq	.LC8(%rip), %rcx
	call	printf
	addl	$1, -4(%rbp)
.L6:
	cmpl	$5, -4(%rbp)
	jle	.L7
	call	imprimir_separador
	movl	llamadas(%rip), %eax
	movl	%eax, %edx
	leaq	.LC9(%rip), %rcx
	call	printf
	movl	$0, %eax
	addq	$64, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC10:
	.ascii "----------------------------------------\12\0"
	.text
	.globl	imprimir_separador
	.def	imprimir_separador;	.scl	2;	.type	32;	.endef
	.seh_proc	imprimir_separador
imprimir_separador:
	pushq	%rbp
	.seh_pushreg	%rbp
	movq	%rsp, %rbp
	.seh_setframe	%rbp, 0
	subq	$32, %rsp
	.seh_stackalloc	32
	.seh_endprologue
	leaq	.LC10(%rip), %rcx
	call	printf
	nop
	addq	$32, %rsp
	popq	%rbp
	ret
	.seh_endproc
	.section .rdata,"dr"
	.align 8
.LC0:
	.long	0
	.long	1075052544
	.ident	"GCC: (tdm64-1) 10.3.0"
	.def	__mingw_vfprintf;	.scl	2;	.type	32;	.endef
	.def	area_circulo;	.scl	2;	.type	32;	.endef
	.def	factorial;	.scl	2;	.type	32;	.endef
