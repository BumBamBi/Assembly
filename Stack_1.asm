; 이미 입련된 값을 STACK이용해서 역순 출력하기

MAIN	SEGMENT
	ASSUME	CS:MAIN, DS:MAIN

	MOV	AX, CS
	MOV	DS, AX

	MOV	DI, OFFSET ARR
	MOV	AX, [DI]

	MOV	CX, 10		
L1:
	MOV	AX, [DI]

	MOV	DX, AX
	ADD	DX, '0'

	PUSH	DX	

	ADD	DI, 2		; WORD단위니까 2를 증가
	LOOP	L1

	MOV	CX, 10
L2:
	POP	DX
	MOV	AH, 2
	INT	21H
	LOOP	L2

	MOV	AH, 4CH
	INT	21H		; 종료

ARR	DW	0,1,2,3,4,5,6,7,8,9

MAIN	ENDS
	END