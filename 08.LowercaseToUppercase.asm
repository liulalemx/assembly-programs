TITLE Case-Converter 

;Program Desctiption: This program takes a Lowecase letter and converts it to Uppercase 
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg1 db 'Enter the letter: ','$'         ; Declare variable msg1 and assigned it a value ($ used to indicate end of string)  
    msg2 db 'Uppercase Value: ','$'          ; Declare variable msg2 
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
    
    ; Read letter
    MOV AH,01h                               ; Reads an input letter to the Accumilator register (high)
    INT 21h                                  ; Does it! (reads charachter into Al)
        
    MOV Bl,AL                                ; Save character in Bl while we display a Return and Linefeed
    AND Bl,11011111b                         ; Converts to Uppercase
     
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
    ; Prompt2
    LEA Dx,msg2                              ; Loading the effective address of our msg1 to the Data register (Dx)
    MOV Ah,09                                ; Print from data
    INT 21h                                  ; Does it!
                             
    ; Print Result                                                                           
    MOV AH,02h                               ; Prints Character
    MOV Dl,Bl                                ; Access input value from [MOV AH,01] through B1 and move to Dl
    INT 21h                                  ; Does it  
                         
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

        ;