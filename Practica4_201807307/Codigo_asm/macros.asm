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

        cmp bl, "_" ;si es igual a _
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 1d
        inc di
        mov indiceI, di
        
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

        cmp bl, "_" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 2d
        inc di
        mov indiceJ, di
        
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

        cmp bl, "_" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 3d
        inc di
        mov indiceJ, di
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

        cmp bl, "_" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 6d
        inc di
        mov indiceJ, di
        
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

        cmp bl, "_" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 7d
        inc di
        mov indiceJ, di
        
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

        cmp bl, "_" ;si es igual a dolar
        jz iguales
        ; si son iguales
        inc di
        jmp comparar

    iguales:
        ;en esta parte hace las acciones respectivas del comando 
        mov ncomando, 8d
        inc di
        mov indiceJ, di
        
        jmp final
    diferente: 
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

abrirArchivo macro rutaArch
	mov ah, 3Dh
	mov al, 2
	mov dx, offset ruta
	int 21h
	mov handle, ax
endm


cerrarArchivo macro idArchivo
	mov ah, 3Eh
	mov bx, idArchivo
	int 21h
endm

getRuta macro 
    local cicloo, fini
    
    ;limpiando registros para que todo funcione correctamente
    xor bl, bl
    xor si, si 
    ;di pasa a tener el indice donde ya termine el comando_
    mov di, indiceI

    cicloo: 
        mov bl, readTeclado[di] ;entrada desde donde termina el comando_
        mov ruta[si], bl ;colocando en la variable ruta la entrada 
        cmp bl, "$"    
        jz fini
        inc di
        inc si
        jmp cicloo
    fini:    
endm

getWord macro 
    local cicloo, fini
    
    ;limpiando registros para que todo funcione correctamente
    xor bl, bl
    xor si, si 
    ;di pasa a tener el indice donde ya termine el comando_
    mov di, indiceJ

    cicloo: 
        mov bl, readTeclado[di] ;entrada desde donde termina el comando_
        mov nextWord[si], bl ;colocando en la variable nextWord la entrada 
        cmp bl, "$"    
        jz fini
        inc di
        inc si
        jmp cicloo
    fini:    
endm

identifyDipto macro palabra ;paisaje
    local ciclo, ciclo2, ciclo3, ciclo4, ciclo5, fini
    local decreciente, creciente, homogeneo, finPalabra, otroDip
    xor si, si
    xor di, di

    ciclo:
        mov al, palabra[si]
        cmp al, 97 ; a
        jz ciclo2

        cmp al, 101 ; e
        jz ciclo2

        cmp al, 111 ; o
        jz ciclo2
        
        cmp al, 105 ; i
        jz ciclo3

        cmp al, 117 ; u
        jz ciclo4

        cmp palabra[si], "$"
        jz ciclo5

        inc si
        jmp ciclo

    ciclo2:
        inc si
        mov al, palabra[si]
        cmp al, 105 ;i
        jz decreciente

        cmp al, 117;u
        jz decreciente

        
        jmp ciclo

    ciclo3: 
        inc si
        ;diptongo creciente
        mov al, palabra[si]
        cmp al, 97 ; a
        jz creciente

        cmp al, 101 ; e
        jz creciente

        cmp al, 111 ; o
        jz creciente

        ;diptongo homogeneo
        cmp al, 117 ;u
        jz homogeneo

        jmp ciclo ;ciclo
    
    ciclo4:
        inc si
        ;diptongo creciente
        mov al, palabra[si]
        cmp al, 97 ; a
        jz creciente

        cmp al, 101 ; e
        jz creciente

        cmp al, 111 ; o
        jz creciente

        ;diptongo homogeneo
        cmp al, 105 ;i
        jz homogeneo

        jmp ciclo ;ciclo

    decreciente:
        mov tipoPalabras, 1d
        cmp flagCount, 1d
        jz otroDip

        

        imprimir salto
        imprimir wordDip
        imprimir decrec
        imprimir salto
        jmp fini
    
    creciente:
        mov tipoPalabras, 1d
        cmp flagCount, 1d
        jz otroDip

    
        imprimir salto
        imprimir wordDip
        imprimir crecien
        imprimir salto
        jmp fini
    
    homogeneo:
        mov tipoPalabras, 1d
        cmp flagCount, 1d
        jz otroDip

        

        imprimir salto
        imprimir wordDip
        imprimir homoge
        imprimir salto
        jmp fini

    otroDip:
       inc numDip
       jmp fini
    ciclo5:
       
        cmp flagCount, 1d
        jz fini

        imprimir salto
        imprimir noWord
        imprimir wordDip
        imprimir salto
   
    fini:

    


