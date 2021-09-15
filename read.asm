COD SEGMENT PARA PUBLIC 'CODE'
PUBLIC READ
ASSUME CS:COD
READ PROC FAR

	XOR AX, AX
    MOV SI, 0
	READ_STRING1:
        MOV AH,01h      ;Instruction to read one character from keyboard
		INT 21h
			
		CMP AL, 30h     ;verify if the char is < '0'
			JL NOT_NO
		CMP AL, 39h     ;verify if the char is > '9'
			JG NOT_NO
           
		SUB AL, 30h     ;Transform from ascii to hex
        MOV SIR1[SI], AL
	    INC SI
    NOT_NO:
        CMP AL, 0Dh     ;Check if it is not break (0D)
        JNE READ_STRING1
        
		MOV N, SI
		
RETF
READ ENDP
COD ENDS
END READ