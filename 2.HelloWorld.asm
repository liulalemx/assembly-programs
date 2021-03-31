TITLE Hello World

;Program Desctiption: This program prints hello world
;Author: Liul Alemayehu

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Hello World!$"                   ; Declare variable msg and assigned it a value ($ used to indicate end of string)

.CODE                                        ; Beginning of code segment

main PROC                                    
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    mov ah,09h                               ; Print function
    int 21h                                  ; Does it!
                                             
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
main ENDP

END main    

