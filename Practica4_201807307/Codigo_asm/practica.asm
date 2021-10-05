
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


	


sdatos ends


scodigo segment 'CODE'
    
	ASSUME SS:spila, DS:sdatos, CS:scodigo         
	
	
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
				jmp cleanAll

			comando_contar: 
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordcontar
				imprimir salto
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
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir worddipto
				imprimir salto
				jmp cleanAll

			comando_hiato: 
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordhiato
				imprimir salto
				jmp cleanAll

			comando_triptongo: 
				imprimir salto
				imprimir yes
				imprimir salto
				imprimir wordtripto
				imprimir salto
				jmp cleanAll

			comando_error:
				imprimir salto
				imprimir worderror
				imprimir salto
			
				
			cleanAll:
				; limpiando pantalla y entrada
				leerHastaEnter pauseEnter 
				limpiarEntrada readTeclado ;para que no haya problemas con el nuevo comando
				mov ncomando, 0d ;la opcion del comando seleccionado
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
    