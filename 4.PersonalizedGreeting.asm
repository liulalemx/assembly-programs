TITLE PersonalizedGreeting

;Program Desctiption: This program responds with a personalized greeting after it accepts a name
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Hello! Enter your name: $"       ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline
    greeting db "Wellcome! $"                ; Greeting message    
    namee db 80 DUP('$')                     ; Variable that accepts the users name
    
.CODE                                        ; Beginning of code segment

main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    MOV Bl,0                                 ; Set value of base register to zero (used to keep track of the Si)
    MOV Si, OFFSET namee                     ; Set the stack index value to the address of the name variable
    
    
    ; Read Message
    L1:
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
        
    ; Check if ENTER is pressed
    CMP Al,13                                ; Compare the input in the Accumilator registor to the ASCII value of the ENTER key (13)
    JE Enter                                 ; Jumps to 'Enter' label if the CMP is equal
    
    ;CMP Bl,90
    ;JE Enter
    
    MOV [Si],Al                              ; Moves the character stored in Al to Si location
    INC Si                                   ; Increases the stack index
    INC Bl                                   ; Increases the Bl (used to keep track of the SI)
    JMP L1                                   ; Jumps to 'L1' label (loops the entry process,wont stop unless enter is pressed)
    
    ; Enter Pressed
    Enter: 
    SUB Si,Bx                                ; Once 'Enter' is pressed, this resets the position of Si to initial position
        
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
        
    ; Print Greeting
    LEA Dx,greeting                          ; Loading the effective address of our greeting to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Print Name                                                                             
    Display: 
    MOV AH,09h                               ; Prints Character
    LEA Dx,Si                                ; Loads the value stored in memory location pointed to by the Si to Dx
    INT 21H                                  ; Does it!   
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

