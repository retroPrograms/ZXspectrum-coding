	org 50000
	
	ld a,2 			; upper screen
	call 5633
loop    ld de,string 		
	ld bc,eostr-string 	; length
	call 8252 		; print 
	jp loop 

string defb "Hello World!"
eostr equ $
