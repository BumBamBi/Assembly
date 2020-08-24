; 100자리 이내의 알파벳을 입력받아 전부 대문자로 출력하기

MAIN	SEGMENT
	ASSUME	CS:MAIN, DS:MAIN

	MOV	AX, CS
	MOV	DS, AX

	MOV 	BX, OFFSET ARR	; ARR의 위치 주소를 BX에 저장

	MOV	CX, 100
L1:
	MOV	DL, [BX]

	CMP	DL, 'A'
	JB	NOLOOP		; 'A'보다 작은 아스키코드면 프로그램 끝

	CMP	DL, 'Z'
	JA	CHECK		; 'Z'보다 큰 아스키코드면 non알파벳 or 소문자 이므로 CHECK로 가서 확인

	JMP	NEXT		; 그 외에는 대문자 이므로 BIG으로 가서 출력

CHECK:

	CMP	DL, 'a'
	JB	NOLOOP		; 'a' 보다 작으면 non알파벳이므로 프로그램 끝

	CMP	DL, 'z'
	JA	NOLOOP		; 'z' 보다 크면 non알파벳이므로 프로그램 끝

	JMP	Change		; 그 외의 소문자라면 Change로 점프

Change:
	ADD	DL, -32		; 아스키코드로 32를 빼면 대문자가 됨
	MOV	[BX], DL		; 기존 소문자를 대문자로 바꾼 값으로 바꿔서 저장

NEXT:
	ADD	BX, 1		; 다음 문자 주소로 옮김(DB이므로 +1)

	MOV	AH, 2
	INT	21H		; 출력

	LOOP	L1		; 루프

NOLOOP:

	MOV	AH, 4CH
	INT	21H		; non알파벳이거나, 루프를 마치면 종료

ARR	DB	'ABCdefgHIJklmnOPqrsTUvWxyZ'

MAIN	ENDS
	END
