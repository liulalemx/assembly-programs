TITLE AverageOfThreeNumbers

;Program Desctiption: This program displays the average of three numbers 
;Author: Liul Alemayehu

include 'emu8086.inc'

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg1 db 'Enter the first number:  ',0    ; Declare variable msg1 and assigned it a value   
    msg2 db 'Enter the second number: ',0    ; Declare variable msg2    
    msg3 db 'Enter the third number:  ',0    ; Declare variable msg3 
    msg4 db 'The Average is: ',0             ; Declare variable msg4 
    newline db 13,10,'$'                     ; Creates newline
    num1 dw ?                                ; Creates variable num1
    num2 dw ?                                ; Creates variable num2
    num3 dw ?                                ; Creates variable num3
    
.CODE                                        ; Beginning of code segment
main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    MOV Di,03                                ; Moving 3 to Di(Divisor)
    
    ; Prompt1
    LEA Si,msg1                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ; Read first number
    CALL SCAN_NUM                            ; Calls the SCAN_NUM procedure and reads a multi-digit number from the keyboard
    MOV num1,Cx                              ; Saves number in num1 
        
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
    ; Prompt2
    LEA Si,msg2                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ; Read second number
    CALL SCAN_NUM                            ; Calls the SCAN_NUM procedure and reads a multi-digit number from the keyboard
    MOV num2,Cx                              ; Saves number in num2 
        
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
    ; Prompt3
    LEA Si,msg3                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ; Read third number
    CALL SCAN_NUM                            ; Calls the SCAN_NUM procedure and reads a multi-digit number from the keyboard
    MOV num3,Cx                              ; Saves number in num3 
    
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
    ; :::::::::::::::: Calculation :::::::::::::::
    ; Prompt4
    LEA Si,msg4                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ;Compute Sum
    MOV Bx,num1                              ; Move value of num1 to Bx register(Since addition of two memory locations isn't allowed)
    ADD Bx,num2                              ; Adds the values in Bx and num2   
    ADD num3,Bx                              ; Adds the values in Bx and num3
    
    ;Divide sum
    XOR Ax,Ax                                ; Clears the value of Ax register (Ax=00)
    MOV Ax,num3                              ; Moves the sum to Ax
    MOV Dx,00                                ; Moves 00 to Dx (since dividend is Dx:Ax => 00:num3)
    DIV Di                                   ; Divide 
               
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