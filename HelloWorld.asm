	org 50000
	ld hl, udgs
	ld (23675), hl ; udgs pointer
	ld a,2  ;top left corner
	call 5633 
	ld de, string1
	ld bc, eostr-string1 ;string length
	call 8252 ;print string
	ld a,144
	rst 16
	ret
string  defb "Hello World",13,"Goodbye"
string1 defb 16, 2, 17, 6, 22, 3, 11, "Hello World",13 ;row 3 col 11
eostr 	equ $
udgs	defb 0,24, 60, 155, 178, 60, 24, 0

	;16 ink 2 red 17 paper 6 yellow
