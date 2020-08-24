MAIN   SEGMENT
   ASSUME   CS:MAIN, DS:MAIN ;같은 세그먼트에 사용하겠다.

    MOV   AX, CS
      MOV   DS, AX       ; 진짜 세그먼트 자리 정해주는 부분

   MOV    AH, 1
   INT   21H
   MOV    A1, AL
   MOV    AH, 1
   INT   21H
   MOV    A2, AL

   MOV    AH, 1
   INT   21H
   MOV    B1, AL
   MOV    AH, 1
   INT   21H
   MOV    B2, AL

   MOV    AH, 1
   INT   21H
   MOV    C1, AL
   MOV    AH, 1
   INT   21H
   MOV   C2, AL

   MOV   AL, A1    
   CMP   AL, B1   ; 2VS3
   JAE   L1
   MOV   AL, B1   ; AL = 3
   
L1:   CMP   AL, C1   ; 3VS4
   JAE   L2
   MOV   AL, C1   ; AL = 4
   
L2:   MOV   LA1, AL
   JMP   PRINT


PRINT:   MOV   DL, LA1
   MOV   AH, 2   
   INT   21H

   MOV   DL, LA2
   MOV   AH, 2   
   INT   21H
   
   MOV   DL, LA3
   MOV   AH, 2   
   INT   21H

   MOV   DL, LA4
   MOV   AH, 2   
   INT   21H

EXIT:   MOV   AH, 4CH
   INT   21H

A1   DB   ?
A2   DB   ?
B1   DB   ?
B2   DB   ?
C1   DB   ?
C2   DB   ?
       
LA1   DB   ?
LA2   DB   ?
LA3   DB   ?
LA4   DB   ?   

MAIN      ENDS          ; 세그먼트가 끝나는 지점이다
      END   