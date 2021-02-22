ScreenSize equ &17E8   

org &c350
	ld hl,&0000		;HL is the source memory address 
					

	ld de,&4000		;DE is the destination address 
					

	ld bc,ScreenSize	;BC is the bytecount 
					

	ldir			;LDIR copies a byte from (HL) to (DE), then increments HL and DE, finally it decreases BC, and repeats until BC=0
				
				
ret
