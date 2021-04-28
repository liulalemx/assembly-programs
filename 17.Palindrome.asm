TITLE Palindrome 

;Program Desctiption: This program receives a word and checks if it is a palindrome
;Author: Liul Alemayehu

include 'emu8086.inc'

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored      
arr DB 3 dup(?)                              ; Declare an array of size 3 to store the word

.CODE   
main PROC
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    MOV Si,0                   
                                             
    MOV Ah,01h                               ; Get a word
    INT 21h
    
    MOV Ah,0
    
    PUSH Ax                                  ; Push word to stack
    MOV arr[Si],Al                           ; Move word to arr[0]
    INC Si                                   ; Increase Si(0 => 1)
    
    MOV Ah,01h                               ; Get second word
    INT 21h
    
    MOV Ah,0
    
    PUSH Ax
    MOV arr[Si],Al
    INC Si
    
    MOV Ah,01h                               ; Get third word 
    INT 21h
    
    MOV Ah,0
    
    PUSH Ax
    MOV arr[Si],Al 
    
    MOV Si,0                                 ; Reset Si to 0
    POP Dx                                   ; Pop the stack
    CMP arr[Si],Dl                           ; Compare top stack element with first array element
    JNE finish                               ; Goto finish label
    INC Si
    
    
    POP Dx 
    CMP arr[Si],Dl
    JNE finish
    INC Si
    
    POP Dx
    CMP arr[Si],Dl
    JNE finish
    
    
    pal:  
        PRINTN ' '
        PRINT 'The word is a Palindrome!' 
        JMP Exit
    finish:
        PRINTN ' '
        PRINT 'The word is not a Palindrome!'
         
    Exit:    
        main endp  
                 
END main              
