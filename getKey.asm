get_key
	push hl ;save hl
	ld hl,23560 ; LAST K system variable.
	ld (hl),0 ; put null value there.
loop_key 	
	ld a,(hl) ; new value of LAST K.
	cp 0 ; is it still zero?
	jr z,loop_key ; yes, so no key pressed.
	pop hl ;restore hl
	rst 16
	ret ;return key in a
	
	
	
	
