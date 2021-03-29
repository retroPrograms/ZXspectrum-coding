	org &8000


MAIN
	call init
	call printScreen
	ret

printScreen
	ld de, banner2
 	ld bc, eobanr2-banner2
 	call 8252

	ret


init
; opld de, banner1
 	ld bc, eobanr1-banner1
 	call 8252
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

	banner2 defb 22, 3, 10, "More Screen Printing"
	eobanr2 equ $
	
		

