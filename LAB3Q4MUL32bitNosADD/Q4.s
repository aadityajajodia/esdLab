	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10000000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=SRC
	LDR R1,=SRC+0X4
	LDR R2,=DST
	LDR R3,[R0]
	LDR R4,[R1]
LAB	ADDS R5,R5,R3
	ADC R6,#0
	SUB R4,#0X1
	SUB R4,#0
	TEQ R4,#0
	BNE LAB
	STR R5,[R2],#0X4
	STR R6,[R2]	
STOP B STOP
SRC DCD 0X4,0X4
	AREA mydata,DATA, READWRITE
DST DCD 0
	END
	