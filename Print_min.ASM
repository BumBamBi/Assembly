; 가장 작은 수 출력 (loop사용 x)

MAIN	SEGMENT
	ASSUME	CS:MAIN, DS:MAIN

	MOV	AX, CS
	MOV	DS, AX

	MOV	SI, OFFSET VAL
	MOV	AL, [SI]		; AL = 7

	ADD	SI, 1		; [SI] = 3

	CMP	AL, [SI]		; 7, 3 비교
	JBE	L1
	MOV	AL, [SI]

L1:	CMP	AL,[SI+1]
	JBE	L2
	MOV	AL,[SI+1]

L2:	MOV	SMALL, AL
	MOV	DL, AL
	ADD	DL, '0'		; 아스키 코드로 숫자를 출력하기 위함

	MOV	AH, 2
	INT	21H
	
	MOV	AH, 4CH
	INT	21H

SMALL	DB	?
VAL	DB	7, 3, 4

MAIN	ENDS
	END
