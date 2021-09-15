DATA SEGMENT PARA PUBLIC 'DATA' 
DATA ENDS

SQUARE MACRO x, dim, col
LOCAL l1, l2
	MOV DX, x
	l1:
		MOV CX, x
		l2:
			MOV AH, 0CH
			MOV AL, col
			INT 10H
			INC CX
			CMP CX, dim
			JLE l2
		INC DX
		CMP DX, dim
		JLE l1
ENDM 

CODE SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE, ES:DATA
START PROC FAR

	PUSH DS
	XOR AX,AX
	PUSH AX
	MOV AX,DATA
	MOV DS,AX

	MOV AH, 0FH
	INT 10H

	PUSH AX
	PUSH BX
 
	MOV AH, 00H
	MOV AL, 12H
	INT 10H
	
	SQUARE 30, 100, 1
	SQUARE 70, 140, 5
	SQUARE 110, 180, 7
	POP AX
	MOV AH, 00H
	POP BX
	MOV AH, 4CH
	INT 21H

START ENDP
CODE ENDS
END START