colorMem 	equ &5800
colorSize 	equ 768


	org &8000

	
	call setColor
	ret


setColor:
	ld hl,&0000		;HL is the source memory address 				
	ld de,&5800		;DE is the destination address 				
	ld bc,colorSize	;BC is the bytecount 				
	ldir			;LDIR copies a byte from (HL) to (DE), then increments HL and DE, finally it decreases BC, and repeats until BC=0
ret


