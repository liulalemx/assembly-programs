TITLE Kg-to-G Converter 

;Program Desctiption: This program takes the a value in Kilograms and converts it to grams 
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg1 db 'Enter the Kilogram value: ','$' ; Declare variable msg1 and assigned it a value ($ used to indicate end of string)  
    msg2 db 'The Value in Grams is: ','$'    ; Declare variable msg2 
    newline db 13,10,'$'                     ; Creates newline

.CODE                                        ; Beginning of code segment
main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt1
    LEA Dx,msg1                              ; Loading the effective address of our msg1 to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Read first number
    MOV AH,01h                               ; Reads an input number to the Accumilator register (high)
    INT 21h                                  ; Does it! (reads charachter into Al)
    MOV Bh,Al                                ; Save character in Bh while we display a Return and Linefeed
    SUB Bh,30h                               ; Changes value in Bh to decimal
    
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
     
    ; :::::::::::::::: Calculaton :::::::::::::::
    ; Prompt2
    LEA Dx,msg2
    MOV Ah,09
    INT 21h
    
    ; Convert to gram 
    MOV Al,2                                 ; Set the value of Al (A1=A1*Bh)
    MUL Bh                                   ; Converts the Kg value in Bh to G by multiplying with Al=1000 (1kg = 1000g) !(If product is greater than 9, wrong output)
    
                   
    ; Print Result                                                                           
    MOV AH,02h                               ; Prints Character
    MOV Dl,Al                                ; Move value from Al to Dl
    ADD Dl,30h                               ; Converts value to ASCII
    INT 21h                                  ; Does it  
                         
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