endm


identifyHiato macro palabra
    local ciclo, ciclo2, ciclo3, ciclo4, ciclo5, finito
    local simple, otroHia
    

    xor si, si
    xor di, di

    ciclo:
        mov al, palabra[si]
        mov oldVoc, al
        cmp al, 97 ; a
        jz ciclo2

        cmp al, 101 ; e
        jz ciclo2

        cmp al, 111 ; o
        jz ciclo2
        
        cmp al, 105 ; i
        jz ciclo3

        cmp al, 117 ; u
        jz ciclo5

        cmp palabra[si], "$"
        jz ciclo4

        
            


        inc si
        jmp ciclo

    ciclo2:
      
        inc si
        mov al, palabra[si]
       
        cmp al, 97 ; a
        jz simple

        cmp al, 101 ; e
        jz simple

        cmp al, 111 ; o
        jz simple

        jmp ciclo

    ciclo3:
      
        inc si
        mov al, palabra[si]
        cmp al, 105 ; i
        jz simple
        jmp ciclo

    ciclo5:
     
        inc si
        mov al, palabra[si]


        cmp al, 117 ; u
        jz simple

        jmp ciclo



        
    ciclo4:
      
        cmp flagCount, 1d
        jz finito
        imprimir salto 
        imprimir noHiato
        imprimir salto
        jmp finito
    simple:
       
        mov tipoPalabras, 3d
        cmp flagCount, 1d
        jz otroHia

        imprimir salto
        imprimir hiatoS
        imprimir salto
        jmp finito

    otroHia:
        inc numHia
        jmp finito
    finito:



endm

identifyTripto macro palabra
    local ciclo, ciclo2, ciclo3, ciclo4, finito, triptongo, otroTrip
    xor si, si
    xor di, di
    
    ciclo: 
        mov al, palabra[si]
        
        cmp al, 105 ; i
        jz ciclo2

        cmp al, 117 ; u
        jz ciclo2

        cmp palabra[si], "$"
        jz ciclo4

        inc si
        jmp ciclo
    
    ciclo2:
        inc si 
        mov al, palabra[si]

        cmp al, 97 ; a
        jz ciclo3

        cmp al, 101 ; e
        jz ciclo3

        cmp al, 111 ; o
        jz ciclo3

        jmp ciclo
    
    ciclo3:
        inc si
        mov al, palabra[si]
        
        cmp al, 105 ; i
        jz triptongo

        cmp al, 117 ; u
        jz triptongo
        
        jmp ciclo

    triptongo:
        mov tipoPalabras, 2d
        cmp flagCount, 1d
        jz otroTrip

        
        imprimir salto
        imprimir tripton
        imprimir salto
        jmp finito

    ciclo4:
        
        cmp flagCount, 1d
        jz finito
        imprimir salto
        imprimir noWord
        imprimir tripton
        imprimir salto
        jmp finito
    
    otroTrip:
        mov flagYa, 1d ;para que no revise si es diptongo la palabra
        inc numTrip
        jmp finito
    finito:


endm

