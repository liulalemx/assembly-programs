TITLE FactorialOfNumber 

;Program Desctiption: This program receives a number and displays its factorial
;Author: Liul Alemayehu
;!IMPORTANT! If the factorial of the number exceeds 9, the hexadecimal value of the factorial will be found at the Bl register (Printed value will be wrong) 

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Enter a number: $"               ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline
    factorialMsg db "The factorial is:- $"   ; Factorial message           
    
.CODE                                        ; Beginning of code segment

;main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    MOV Cl,01                                ; Used to loop the main code (Cl=1)
    MOV Bl,01                                ; Stores the factorial of the number (initially 1,Dh=1)
   
    ; Read number 
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    SUB Al,48                                ; Changes from ASCII to decimal
    MOV Ch,Al                                ; Stores value of number in Ch
               
    ; Check if ENTER is pressed
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    
    CMP Al,13                                ; Compare the input in the Accumilator registor to the ASCII value of the ENTER key (13)
    JE Enter                                 ; Jumps to 'Enter' label if the CMP is equal
    JMP Exit                                 ; Jumps to 'Exit' label otherwise
       
    ; Enter Pressed
    Enter: 
       
    ; Print factorial number
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
    
    ; Print factorial message
    LEA Dx,factorialMsg                      ; Loading the effective address of our message to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    L1:
    CMP Ch,Cl                                ; IF Ch(number) >= Cl(01)
    JGE L2                                   ; Goto L2
    JMP Print                                ; Goto Print

    L2: 
    MOV Al,Ch                                ; Move Ch(number) to Al
    MUL Bl                                   ; Multiply Bl(factorial) by Al(number)
    MOV Bl,Al                                ; Update factorial

    DEC Ch                                   ; Decrease number
    JMP L1                                   ; Goto L1
       
    ; Print value
    Print: 
    MOV Bh,Bl                                ; Move factorial value from Bl to Bh
    ADD Bh,48                                ; Changes to decimal
    MOV Ah,02                                ; Print
    MOV Dl,Bh                                ; Moves the decimal value to Dl
    INT 21h                                  ; Does it!
    
    
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!

;main ENDP
END main    

