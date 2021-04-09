TITLE GreatestAndSmallestNumber 

;Program Desctiption: This program receives three numbers and outputs the smallest and the largest numbers
;Author: Liul Alemayehu

.MODEL MEDIUM                                ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Enter Three numbers: $"          ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline
    largestMsg db "The largest number:- $"   ; Largest message
    smallestMsg db "The smallest number:- $" ; Smallest message        
    
.CODE                                        ; Beginning of code segment

;main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt
    LEA Dx,msg                               ; Loading the effective address of our msg to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Read First number 
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!

    SUB Al, 48                               ; Changes from ASCII to decimal
    MOV Bl,Al                                ; Moves value from Al to Bl

    ; Read Second number
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!

    SUB Al, 48                               ; Changes from ASCII to decimal
    MOV Cl,Al                                ; Moves value from Al to Cl

    ;Read Third number
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!

    SUB Al, 48                               ; Changes from ASCII to decimal
    MOV Ch,Al                                ; Moves value from Al to Dh
        
    ; Check if ENTER is pressed
    MOV AH,01                                ; Reads an input String to the Accumilator register (high)
    INT 21h                                  ; Does it!
    
    CMP Al,13                                ; Compare the input in the Accumilator registor to the ASCII value of the ENTER key (13)
    JE Enter                                 ; Jumps to 'Enter' label if the CMP is equal
    JMP Exit                                 ; Jumps to 'Exit' label otherwise
       
    ; Enter Pressed
    Enter: 
    call largest                             ; Calls the 'largest' procedure
    
    ; Print largest number
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
    
    ; Print largest message
    LEA Dx,largestMsg                        ; Loading the effective address of our message to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Print value
    mov Ah,02                                ; Prints to screen
    add Bh,48                                ; Changes value in Bh to decimal
    mov Dl,Bh                                ; Moves it to Dl
    int 21h                                  ; Does it
    
    call smallest                            ; Calls the 'smallest' procedure
    
    ;Print smallest number 
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
    
    ; Print smallest message
    LEA Dx,smallestMsg                       ; Loading the effective address of our message to the Data register (Dx)
    MOV Ah,09                                ; Print from data 
    INT 21h                                  ; Does it!
    
    ; Print value
    mov Ah,02                                ; Prints to screen
    add Bh,48                                ; Changes value in Bh to decimal
    mov Dl,Bh                                ; Moves it to Dl
    int 21h                                  ; Does it
    jmp Exit

;...................... PROCEDURES ............................

    ; largest
    largest PROC
        mov Bh,Bl
        cmp Bh,Cl
        jg next
        mov Bh,Cl
    
        next:
        cmp Bh,Ch
        jg next2
        mov Bh,Ch
    
        next2:
        mov Al,Bh
    RET    
    largest ENDP

    ; smallest
    smallest PROC
        mov Bh,Bl
        cmp Bh,Cl
        jl nexxt
        mov Bh,Cl
    
        nexxt:
        cmp Bh,Ch
        jl nexxt2
        mov Bh,Ch
    
        nexxt2:
        mov Al,Bh
    RET    
    smallest ENDP

;...................... PROCEDURES ............................  
       
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!

;main ENDP
END main    