;IDENTIFICA QUE UNA LETRA SEA VOCAL PUEDE SER UTIL
; identifyDipto macro palabra ;paisaje
;     local ciclo, ciclo2, ciclo3, ciclo4, ciclo5, fini
;     local decreciente, creciente, homogenea, finPalabra
;     xor si, si
;     xor di, di

;     ciclo: 
;         mov bl, vabierta[si] ;
;         cmp palabra[di], bl
;         ;mov al, palabra[di]
;         jz ciclo2

;         cmp si, 2
;         jz ciclo3

;         inc si
;         jmp ciclo

;     ciclo2: 
;         ;aqui identifico que es una vocal
        
;         imprimir salto
;         imprimir letra
;         imprimir salto

;         inc di
;         xor si, si

;         cmp palabra[di], "$"
;         jz fini

;         jmp ciclo

;     ciclo3:
;         xor si, si
       
;     ciclo4:
;         mov bl, vcerrada[si]
;         cmp palabra[di], bl
;         jz ciclo2

;         cmp si, 1
;         jz ciclo5

;         inc si
;         jmp ciclo4

;     ciclo5:
;         inc di
;         xor si, si
;         cmp palabra[di], "$"
;         jz fini

;         jmp ciclo


  

;     fini:
;         imprimir salto
;         imprimir fin
;         imprimir salto
        

    


; endm



veridip macro palabra
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, palabra[di]
        mov bl, condip[di]
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
        mov contarW, 1d        
        jmp final
    diferente: 
        
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veritrip macro palabra
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, palabra[di]
        mov bl, contrip[di]
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
        mov contarW, 2d     
        jmp final
    diferente: 
        
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

verihia macro palabra
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, palabra[di]
        mov bl, conhia[di]
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
        mov contarW, 3d
        jmp final
    diferente: 
         
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
endm

veripal macro palabra
    local comparar, diferente, iguales, final
    xor di, di
    xor bh, bh
    xor bl, bl
    comparar:
        mov bh, palabra[di]
        mov bl, conpal[di]
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
        mov contarW, 4d        
        jmp final
    diferente: 
      
        ; lo ignora y pasa a la siguiente verificacion
        jmp final
    final:  
          
endm

; ESTA MACRO ANALIZA EL TEXTO E IDENTIFICA LAS PALABRAS
numPalabra macro ;textFile
    local ciclo, ciclo2, ciclo3, ciclo4, finito, espacio
    local cicloLimpiar, finLimpiar, chauDip, chauDipd, noIden, noIdend
    

    xor si, si
    xor di, di

    ciclo:
        mov al, textFile[si]

        cmp al, spc[0]
        jz espacio

        mov anaWord[di], al
        ;guardando en otra variable la letra que esta leyendo

        cmp al, "$"
        jz finito

        
        inc si
        inc di
        jmp ciclo



    espacio:
        ; imprimir salto
        ; imprimir spcDos
        ; imprimir salto
        ; imprimir anaWord
        ; imprimir salto
        mov indiceK, si ;guardo el valor de si porque al entrar a identifyDipto se reinicia
        inc di
        mov anaWord[di], "$"


        ;verificar si la palabra es triptongo
        identifyTripto anaWord
        cmp flagYa, 1d
        jz chauDip

        ;verificar si la palabra es diptongo 
        identifyDipto anaWord
        
        chauDip:
            ;verificar si la palabra hiato
            identifyHiato anaWord

        ; IDENTIFICAR PALABRAS PARA REPORTE 
        cmp turnIde, 1d
        jne noIden
        palReporte anaWord
        noIden:

       

        ; ---------------------------------------------
        ; ESTE BLOQUE LIMPIA LA ENTRADA PARA SEGUIR GUARDANDO
        ; PALABRAS TEMPORALES
        xor di, di
        cicloLimpiar:
            mov bl, "$"
            mov anaWord[di], bl
            
            cmp di, 49d
            je finLimpiar
            inc di
            jmp cicloLimpiar
        finLimpiar:
        ; ---------------------------------------------

        mov flagYa, 0d
        mov si, indiceK
        inc numPal ; incrementando el numero de palabras
        xor di, di
        inc si
        jmp ciclo

    finito:
        ;aqui tambien tengo que hacer validaciones porque la ultima 
        ;palabra aun queda guardada y aca la leo

        inc di
        mov anaWord[di], "$"

        ;verificar si la palabra es triptongo
        identifyTripto anaWord
        cmp flagYa, 1d
        jz chauDipd

        ;verificar si la palabra es diptongo 
        identifyDipto anaWord
        
        chauDipd:
            ;verificar si la palabra hiato
            identifyHiato anaWord
       
        ; IDENTIFICAR PALABRAS PARA REPORTE 
        cmp turnIde, 1d
        jne noIdend
        palReporte anaWord
        noIdend:
        
        ; imprimir salto
        ; imprimir spcDos
        ; imprimir salto
        ; imprimir anaWord
        ; imprimir salto
    
