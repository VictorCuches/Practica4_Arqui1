            
spila segment stack
	DB 32 DUP ('stack___')
spila ends

sdatos segment 

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
        

    main endp
	
scodigo ends


end main
    