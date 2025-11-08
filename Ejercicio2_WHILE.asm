; ----------------------------------------
; Ejercicio 2: WHILE (i <= n)
; Calcula una serie con sumas acumuladas
; ----------------------------------------

.MODEL SMALL
.STACK 100H
.DATA
n DB 5
fant DB 1
f DB 1
i DB 2
faux DB ?
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

WHILE_LOOP:
    MOV AL, i
    CMP AL, n
    JA END_WHILE       ; Si i > n → fin del bucle

    MOV AL, f
    MOV faux, AL
    ADD AL, fant
    MOV f, AL
    MOV AL, faux
    MOV fant, AL
    INC i
    JMP WHILE_LOOP

END_WHILE:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

