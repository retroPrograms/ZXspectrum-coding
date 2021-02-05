	org 50000

	ld a,2	;upper screen
	call 5633	;open channel
	include "getKey.asm"

key_loop
	call get_key ;wait for key press
	rst 16
	cp 32  ;is it space key
	jr z,exit_app  ;yes then exit
	;rst 16  ;print character
	jr key_loop
	
exit_app
	ret 
