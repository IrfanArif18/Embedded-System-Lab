.model small

.data
                       
    DATA3 db 19H, 06H, 37H, 92H, 70H    ; 1906379270 

.code

.startup

    MOV AL, DATA3   ; Direct addressing mode
    
    MOV BX, offset DATA3+1
    MOV DX, [BX]    ; Indirect addressing mode
    
    ADD AL, DH
    ADD AL, DL
    
    AND BX, 0H      ; Clear BX
    MOV DX, 0H      ; Immediate addressing mode
    
    MOV BL, DATA3+3
    MOV DL, DATA3+4
    
    ADD BX, DX
    MOV DX, BX      ; Register addressing mode
    
    ADD AX, DX
    
    MOV [1234H], AX     

.exit

END