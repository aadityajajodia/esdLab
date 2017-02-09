	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0,=src
	ldr r1,=dst
	ldr r2,[r0]
	mov r3,#1
	mov r4,#1
	bl Recur
Stop b Stop
Recur	
	add r5,r3,r4
	cmp r5,r2
	bhi Skip
	str r5,[r1],#4
	mov r3,r4
	mov r4,r5
	push {r14}
	bl Recur
	pop {r14}
Skip bx lr
src dcd 34
	AREA DATASEG,DATA,READWRITE

dst dcd 0
	END