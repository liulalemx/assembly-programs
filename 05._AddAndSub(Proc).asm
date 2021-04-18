TITLE AddAndSub

;Program Desctiption: This program addition and subtraction operations on two single digit numbers and returns their result 
;Author: Liul Alemayehu

include 'emu8086.inc'

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg1 db 'Enter the first number: ',0     ; Declare variable msg1 and assigned it a value   
    msg2 db 'Enter the second number: ',0    ; Declare variable msg2 
    msg3 db 'The Sum is: ',0                 ; Declare variable msg3 
    msg4 db 'The Difference is: ',0          ; Declare variable msg4 
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
    
    ; Prompt2
    LEA Si,msg2                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ; Read second number
    CALL SCAN_NUM                            ; Calls the SCAN_NUM procedure and reads a multi-digit number from the keyboard
    MOV Di,Cx                                ; Saves character in Di 
        
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
 
    ; :::::::::::::::: ADDITION :::::::::::::::
    ; Prompt3
    LEA Si,msg3                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ;Compute Sum
    ADD Bx,Di                                ; Adds the values in Bx and Di   
    
    ;Transfer Result to Ax
    XOR Ax,Ax                                ; Clears the value of Ax register (Ax=00)
    MOV Ax,Bx                                ; Moves the sum to Ax
               
    ; Print Result                                                                            
    CALL PRINT_NUM                           ; Prints number stored in Ax
       
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
    ; :::::::::::::::: SUBTRACTION :::::::::::::::
    ; Prompt4
    LEA Si,msg4                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    ;Compute Difference
    SUB Bx,Di                                ; Sets the value of Bx to its original value since it had been changed to Bx = Bx + Di (line 56)
    SUB Bx,Di                                ; Subtracts the values in Bx and Di 
    
    ;Transfer Result to Ax
    XOR Ax,Ax                                ; Clears the value of Ax register (Ax=00)
    MOV Ax,Bx                                ; Moves the difference to Al
           
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