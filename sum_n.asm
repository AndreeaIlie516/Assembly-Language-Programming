COD1 SEGMENT PARA PUBLIC 'CODE'
PUBLIC SUM
ASSUME CS:COD1
SUM PROC NEAR
MOV SI,0
SUM_LOOP:
ADD AX,[BX+SI]
ADD SI,2
LOOP SUM_LOOP
RET
SUM ENDP
COD1 ENDS
END SUM