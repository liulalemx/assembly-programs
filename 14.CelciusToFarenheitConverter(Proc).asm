TITLE CelciusToFarenheitConverter 

;Program Desctiption: This program takes the a temperature valur in Celcius and converts it to Farenheit 
;Author: Liul Alemayehu

include 'emu8086.inc'

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg1 db 'Enter the Celcius value: ',0    ; Declare variable msg1 and assigned it a value   
    msg2 db 'The Value in Farenheit is: ',0  ; Declare variable msg2 
    newline db 13,10,'$'                     ; Creates newline

.CODE                                        ; Beginning of code segment
main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt1
    LEA Si,msg1                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ; Read first number
    CALL SCAN_NUM                            ; Calls the SCAN_NUM procedure and reads a multi-digit number from the keyboard
    MOV Bx,Cx                                ; Saves number in Bx 
    
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
        
    ; :::::::::::::::: Calculaton :::::::::::::::
    ; Prompt2
    LEA Si,msg2                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ; Convert to farenheit 
    MOV Ax,2                                 ; Set the value of Ax (Ax=Ax*Bx)
    MUL Bx                                   ; Converts the Celcius value in Farenheit by formula (�C * 9/5) + 32 = �F) 
    ADD Ax,32
                       
    ; Print Result                                                                           
    CALL PRINT_NUM                           ; Prints number stored in Ax
                               
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM
DEFINE_PRINT_STRING

END main    