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
	mov r3,#01
	mov r4,#01
	bl Recur
	str r4,[r1]
Stop b Stop
Recur
	cmp r3,r2
	bhi Exit
	mul r4,r4,r3
	add r3,#01
	push {r14}
	bl Recur
	pop {r14}
Exit bx lr

src dcd 5
	AREA DATASEG,DATA,READWRITE
dst DCD 0
	END