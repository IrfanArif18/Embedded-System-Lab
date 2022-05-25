; Irfan Arif Maulana 1906379270    
; Teknik Elektro Fakultas Teknik
; Universitas Indonesia 2021
; Post-Test Modul 2 Praktikum Sistem Benam
; Jumat, 17 September 2021

.model small

.data

    NAMA db 'irfan', '$'

.code

.startup
     
    mov BX, offset NAMA
    
    ; immediate addressing
    mov SI, 0H
    mov CL, 4H
    
    GET:
        mov AX, [BX]        ; indirect addressing
        mov [1234H+SI], AX  ; direct addressing
        INC SI
        INC BL
    
    loop GET
    
    mov BX, offset [1234H]
    
    ; immediate addressing
    mov CL, 5H
    
    UP:
        mov AX, [BX]        ; indirect addressing        
        sub AX, 20H         ; convert lowercase to uppercase        
        mov [BX], AL        ; indirect addressing        
        inc BL
    
    loop UP

.exit

END 