DATA SEGMENT PARA PUBLIC 'DATA'
   STRING DB 'string'
   LEN DB $-STRING
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
START PROC FAR
ASSUME CS:CODE, DS:DATA
PUSH DS
XOR AX,AX
PUSH AX
MOV AX,DATA
MOV DS, AX

	MOV SI, 0
	MOV CL, LEN
	L: SUB STRING[SI], 20H	
	INC SI			
	LOOP L

RET
START ENDP
CODE ENDS
END START