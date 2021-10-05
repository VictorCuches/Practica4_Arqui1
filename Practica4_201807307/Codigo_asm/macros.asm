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

limpiarEntrada macro entradaT
    local ciclo, ciclo2, fin
    xor si, si
    ciclo:
        mov bl, "$"
        mov entradaT[si], bl
        
        cmp si, 49d
        je fin
        inc si
        jmp ciclo
    fin:
endm

veriABRIR macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, wordabrir[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 1d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veriCONTAR macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, wordcontar[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 2d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veriPROP macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, wordprop[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 3d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veriCOLOREAR macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, wordcolorear[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 4d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veriREPORTE macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, wordreporte[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 5d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veriDIPTO macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, worddipto[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 6d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veriHIATO macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, wordhiato[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 7d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veriTRIPTO macro  
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, readTeclado[di]
        mov bl, wordtripto[di]
        cmp bh, bl
        ; sino son iguales
        jnz diferente

        cmp bl, "$" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 8d
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm


