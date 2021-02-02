	org 50000 ;c350

	MAIN

	call fillScreen
	ret

fillScreen
 	ld a,2
	call 5633
	ld c, 30
fillLoop
	ld a, 30

	rst 16
	dec c
	jr nz, fillLoop

	ret

fillLoop1
	;ld a, 3
	;call 5633
	ld a,30
	rst 16
	dec bc
	jr nz, fillLoop1

	ret

