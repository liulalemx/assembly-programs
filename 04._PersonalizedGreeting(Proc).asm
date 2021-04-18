TITLE PersonalizedGreeting

;Program Desctiption: This program responds with a personalized greeting after it accepts a name
;Author: Liul Alemayehu

include 'emu8086.inc' 

.MODEL SMALL                                 ; com program, Memory Descriptor (Tiny | Small | Medium | Large)
.STACK 100                                   ; stack size

.DATA                                        ; Beginning of data segment where data is stored
    msg db "Hello! Enter your name: ",0      ; Declare variable msg and assigned it a value ($ used to indicate end of string)
    newline db 13,10,'$'                     ; Creates newline
    greeting db "Wellcome! ",0               ; Greeting message    
    
.CODE                                        ; Beginning of code segment

main PROC                                    
    ; Start
    MOV Ax,@DATA                             ; Moving address of data (data segment) to Ax register
    MOV Ds,Ax                                ; Initializing of Data segment register (Ds) from Accumilator register (Ax) 
    
    ; Prompt
    LEA Si,msg                               ; Loading the effective address of our msg to the Source index register (Si)
    CALL PRINT_STRING                        ; Prints the value stored in the Si
         
    ; Read Message
    MOV Dx,80                                ; Set the buffer size for the string input
    CALL GET_STRING                          ; Call the Get_string procedure
                                   
    ; Newline
    LEA Dx,newline
    MOV Ah,09h
    INT 21h
        
    ; Print Greeting
    LEA Si,greeting                          ; Loading the effective address of our greeting to the Source index register (Si)
    CALL PRINT_STRING                        ; Prints the value stored in the Si
    
    ; Print Name                             ; Move the string entered above (stored in Di by GET_STRING) to Si to print                                                                               
    MOV Si,Di                                ; Call Print_string procedure to print string stored in Si
    CALL PRINT_STRING
    
    Exit:    
    MOV Ah,4Ch                               ; Exit
    INT 21h                                  ; Does it!
       
main ENDP                                                

DEFINE_PRINT_STRING
DEFINE_GET_STRING

END main    