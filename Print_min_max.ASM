; 가장 큰수, 작은수 출력(CX번 loop)

MAIN	SEGMENT
	ASSUME	CS:MAIN, DS:MAIN

	MOV	AX, CS
	MOV	DS, AX

	MOV	DI, OFFSET ARR
	MOV	AX, [DI]		; AX = 15
	
	MOV	LARGEST, AX
	MOV	SMALLEST, AX
	
	MOV	CX, 6

A1:	MOV	AX, [DI]
	CMP	AX, SMALLEST	
	JAE	A2
	MOV	SMALLEST, AX	; 새로 비교할 AX가 더 작으면 SMALLEST를 AX로 변경

A2:	CMP	AX, LARGEST
	JBE	A3
	MOV	LARGEST, AX

A3:	ADD	DI, 2		; WORD단위니까 2를 증가
	LOOP	A1

	MOV	DX, LARGEST
	ADD	DX, '0'
	MOV	AH, 2
	INT	21H

	MOV	DX, SMALLEST
	ADD	DX, '0'
	MOV	AH, 2
	INT	21H

	MOV	AH, 4CH
	INT	21H		; 종료

ARR	DW	3, 2, 9, 5, 7, 4	; 아스키는 0~9 까지라 그 범위 내로 설정
LARGEST	DW	?
SMALLEST	DW	?

MAIN	ENDS
	END