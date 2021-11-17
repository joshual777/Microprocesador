.global _start
_start:
	mov r0, #0
	mov r1, #0
	mov r2, #0
	ldr r3, =lorem
	ldr r4, =cadena
	
verifica:
	CMP r1, #4
	BGE aumenta
	add r1, r1, #1	
	B busqueda
aumenta: 
	add r2, r2, #1
	mov r1, #0
	B busqueda
busqueda:	
	
	ldrb r5, [r4,r0]
	CMP r5, #00000000
	beq fin
	ldrb r6, [r3,r1]
	add r0, r0, #1
	CMP r6, r5
	BGE verifica
	mov r1, #0
	b busqueda

fin: B fin
lorem: .asciz "Lorem"
cadena: .asciz "LoreuiLoremfvfhghnLorem"