endm

openFile macro rutaFile
    mov ah, 3Dh
    mov al, 2
    mov dx, offset rutaFile
    int 21h

    mov handleR, ax ;manipula archivo
    
endm

closeFile macro idFile
    mov ah, 3Eh
    mov bx, idFile
    int 21h
endm

writeFile macro idFile, numBytes, datos
    mov ah, 40h
    mov bx, idFile
    mov cx, numBytes
    lea dx, datos ; lo mismo que offset
    int 21h
endm

imprimirUno macro cadena
    local ciclo, final

    xor di, di

    ciclo: 
        mov bl, cadena[di]

        cmp bl, "$"
        jz final

        writeFile handleR, 1, cadena[di]
        inc di
        
        jmp ciclo

    final:


endm

palReporte macro palabro
    local saltou, saltod, saltot, saltoc, saltoci

    cmp tipoPalabras, 1d ; diptongo
    jz saltou

    cmp tipoPalabras, 2d ; triptongo
    jz saltod

    cmp tipoPalabras, 3d ; hiato
    jz saltot

    jmp saltoc

    saltou:
        imprimirUno palabro
        writeFile handleR, 1, spc
        writeFile handleR, 1, dospt
        writeFile handleR, 1, spc
        writeFile handleR, 8, condip
        writeFile handleR, 1, salto
        jmp saltoc

    saltod:
        imprimirUno palabro
        writeFile handleR, 1, spc
        writeFile handleR, 1, dospt
        writeFile handleR, 1, spc
        writeFile handleR, 9, contrip
        writeFile handleR, 1, salto
        jmp saltoc

    saltot:
        imprimirUno palabro
        writeFile handleR, 1, spc
        writeFile handleR, 1, dospt
        writeFile handleR, 1, spc
        writeFile handleR, 5, conhia
        writeFile handleR, 1, salto
        jmp saltoc

    saltoc:
        mov tipoPalabras, 0d
      
endm

pintarTexto macro 
    local cicloletra, sig, sig2, sig3, finCmp, noSaltoLinea
	local rojo, blanco, amarillo, verde
    mov si, 0
	cicloletra:
		;posicionar el cursor
		mov ah, 2
		mov dh, row
		mov dl, column
		mov bh, 0
		int 10h

		;imprimir el caracter
		mov ah, 09h
		mov al, textFile[si]
		mov bh, 0
			cmp al, 'a'
			jne sig 
				mov bl, 110b
				jmp finCmp
			sig:

			cmp al,'e'
			jne sig2
				mov bl, 0100b
				jmp finCmp
			sig2:

			cmp al,'i'
			jne sig3
				mov bl, 0010b
				jmp finCmp
			sig3:
			mov bl, 1111b

			finCmp:

			mov cx, 1
			int 10h
			inc si

			;80 x 25
			inc column
			cmp column, 80
			jl noSaltoLinea
				
				inc row 
				mov column, 0

			noSaltoLinea:


			
			cmp textFile[si], "$"	
			jne cicloletra

endm

