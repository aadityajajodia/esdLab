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
	ldr r2,[r0],#0x04
	ldr r3,[r0]
	mov r4,r2
	mov r5,r3
Lab	cmp r5,r4
	beq Store
	blo Addr5
	bhi Addr4
Addr5
	add r5,r3
	b Lab
Addr4
	add r4,r2
	b Lab
Store
	str r5,[r1]
src dcd 0x3,0x5
	AREA DATASEG,DATA,READWRITE
dst DCD 0
	END