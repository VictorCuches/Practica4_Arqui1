imprimir macro cadena
    
    mov dx, offset cadena
	mov ah, 09
	int 21h

endm

leerHastaEnter macro entrada
    local salto, fin
    xor bx, bx ;limpiar registros
    salto: 
        mov ah, 01h
        int 21h ;leer 
        cmp al, 0dh ;entrada == \n
        je fin
        mov entrada[bx], al 
        inc bx
        jmp salto

    fin: 

endm

limpiarT macro ;clear
    mov ah, 0Fh
    INT 10h
    mov ah, 0
    INT 10h
endm