TITLE GreatestAndSmallestNumber 

;Program Desctiption: This program receives three numbers and outputs the smallest and the largest numbers
;Author: Liul Alemayehu

.MODEL MEDIUM                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
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
    CALL largest                             ; Calls the 'largest' procedure
    
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
    MOV Ah,02                                ; Prints to screen
    ADD Bh,48                                ; Changes value in Bh to decimal
    MOV Dl,Bh                                ; Moves it to Dl
    INT 21h                                  ; Does it
    
    CALL smallest                            ; Calls the 'smallest' procedure
    
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
    MOV Ah,02                                ; Prints to screen
    ADD Bh,48                                ; Changes value in Bh to decimal
    MOV Dl,Bh                                ; Moves it to Dl
    INT 21h                                  ; Does it
    JMP Exit

;...................... PROCEDURES ............................

    ; largest
    largest PROC
        MOV Bh,Bl
        CMP Bh,Cl
        JG next
        MOV Bh,Cl
    
        next:
        CMP Bh,Ch
        JG next2
        MOV Bh,Ch
    
        next2:
        MOV Al,Bh
    RET    
    largest ENDP

    ; smallest
    smallest PROC
        MOV Bh,Bl
        CMP Bh,Cl
        JL nexxt
        MOV Bh,Cl
    
        nexxt:
        CMP Bh,Ch
        JL nexxt2
        MOV Bh,Ch
    
        nexxt2:
        MOV Al,Bh
    RET    
    smallest ENDP

;...................... PROCEDURES ............................  
       
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!

;main ENDP
END main    

