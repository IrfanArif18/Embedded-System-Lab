; Modul 3 & 4 Praktikum Sistem Benam
; Irfan Arif Maulana (1906379270)
; Teknik Elektro Universitas Indonesia 2021
; Rabu, 29 September 2021

.MODEL SMALL
.DATA
       
    TEXT1 db 'Masukkan input 2 angka: ', '$'
    TEXT2 db 13, 10, 'Ganjil', 13, 10, '$'
    TEXT3 db 13, 10, 'Genap', 13, 10, '$'

.CODE

    INPUT PROC NEAR
        MOV DX, offset TEXT1
        MOV AH, 09H
        INT 21H
        
        MOV AH, 01H
        INT 21H
        MOV BH, AL
        
        MOV AH, 01H
        INT 21H
        MOV BL, AL
        
        AND AH, 00H
         
        RET
    INPUT ENDP
    
        
    OUTPUT MACRO REM
        CMP REM, 00H
        JE EVEN
        
        ODD:
        MOV DX, offset TEXT2
        MOV AH, 09H
        INT 21H
        JMP RUN
        
        EVEN:
        MOV DX, offset TEXT3
        MOV AH, 09H
        INT 21H
    ENDM

.STARTUP
    
    RUN:
        CALL INPUT
        
        MOV DL, 02H
        DIV DL
        
        ADD BL, BH
        CMP BL, 60H
        JE STOP
        
        OUTPUT AH
         
        JMP RUN
    STOP:
        MOV AH, 4CH
        INT 21H
    
.EXIT
END
