; 26개의 대문자 알파벳 출력

title Display

dosseg
.model small
.stack 100h
.code
main proc
	mov	cx,26
	mov	dl,65
	mov	ah,2

A1:	int	21h
	inc	dl
	loop	A1

	mov ax, 4C00h
	int	21h
main endp
end main