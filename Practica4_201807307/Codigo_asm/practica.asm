
include macros.asm      
spila segment stack
	DB 32 DUP ('stack___')
spila ends

sdatos segment 

	; encabezado
	header0 db "----- PRACTICA #4 -----",0DH, 0AH,"$"
	header1 db "Universidad de San Carlos de Guatemala",0DH, 0AH,"$"
	header2 db "Arquitectura de Ensambladores y Computadores 1",0DH, 0AH,"$"
	header3 db "Victo Alejandro Cuches de Leon - 201807307",0DH, 0AH,"$"
	header4 db "Ingrese x si desea cerrar el programa",0DH, 0AH,"$"



	; basicas
	salto db 0ah, "$"
	pauseEnter db 50 dup("$"), "$"
	readTeclado db 50 dup("$")
	bye db "Fin de ejecucion, adios :)","$"

	; comandos 
	wordabrir db "abrir_", "$"
	wordcontar db "contar_", "$"
	wordprop db "prop_", "$"
	wordcolorear db "colorear", "$"
	wordreporte db "reporte", "$"
	worddipto db "diptongo_", "$"
	wordhiato db "hiato_", "$"
	wordtripto db "triptongo_", "$"
	wordx db "x", "$"
	worderror db "comando incorrecto", "$"
	ncomando db 0d
	yes db "entro a ", "$"

	; lectura de archivo 
	msgtxt db "Contenido del archivo: ", "$"
	textFile db 2222 dup("$"),"$"
	handle dw 0
	ruta db 50 dup("$"), 0
	nextWord db 50 dup("$"), "$"
	indiceI dw 0 ;indice utilizado en la ruta
	indiceJ dw 0 ;indice utilizado en nextWord
	indiceK dw 0

	; clasificar en diptongo, triptongo e hiato
	vocales db "aeiou","$"
	vabierta db "aeo","$"
	vcerrada db "iu","$"

	groupV db 10 dup("$"), "$"
	flagD db 0
	flagT db 0
	flagH db 0
	flagW db 0
	ite dw 0
	cambioL db "cambio letra","$"
	letra db "igualo letra","$"
	oldVoc db " ","$"
	newVoc db " ","$"
	fin db "fin","$"

	;tipo de cada palabra
	wordDip db "Diptongo ","$"
	crecien db "- Creciente","$"
	decrec db "- Decreciente","$"
	homoge db "- Homogeneo","$"
	noWord db "No es ","$"
	hiatoS db "Hiato - Simple", "$"
	noHiato db "No es Hiato","$"
	tripton db "Triptongo", "$"

	;comando contar
	contarW db 0d
	condip db "diptongo","$"
	contrip db "triptongo","$"
	conhia db "hiato", "$"
	conpal db "palabra", "$"
	spc db " ","$"
	spcDos db "espacio en blanco","$"
	numDip dw 0d
	numTrip dw 0d
	numHia dw 0d
	numPal dw 1d
	anaWord db 50 dup("$"), "$"
	flagCount db 0
	flagYa db 0
	




	


sdatos ends


