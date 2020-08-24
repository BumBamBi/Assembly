; 두자리 수 세개를 차례로 입력받아서, 큰 수 2개의 합을 출력

MAIN	SEGMENT
	ASSUME	CS:MAIN, DS:MAIN

	MOV	AX, CS
	MOV	DS, AX


	MOV	CX, 3		; 3개의 두자리 숫자를 입력받기 위해 3번 반복 
INPUT:
	MOV	AH, 1
	INT	21H		; 10의 자리 입력

	ADD	AL, -48
	MOV	DH, AL		; 10의 자리의 해당하는 입력값을 DH에 저장

	MOV	AH, 1
	INT	21H		; 1의 자리 입력

	ADD	AL, -48
	MOV	DL, AL		; 1의 자리에 해당하는 입력값을 DL에 저장

	PUSH	DX		; DX(DH + DL)를 STACK에 저장

	LOOP	INPUT		; 이렇게 총 3번 입력받음



	MOV	DX, 10
	MOV	AH, 2
	INT	21H		; 결과값을 보기 편하게  줄바꿈 출력




	POP	AX
	POP	BX		; 비교할 두개의 숫자를 가져옴

	CMP	AX, BX
	JAE	BigA		; AX가 더 크면 CHECK에서 BX와 새 숫자 비교
	
	MOV	DX, AX
	MOV	AX, BX
	MOV	BX, DX		; BX가 더 크면 AX와 BX를 바꿔줘서, AX가 더 크도록 함 

BigA:
	MOV	DX, AX		; AX를 잠시 DX에 저장
	POP	AX		; AX에 새로운 값
	PUSH	DX		; 기존의 AX는 스택에 저장

	CMP	AX, BX		; BX와 AX(새로운 값) 비교
	JAE	FINDsmallest	; BX가 가장 작은값이면 FINDsmallest로 가서, 현재 BX를 제외한 두 숫자의 합을 구함

	; 만약 AX가 가장 작다면, BX와 AX를 바꿔줘서, BX가 가장 작도록 함

	MOV	DX, AX
	MOV	AX, BX
	MOV	BX, DX		; AX와 BX를 바꿔줌으로써, BX가 가장 작은 수임

FINDsmallest:
	POP	BX		; BX에 기존 AX값 저장
	
	ADD	BL, 246		; BL에 CARRY를 위한 246을 더해줌(246 + 10 = 256 = 1CARRY, 0)
	ADD	BH, 246		; BH에 CARRY를 위한 246을 더해줌(246 + 10 = 256 = 1CARRY, 0)
	
	ADD	BL, AL		; 1의 자리 더하고
	ADC	BH, AH		; 10의 자리 더하여 구함

	CMP	BH, 10		; 10의 자리 CARRY 유무 확인
	JAE	NOHUNDC	; CARRY가 없었으면 100의 자리 출력 안함
	
	MOV	DL, 49
	MOV	AH, 2
	INT	21H		; 100의 자리(1) 출력
	JMP	TEN		; 10의 자리 출력하러 TEN으로 JUMP

NOHUNDC:
	ADD	BH, -246		; 100D의 자리 CARRY가 없었으면 BH에 246을 빼서 원래값으로 변경

TEN:
	MOV	DL, BH
	ADD	DL, 48		; 현재의 이진숫자를 아스키코드로 표현하기 위해 48('0')을 더함
	MOV	AH, 2
	INT	21H		; 10의 자리 출력

	CMP	BL, 10		; 1의 자리 CARRY 유무 확인
	JB	ONE		; CARRY가 있었으면 그냥 출력
	
	ADD	BL, -246		; CARRY가 없었으면 BL에 246을 빼서 원래값으로 변경

ONE:
	MOV	DL, BL
	ADD	DL, 48		; 현재의 이진숫자를 아스키코드로 표현하기 위해 48('0')을 더함
	MOV	AH, 2
	INT	21H		; 1의 자리 출력

	MOV	AH, 4CH
	INT	21H		; 프로그램 종료

MAIN	ENDS
	END