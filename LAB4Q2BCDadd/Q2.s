	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10000000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	ldr r0,=src
	ldr r1,=dst
	ldr r2,[r0],#4
	ldr r3,[r0]
	mov r6,#0
	mov r10,#0x0
	mov r10,#08
Loop
	and r4,r2,#0x0f
	lsr r2,r2,#0x04
	and r5,r3,#0x0f
	lsr r3,r3,#0x04
	add r5,r6
	add r6,r4,r5
	cmp r6,#09
	bls Skip
	add r6,#06
Skip
	and r7,r6,#0x0f
	lsr r6,#04
	orr r9,r7
	ror r9,#4
	sub r10,#1
	teq r10,#0
	bne Loop
	str r9,[r1]
src dcd 0x910,0x88
	AREA DATASEG,DATA,READWRITE
dst DCD 0
	END