TITLE FactorialOfNumber 

;Program Desctiption: This program receives a number and displays its factorial (16bit)
;Author: Liul Alemayehu

include 'emu8086.inc'

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Enter a number: ",0              ; Declare variable msg and assigned it a value
    newline db 13,10,'$'                     ; Creates newline
    factorialMsg db "The factorial is:- ",0  ; Factorial message           
    
.CODE                                        ; Beginning of code segment

main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt
    LEA Si,msg                               ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    MOV Di,01                                ; Used to loop the main code (Di=1)
    MOV Bx,01                                ; Stores the factorial of the number (initially 1,Bx=1)
   
    ; Read number 
    CALL SCAN_NUM                            ; Calls the SCAN_NUM procedure and reads a multi-digit number from the keyboard
                                 
    ; Enter Pressed
    Enter: 
       
    ; Print factorial number
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
    
    ; Print factorial message
    LEA Si,factorialMsg                      ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure
    
    L1:
    CMP Cx,Di                                ; IF Cx(number) >= Di(01)
    JGE L2                                   ; Goto L2
    JMP Print                                ; Goto Print

    L2: 
    MOV Ax,Cx                                ; Move Cx(number) to Ax
    MUL Bx                                   ; Multiply Bx(factorial) by Ax(number)
    MOV Bx,Ax                                ; Update factorial

    DEC Cx                                   ; Decrease number
    JMP L1                                   ; Goto L1
       
    ; Print value
    Print: 
    MOV Ax,Bx                                ; Move factorial value to Ax
    CALL PRINT_NUM                           ; Call the PRINT_NUM procedure        
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!

main ENDP  

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM
DEFINE_PRINT_STRING

END main    

