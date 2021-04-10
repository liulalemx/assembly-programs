TITLE DisplayInReverse 

;Program Desctiption: This program receives a four digit number and returns the number reversed
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Enter a 4-digit number: $"       ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline
    reversedMsg db "The number reversed:- $" ; Reversed message           
    
.CODE                                        ; Beginning of code segment

;main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Read number 
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    PUSH Ax                                  ; Pushes value to stack
    
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    PUSH Ax                                  ; Pushes value to stack
    
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    PUSH Ax                                  ; Pushes value to stack
    
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    PUSH Ax                                  ; Pushes value to stack
           
    ; Check if ENTER is pressed
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    
    CMP Al,13                                ; Compare the input in the Accumilator registor to the ASCII value of the ENTER key (13)
    JE Enter                                 ; Jumps to 'Enter' label if the CMP is equal
    JMP Exit                                 ; Jumps to 'Exit' label otherwise
       
    ; Enter Pressed
    Enter: 
       
    ; Print reversed number
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
    
    ; Print reversed message
    LEA Dx,reversedMsg                       ; Loading the effective address of our message to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Print value
    POP Dx                                   ; Pops value from stack 
    MOV Ah,02                                ; Prints it 
    INT 21h
    
    POP Dx                                   ; Pops value from stack
    MOV Ah,02                                ; Prints it
    INT 21h
    
    POP Dx                                   ; Pops value from stack
    MOV Ah,02                                ; Prints it
    INT 21h
    
    POP Dx                                   ; Pops value from stack
    MOV Ah,02                                ; Prints it
    INT 21h
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!

;main ENDP
END main    

