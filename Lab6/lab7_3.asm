DATA SEGMENT PARA PUBLIC 'DATA'
   ARR DB 2,4,6,8,15
   ARRLEN DB $-ARR
   MSG DB "The average is: "
   MSGLEN DW $-MSG
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
START PROC FAR
ASSUME CS:CODE, DS:DATA
PUSH DS
XOR AX,AX
PUSH AX
MOV AX, DATA
MOV DS, AX

	MOV AX, 0
	MOV SI, 0
	MOV CL, ARRLEN

	L:
	ADD AL, ARR[SI]		
	INC SI
	LOOP L

	DIV ARRLEN		
	MOV AH, 0
	MOV BL, 10		
	DIV BL

	MOV SI, MSGLEN		
	MOV MSG[SI], AL
	ADD MSG[SI], '0'
	MOV MSG[SI+1], AH
	ADD MSG[SI+1], '0'
	MOV MSG[SI+2], '$'
	
	LEA DX, MSG
	MOV AH, 09H
	INT 21H
	
RET 
START ENDP
CODE ENDS
END START