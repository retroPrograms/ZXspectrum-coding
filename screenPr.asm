	org &8000


MAIN
	call init
	;call printCipher
	ret

printCipher
	ld a,2
	call 5633
	ld hl, banner1
	ld b,2
	ret


init
; open channel to upper screen
 	ld a, 2
 	call 5633

; draw game title1
 	ld de, banner1
 	ld bc, eobanr1-banner1
 	call 8252


	
	ret

	counter defw 31

	colCount defb 30
	

	banner1 defb 22, 3, 10, "Test Print"
	eobanr1 equ $
	
		

