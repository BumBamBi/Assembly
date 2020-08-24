; STACK이용해서 역순 출력하기

TITLE	OUTPUT_STACK

DOSSEG
.MODEL	SMALL
.STACK	100H

.CODE
MAIN	PROC

	MOV	CX, 10		; 10회 반복
L1:
	MOV	AH, 1
	INT	21H		; Echo가 있는 입력

	PUSH	AX		; 입력 받은 AX를 stack에 push

	LOOP	L1		; L1으로 돌아가서 10회 반복

	
	MOV	DX, 10
	MOV	AH, 2
	INT	21H		; 보기 편하게 줄바꿈 출력


	MOV	CX, 10		; 10회 반복
L2:
	POP	DX		; DX로 stack에 있는 값을 pop함

	MOV	AH, 2		; DX에 있는 값을 출력
	INT	21H

	LOOP	L2		; L2로 돌아가서 10회 반복

	MOV	AH, 4CH
	INT	21H		; 종료

MAIN	ENDP
	END	MAIN