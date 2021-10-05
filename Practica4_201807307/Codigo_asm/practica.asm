
include macros.asm      
spila segment stack
	DB 32 DUP ('stack___')
spila ends

sdatos segment 

	; encabezado
	header0 db "----- PRACTICA #4 -----",0DH, 0AH,"$"
	header1 db "Universidad de San Carlos de Guatemala",0DH, 0AH,"$"
	header2 db "Arquitectura de Ensambladores y Computadores 1",0DH, 0AH,"$"
	header3 db "Victo Alejandro Cuches de León - 201807307",0DH, 0AH,"$"
	header4 db "Ingrese x si desea cerrar el programa",0DH, 0AH,"$"



	; basicas
	salto db 0ah, "$"
	pauseEnter db 50 dup("$"), "$"
	readTeclado db 50 dup("$")
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

		;mostrando encabezado 
		imprimir header0
		imprimir header1
		imprimir header2
		imprimir header3
		imprimir header4
		leerHastaEnter readTeclado
		


        


	ret 
    main endp
	
scodigo ends


end main
    