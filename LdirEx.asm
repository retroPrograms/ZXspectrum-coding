ScreenSize equ &17E8   

org &c350

	call write_screen
	call get_key
	call clear_key
	call display_key
	call screen_color
ret

screen_color:
	ld ix,&5800 	;768 &300 &5b00
	ld bc,&300
sc_loop:
	ld a,&5C
	ld (ix+0),a
	inc ix
	dec bc
	ld a,0
	cp c
	jr nz,sc_loop
	cp b
	jr nz,sc_loop
ret


clear_key
	push af
	ld a,0
	ld hl,&4000
	ld bc,&17E0
cl_loop:
	ld a,0
	ld (hl),a
	inc hl
	dec bc
	ld a,c
	cp 0
	jr nz,cl_loop
	ld a,b
	cp 0
	jr nz,cl_loop
	pop af
ret

write_screen:
	ld hl,&0000		;HL is the source memory address 
					

	ld de,&4000		;DE is the destination address 
					

	ld bc,ScreenSize	;BC is the bytecount 
					
	
	ldir			;LDIR copies a byte from (HL) to (DE), then increments HL and DE, finally it decreases BC, and repeats until BC=0
ret

	
display_key:
	push af
	ld a,2  ;top left corner
	call 5633 
	pop af
	rst 16
	
ret				
				


get_key
	push hl ;save hl
	ld hl,23560 ; LAST K system variable.
	ld (hl),0 ; put null value there.
loop_key 	
	ld a,(hl) ; new value of LAST K.
	cp 0 ; is it still zero?
	jr z,loop_key ; yes, so no key pressed.
	pop hl ;restore hl
	;rst 16
	ret ;return key in a


