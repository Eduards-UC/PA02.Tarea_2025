; ----------------------------------------
; Ejercicio 1: IF (x >= y)
; Si x >= y entonces:
;     x = x + 2
;     y = y + 2
; Sino:
;     x = x - 2
;     y = y - 2
; ----------------------------------------

.MODEL SMALL
.STACK 100H
.DATA
x DB 5
y DB 3
.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    MOV AL, x
    MOV BL, y
    CMP AL, BL         ; Compara x y y
    JL ELSE_PART       ; Si x < y → saltar a ELSE

; THEN:
    ADD AL, 2
    MOV x, AL
    MOV AL, y
    ADD AL, 2
    MOV y, AL
    JMP END_IF

ELSE_PART:
    MOV AL, x
    SUB AL, 2
    MOV x, AL
    MOV AL, y
    SUB AL, 2
    MOV y, AL

END_IF:
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

