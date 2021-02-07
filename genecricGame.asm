	org 50000

	ld a,101 ; white ink (7) on black paper (0),

	ld (23693),a ; set our screen colours.
	ld a,1 ; quick way to load accumulator with zero.
	call 8859 ; set permanent border colours.

	ld hl,blocks ; address of user-defined graphics data.
	ld (23675),hl ; make UDGs point to it.

	call 3503 ; ROM routine - clears screen, opens chan 2.

	call moveShip
	call setxy

	ld a,144  ; display chr 144
	rst 16 

	ret

moveShip
	ld hl, xcoord
	ld c,31
move_loop
	ld (hl), c
	ld a,144
	rst 16
	call delay
	ld a, ' '
	rst 16
	dec c
	jr nz, move_loop
	
	ret

setxy 	ld a,22 ; ASCII control code for AT.
	rst 16 ; print it.
	ld a,(xcoord) ; vertical position.
	rst 16 ; print it.
	ld a,(ycoord) ; y coordinate.
	rst 16 ; print it.
	ret

delay 	ld b,20 ; length of delay.
delay0 	halt ; wait for an interrupt.
	djnz delay0 ; loop.
	ret ; return.


blocks 	defb 16,16,56,56,124,124,254,254 ; player base
xcoord 	defb 0
ycoord 	defb 15