scodigo segment 'CODE'
    
	ASSUME SS:spila, DS:sdatos, CS:scodigo  
	IMPRIMIR_NUMERO proc
		; AX -> parametro donde voy a poner el número a imprimir
		push dx
		push si
		push di
		push cx
		push bx

		mov cx, '$'
		push cx
		for1num:
			xor dx, dx
			mov bx, 10d
			div bx
			push dx
			cmp ax, 10
			jge for1num		
			cmp ax, 0
			je axEs0
		push ax

		axEs0:
		for2num:
			pop dx
			cmp dl, '$'
			je finFor2
			mov ah, 02h
			add dl, 30h
			int 21h
			jmp for2num
		finFor2:
		pop bx
		pop cx
		pop di
		pop si
		pop dx
		ret
	IMPRIMIR_NUMERO endp        
	
	
	main proc far 
	    
	    push ds
		mov si, 0
		push si
		mov ax, sdatos
		mov ds,ax
		mov es,ax 

		repeticion:

			;mostrando encabezado 
			imprimir header0
			imprimir header1
			imprimir header2
			imprimir header3
			imprimir header4
			leerHastaEnter readTeclado

			;verificar si el comando es abrir_
			veriABRIR
			cmp ncomando, 1d
			jz comando_abrir

			;verificar si el comando es contar_
			veriCONTAR
			cmp ncomando, 2d
			jz comando_contar

			;verificar si el comando es prop_
			veriPROP
			cmp ncomando, 3d
			jz comando_prop

			;verificar si el comando es colorear
			veriCOLOREAR
			cmp ncomando, 4d
			jz comando_colorear

			;verificar si el comando es reporte
			veriREPORTE
			cmp ncomando, 5d
			jz comando_reporte

			;verificar si el comando es diptongo_
			veriDIPTO
			cmp ncomando, 6d
			jz comando_diptongo

			;verificar si el comando es hiato_
			veriHIATO
			cmp ncomando, 7d
			jz comando_hiato

			;verificar si el comando es triptongo_
			veriTRIPTO
			cmp ncomando, 8d
			jz comando_triptongo



			;verificar si el comando es x
			mov al, readTeclado[0]
			cmp al, wordx
			jz salir

			; si el comando es incorrecto vuelve a pedir
			jmp comando_error

			
			jmp repeticion
			

			comando_abrir:
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordabrir
				imprimir salto

				getRuta ;macro para obtener el nombre de la ruta 
				imprimir ruta
				imprimir salto

				imprimir msgtxt
				imprimir salto	
				abrirArchivo ruta
				;leyendo contenido de archivo
				mov ah, 3Fh
				mov bx, handle
				mov cx, 2222
				mov dx, offset textFile
				int 21h
				cerrarArchivo handle
				;mostrando texto del archivo
				imprimir textFile
				


				jmp cleanAll

			comando_contar: 
				mov flagCount, 1d

				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordcontar
				imprimir salto

				numPalabra

				getWord
				imprimir nextWord
				imprimir salto

				veridip nextWord
				veritrip nextWord
				verihia nextWord
				veripal nextWord

				mov al, contarW
				cmp al, 1d ;diptongo
				jz countDip

				cmp al, 2d ;triptongo
				jz countTrip

				cmp al, 3d ;hiato
				jz countHia

				cmp al, 4d ;palabra
				jz countPal

				jmp comando_error

				
				countDip:
					imprimir salto
					imprimir condip
					imprimir salto
					mov ax, numDip
					call IMPRIMIR_NUMERO 
					jmp cleanAll
				

				countTrip:
					imprimir salto
					imprimir contrip
					imprimir salto
					mov ax, numTrip
					call IMPRIMIR_NUMERO 
					jmp cleanAll
		


				countHia:
					imprimir salto
					imprimir conhia
					imprimir salto
					mov ax, numHia
					call IMPRIMIR_NUMERO 
					jmp cleanAll

				countPal:
					imprimir salto
					imprimir conpal
					imprimir salto
					mov ax, numPal
					call IMPRIMIR_NUMERO 
					jmp cleanAll

				jmp cleanAll

				



				

			comando_prop: 
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordprop
				imprimir salto
				jmp cleanAll

			comando_colorear: 
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordcolorear
				imprimir salto
				jmp cleanAll

			comando_reporte: 
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordreporte
				imprimir salto
				jmp cleanAll

			comando_diptongo: 
				mov flagCount, 0d
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir worddipto
				imprimir salto

				getWord
				imprimir nextWord
				imprimir salto

				identifyDipto nextWord




				jmp cleanAll

			comando_hiato: 
				mov flagCount, 0d
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordhiato
				imprimir salto

				getWord
				imprimir nextWord
				imprimir salto

				identifyHiato nextWord

				jmp cleanAll

			comando_triptongo: 
				mov flagCount, 0d
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordtripto
				imprimir salto

				getWord
				imprimir nextWord
				imprimir salto

				identifyTripto nextWord

				jmp cleanAll

			comando_error:
				imprimir salto
				imprimir worderror
				imprimir salto
			
				
			cleanAll: ;este salto me permite hacer los clear necesarios para que todo funcione bien 
					  ;al seguir ejecutando 

				; limpiando pantalla y entrada
				leerHastaEnter pauseEnter 
				limpiarEntrada readTeclado ;para que no haya problemas con el nuevo comando
				limpiarEntrada ruta
				limpiarEntrada nextWord 
				;limpiarEntrada nextWord
				mov ncomando, 0d ;la opcion del comando seleccionado
				mov indiceI, 0d
				mov indiceJ,0d
				mov contarW, 0d
				;limpiando contador de palabras
				;para que no se duplique el punteo 
				mov numDip, 0d
				mov numHia, 0d
				mov numTrip, 0d
				mov numPal, 1d
				xor ax, ax
				limpiarT ;limpiar pantalla
				
				jmp repeticion


			salir: 
				imprimir salto
				imprimir bye
				imprimir salto





        


	ret 
    main endp
	
scodigo ends


end main
    