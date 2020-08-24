; 두자리 수 3개를 입력받아 가장 큰 수 출력

MAIN	SEGMENT
	ASSUME	CS:MAIN, DS:MAIN

	MOV	AX, CS
	MOV	DS, AX



	MOV	CX, 3		; 3개의 두자리 숫자를 입력받기 위해 3번 반복 
INPUT:
	MOV	AH, 1
	INT	21H		; 10의 자리 입력

	MOV	DH, AL		; 10의 자리의 해당하는 입력값의 아스키코드를 DH에 저장

	MOV	AH, 1
	INT	21H		; 1의 자리 입력

	MOV	DL, AL		; 1의 자리에 해당하는 입력값의 아스키코드 숫자를 DL에 저장

	PUSH	DX		; DX(DH + DL)를 STACK에 저장

	LOOP	INPUT		; 이렇게 총 3번 입력받음


	

	POP	AX
	POP	BX		; 비교할 두개의 값을 STACK에서 가져옴
				; 앞으로는 가장 큰 값을 BX로 둘 것임

	CMP	BX, AX
	JAE	CHECK1		; BX가 크거나 같으면, CHECK1에 가서 새로운 값과 비교
	JMP	CHECK2		; AX가 더 크면, CHECK2에 가서 새로운 값과 비교

CHECK1:
	POP	AX		; 새로 비교할 값을 AX에 저장

	CMP	BX, AX
	JAE	BIGB		; BX가 가장 큼
	JMP	BIGA		; AX가 가장 큼

CHECK2:
	MOV	BX, AX		; 가장 큰 값을 BX로 두고
	POP	AX		; 새로 비교할 값을 AX에 저장

	CMP	BX, AX
	JAE	BIGB		; BX가 가장 큼
	JMP	BIGA		; AX가 가 가장 큼
	
BIGA:
	MOV	BX, AX		; AX가 가장 크므로 AX를 BX로 옮김

BIGB:
	MOV	DL, BH
	MOV	AH, 2
	INT	21H		; 10의 자리 출력
	
	MOV	DL, BL
	MOV	AH, 2
	INT	21H		; 1의 자리 출력


	MOV	AH, 4CH
	INT	21H		; 프로그램 종료

MAIN	ENDS
	END