posicionarCursor macro x,y
	mov ah,02h
	mov dh,x
	mov dl,y
	mov bh,0
	int 10h
endm

imprimirVideo macro caracter, color
	mov ah, 09h
	mov al, caracter ;al guarda el valor que vamos a escribir
	mov bh, 0
	mov bl, color ; valor binario rojo
	mov cx,1
	int 10h
endm

 

esHiato macro letraU, letraD
    local ciclo, ciclo2, ciclo3, ciclo4, ciclo5, finito
    local simple
    mov yesH, 0


    ciclo:
        mov al, letraU
     
        cmp al, 97 ; a
        jz ciclo2

        cmp al, 101 ; e
        jz ciclo2

        cmp al, 111 ; o
        jz ciclo2
        
        cmp al, 105 ; i
        jz ciclo3

        cmp al, 117 ; u
        jz ciclo5


        jmp finito

    ciclo2:
      
       
        mov al, letraD
       
        cmp al, 97 ; a
        jz simple

        cmp al, 101 ; e
        jz simple

        cmp al, 111 ; o
        jz simple

       jmp finito

    ciclo3:
      
     
        mov al, letraD
        cmp al, 105 ; i
        jz simple
        jmp finito

    ciclo5:
     
        
        mov al, letraD


        cmp al, 117 ; u
        jz simple

        jmp finito



        
     
    simple:
       
        mov yesH, 1
        jmp finito

     
    finito:



endm

esTriptongo macro letraU, letraD, letraT
    local ciclo, ciclo2, ciclo3, ciclo4, finito, triptongo, otroTrip
    mov yesT, 0
    
    ciclo: 
        mov al, letraU
        
        cmp al, 105 ; i
        jz ciclo2

        cmp al, 117 ; u
        jz ciclo2

        
        jmp finito
    
    ciclo2:
    
        mov al, letraD

        cmp al, 97 ; a
        jz ciclo3

        cmp al, 101 ; e
        jz ciclo3

        cmp al, 111 ; o
        jz ciclo3

        jmp finito
    
    ciclo3:
       
        mov al, letraT
        
        cmp al, 105 ; i
        jz triptongo

        cmp al, 117 ; u
        jz triptongo
        
        jmp finito

    triptongo:
        mov yesT, 1d
        jmp finito


    
    finito:


endm

esDiptongo macro letraU, letraD
    local ciclo, ciclo2, ciclo3, ciclo4, ciclo5, fini
    local decreciente, creciente, homogeneo, finPalabra, otroDip
    mov yesD, 0

    ciclo:
        mov al, letraU
        cmp al, 97 ; a
        jz ciclo2

        cmp al, 101 ; e
        jz ciclo2

        cmp al, 111 ; o
        jz ciclo2
        
        cmp al, 105 ; i
        jz ciclo3

        cmp al, 117 ; u
        jz ciclo4

         

       
        jmp fini

    ciclo2:
         
        mov al, letraD
        cmp al, 105 ;i
        jz decreciente

        cmp al, 117;u
        jz decreciente

        
        jmp fini

    ciclo3: 
        mov al, letraD
        cmp al, 97 ; a
        jz creciente

        cmp al, 101 ; e
        jz creciente

        cmp al, 111 ; o
        jz creciente

        ;diptongo homogeneo
        cmp al, 117 ;u
        jz homogeneo

        jmp fini ;ciclo
    
    ciclo4:
        mov al, letraD
        cmp al, 97 ; a
        jz creciente

        cmp al, 101 ; e
        jz creciente

        cmp al, 111 ; o
        jz creciente

        ;diptongo homogeneo
        cmp al, 105 ;i
        jz homogeneo

        jmp fini ;ciclo

    decreciente:
        mov yesD, 1d
        jmp fini
    
    creciente:
        mov yesD, 1d
        jmp fini
    
    homogeneo:
        mov yesD, 1d
        jmp fini

   
     
   
    fini:

    


endm