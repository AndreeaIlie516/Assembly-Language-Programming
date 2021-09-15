DATA SEGMENT PARA PUBLIC 'DATA'
   SIR DW 1,2,3,4
   LGSIR DB ($-SIR)/2
   SUM DD 0 
DATA ENDS

CODE SEGMENT PARA PUBLIC 'CODE'
ASSUME CS:CODE, DS:DATA
START PROC FAR
PUSH DS
XOR AX,AX
PUSH AX
MOV AX,DATA
MOV DS,AX 

	
	MOV CH,0
	MOV CL,LGSIR 	; in CX is the length's row
	MOV AX,0	; the initialization of the register where the sum is
			; calculated
	MOV SI,0
	MOV BX,0
	
NEXT: 
	ADD AX,SIR[SI] 	; the add of the current element
	ADC BX,0
	ADD SI, 2
	LOOP NEXT 	; CX decrementing and jump to next
		 	; element if CX differs from 0
	MOV WORD PTR SUM[0],AX 
	MOV WORD PTR SUM[2],BX
	
	RET	
START ENDP
CODE ENDS
END START