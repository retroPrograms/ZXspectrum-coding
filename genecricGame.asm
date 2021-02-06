	org 50000

	ld a,101 ; white ink (7) on black paper (0),

	ld (23693),a ; set our screen colours.
	ld a,1 ; quick way to load accumulator with zero.
	call 8859 ; set permanent border colours.

	ld hl,blocks ; address of user-defined graphics data.
	ld (23675),hl ; make UDGs point to it.

	call 3503 ; ROM routine - clears screen, opens chan 2.

	ld a,144  ; display chr 144
	rst 16 

	ret

blocks 	defb 16,16,56,56,124,124,254,254 ; player base
