TITLE EvenZeroFifty

;Program Desctiption: This program displays even numbers between Zero and Fifty 
;Author: Liul Alemayehu

include 'emu8086.inc'

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg1 db 'Hi,Even numbers(0-50): ',0      ; Declare variable msg1 and assigned it a value   
    newline db 13,10,'$'                     ; Creates newline

.CODE                                        ; Beginning of code segment
main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt1
    LEA Si,msg1                              ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Calling the PRINT_STRING procedure  
        
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
                                              
    MOV Bx,00                                ; Store the value of Zero in the Bx register
    MOV Cx,50                                ; Store the value of Fifty in the Cx register 
    
    L1:
    CMP Bx,Cx                                ; Compares the numbers 
    JLE L2                                   ; Jumps to lable 'L2' if conditions met
    JMP Exit                                 ; Jumps to exit
    
    L2:
    JMP Print                                ; Jumps to 'Print' label
                   
    ; Print Result                                                                            
    Print:
    MOV Ax,Bx                                ; Moves current value to Ax
    CALL PRINT_NUM                           ; Prints number stored in Ax
    PRINT ' '                                ; Prints an empty space
    ADD Bx,02                                ; Increments the current value by 2
    JMP L1                                   ; Jumps back to 'L1' label
          
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
    
main ENDP

DEFINE_SCAN_NUM
DEFINE_PRINT_NUM_UNS
DEFINE_PRINT_NUM
DEFINE_PRINT_STRING

END main    