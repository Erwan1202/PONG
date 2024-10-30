STACK SEGMENT PARA STACK
    64 DUP(' ')
STACK ENDS

DATA SEGMENT PARA 'DATA'

DATA ENDS

CODE SEGMENT PARA 'CODE'

    MAIN PROC FAR 
        
        mov dl, 'A'
        mov ah, 2h
        int 21h
        
        
        ret

    MAIN ENDP

CODE ENDS

END