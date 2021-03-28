TITLE PersonalizedGreeting

;Program Desctiption: This program responds with a personalized greeting after it accepts a name
;Author: Liul Alemayehu
;Creation Date: 3/28/2021

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Hello! Please enter your name:$" ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline
    greeting db "Wellcome!$"                 ; Greeting message    
    name db 80 DUP('$')
    
.CODE                                        ; Beginning of code segment

main PROC                                    
    ; Prompt
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    MOV Ah,09h                               ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Read Message
    MOV AH,0AH                               ; Reads an input String to the Accumilator register (high)
    MOV Cx,10                                ; Set the maximum number of input characters
    LEA Dx,name                              ; Loading the effective address of our input to the Data register (Dx)
    INT 21h                                  ; Does it!
    
    ; Check if ENTER is pressed
    CMP Al,13                                ; Compare the input in the Accumilator registor to the ASCII value of the ENTER key (13)
    JE EXIT                                  ; Jumps to 'Exit' label if the CMP is equal
 
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
    
    ; Print Greeting                                                                           
    MOV AH,09h                               ; Prints Character
;    LEA Dx,name+2
    MOV Dl,Al                                ; Access input value from [MOV AH,01] through A1 and move to Dl
    INT 21H                                  ; Does it!
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

