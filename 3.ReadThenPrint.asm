TITLE ReadThenPrint

;Program Desctiption: This program reads input from keyboard and prints it on the screen. It stops execution when ENTER key is pressed
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg db 'Hi! Please enter a word: ','$'   ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline

.CODE                                        ; Beginning of code segment
main PROC                                    
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    MOV AH,01h                               ; Reads an input char to the Accumilator register (high)
    INT 21h                                  ; Does it! (reads charachter into Al)

    MOV Bl,Al                                ; Save character in Bl while we display a Return and Linefeed
        
    CMP Al,13                                ; Compare the input in the Accumilator registor to the ASCII value of the ENTER key (13)
    JE EXIT                                  ; Jumps to 'Exit' label if the CMP is equal

    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
                                                                               
    MOV AH,02                                ; Prints Character
    MOV Dl,Bl                                ; Access input value from [MOV AH,01] through B1 and move to Dl
    INT 21h                                  ; Does it!
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

