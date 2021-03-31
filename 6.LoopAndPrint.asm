TITLE LoopAndPrint

;Program Desctiption: This program loops through commands a specified amount of time
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg db 'Loop! ','$'                      ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline

.CODE                                        ; Beginning of code segment
main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    MOV Cx,5                                 ; Set the value of Cx (determines the number of times a loop runs, 5 in this case)
    
    Messg:                                   ; Message Label
    ; Display msg
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!                                
    
    ; Prints loop number
    MOV AH,02h                               ; Prints number
    MOV Dl,Cl                                ; Moves value of Cl to Dl
    ADD Dl,30h                               ; Converts value to ASCII
    INT 21h                                  ; Does it!
    
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
                                             ; Jumps program to Messg label
    LOOP Messg 
       
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

