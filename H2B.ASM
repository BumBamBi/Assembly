; 16진수를 2진수로 변환

title	Display

dosseg
.model	small
.stack	100h

.code
	main	proc
	MOV	AL, 6CH		; 6C = 0110 1100

	MOV	CX, 8		; 8회 반복
	
L1:	
	SHL	AL, 1		; AL을 왼쪽으로 1회 SHIFT하고, Carry flag ON
				; 맨앞에 있던 애는 CARRY bit처리해줌
	MOV	DL, '0'
	JNC	L2		; Not Carry면 L2 가서 DL(0) 출력
	MOV	DL, '1' 		; Carry면 DL=1
	

L2: 
	PUSH	AX		; AL이 소실될 수 있으므로, AX를 저장해둠

	MOV	AH, 2		; 출력을 위해 AH에 2를 넣었지만, AL이 소실될 수 있으므로, 이전에 push로 stack에 저장했었음
	INT	21H		; DL에 있는 값 출력(0 or 1)
	POP	AX		; Pop하여 저장한 data를 다시 AX로불러옴

	LOOP	L1		; L1을 CX만큼 반복 

	MOV	AX, 4C00H
	INT	21H		; 종료

main	endp
	end	main