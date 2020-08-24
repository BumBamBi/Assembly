; ADD 해보기(출력X)

CODE SEGMENT
	ASSUME CS:CODE	;CS의 이름이 CODE임

	MOV	AH, 12H	;AH에 12H 대입
	MOV	AL, 34H	;AL에 34H 대입  따라서 AX는 1234H
	ADD	AH, AL	;AH+=AL해라

	MOV	AH, 4CH	;
	INT	21H	; 인터럽트 (Interrupt = system call = trap)

CODE ENDS

END