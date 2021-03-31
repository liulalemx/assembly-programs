TITLE AddAndSub

;Program Desctiption: This program addition and subtraction operations on two single digit numbers and returns their result 
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack

.DATA                                        ; Beginning of data segment where data is stored
    msg1 db 'Enter the first number: ','$'   ; Declare variable msg1 and assigned it a value ($ used to indicate end of string)  
    msg2 db 'Enter the second number: ','$'  ; Declare variable msg2 
    msg3 db 'The Sum is: ','$'               ; Declare variable msg3 
    msg4 db 'The Difference is: ','$'        ; Declare variable msg4 
    newline db 13,10,'$'                     ; Creates newline

.CODE                                        ; Beginning of code segment
main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt1
    LEA Dx,msg1                              ; Loading the effective address of our msg1 to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Read first number
    MOV AH,01h                               ; Reads an input number to the Accumilator register (high)
    INT 21h                                  ; Does it! (reads charachter into Al)
    MOV Bh,Al                                ; Save character in Bh while we display a Return and Linefeed
    SUB Bh,30h                               ; Changes value in Bh to decimal
    
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
    ; Prompt2
    LEA Dx,msg2                              ; Loading the effective address of our msg2 to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Read second number
    MOV AH,01h                               ; Reads an input number to the Accumilator register (high)
    INT 21h                                  ; Does it! (reads charachter into Al)
    MOV Ch,Al                                ; Save character in Ch while we display a Return and Linefeed
    SUB Ch,30h                               ; Changes value in Ch to decimal
    
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
 
    ; :::::::::::::::: ADDITION :::::::::::::::
    ; Prompt3
    LEA Dx,msg3
    MOV Ah,09
    INT 21h
    
    ;Compute Sum
    ADD Bh,Ch                                ; Adds the values in Bh and Ch   !(If sum is greater than 9, wrong output)
    
    ;Transfer Result to Al
    XOR Ax,Ax                                ; Clears the value of Ax register (Ax=00)
    MOV Al,Bh                                ; Moves the sum to Al
               
    ; Print Result                                                                           
    MOV AH,02h                               ; Prints Character
    MOV Dl,Al                                ; Move value from Al to Dl
    ADD Dl,30h                               ; Converts value to ASCII
    INT 21h                                  ; Does it!
    
    ; Newline
    LEA Dx,newline
    MOV Ah,09
    INT 21h
    
    ; :::::::::::::::: SUBTRACTION :::::::::::::::
    ; Prompt4
    LEA Dx,msg4
    MOV Ah,09
    INT 21h
    
    ;Compute Difference
    SUB Bh,Ch                                ; Sets the value of Bh to its original value since it had been changed to Bh = Bh + Ch (line 61)
    SUB Bh,Ch                                ; Subtracts the values in Bh and Ch !(If difference is less than 0, wrong output)
    
    ;Transfer Result to Al
    XOR Ax,Ax                                ; Clears the value of Ax register (Ax=00)
    MOV Al,Bh                                ; Moves the difference to Al
           
    ; Print Result                                                                           
    MOV AH,02h                               ; Prints Character
    MOV Dl,Al                                ; Move value from Al to Dl
    ADD Dl,30h                               ; Converts value to ASCII
    INT 21h                                  ; Does it!
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

