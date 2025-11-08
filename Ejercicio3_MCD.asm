; ----------------------------------------
; Ejercicio 3: MCD (Algoritmo de Euclides)
; ----------------------------------------

.MODEL SMALL
.STACK 100H
.DATA
a DB 15
b DB 5
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

WHILE_LOOP:
    MOV AL, a
    CMP AL, b
    JE END_WHILE       ; Si a = b, fin

    JA GREATER         ; Si a > b, resta a - b
    ; ELSE: b = b - a
    MOV AL, b
    SUB AL, a
    MOV b, AL
    JMP WHILE_LOOP

GREATER:
    MOV AL, a
    SUB AL, b
    MOV a, AL
    JMP WHILE_LOOP

END_WHILE:
    MOV AL, a          ; El MCD queda en a
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

