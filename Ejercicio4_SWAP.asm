; ----------------------------------------
; Ejercicio 4: While (a > 10)
; a = a - 1
; b = b + 2
; Luego:
; if (a < b) swap(a,b)
; else b = a - 1
; ----------------------------------------

.MODEL SMALL
.STACK 100H
.DATA
a DB 13
b DB 16
temp DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

WHILE_LOOP:
    MOV AL, a
    CMP AL, 10
    JLE END_WHILE

    DEC AL
    MOV a, AL
    MOV AL, b
    ADD AL, 2
    MOV b, AL
    JMP WHILE_LOOP

END_WHILE:
    MOV AL, a
    CMP AL, b
    JGE ELSE_PART      ; Si a >= b, ir a ELSE

; THEN: swap(a,b)
    MOV AL, a
    MOV temp, AL
    MOV AL, b
    MOV a, AL
    MOV AL, temp
    MOV b, AL
    JMP END_IF

ELSE_PART:
    MOV AL, a
    DEC AL
    MOV b, AL

END_IF:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

