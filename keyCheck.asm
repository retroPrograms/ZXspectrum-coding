	org 50000

	ld a,2	;upper screen
	call 5633	;open channel

check_key
	ld hl,23560 ; LAST K system variable.
	ld (hl),0 ; put null value there.
loop 	ld a,(hl) ; new value of LAST K.
	cp 0 ; is it still zero?
	jr z,loop ; yes, so no key pressed.
	cp ' ' ;is it space?
	jr z, exit_app 	;yes then exit
	rst 16	;display character
	jr check_key  ;loop again
exit_app
	ret ; key was pressed.
