colorMem 	equ &5800
colorSize 	equ 768


	org &8000

	call clear_screen
	call drawMan
	ret


drawMan:
	ld ix,colorMan						
	ld iy,&5800
	ld de,25
	ld b,12
dm_loop2:
	ld c,7			
dm_loop:
	ld a,(ix+0)
	ld (iy+0),a
	inc ix
	inc iy
	dec c
	jr nz,dm_loop	
	add iy,de
	dec b			
	jr nz,dm_loop2
ret

clear_screen:
	push af
	ld a,69
	ld hl,&4000
	ld bc,&17E0
cl_loop:
	ld a,69
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



colorMan:
	defb 0,0,10,10,10,0,0  ;16 red
	defb 0,10,0,0,0,10,0
	defb 0,10,0,0,0,10,0
	defb 0,0,10,10,10,0,0
	defb 0,0,0,10,0,0,0
	defb 10,10,10,10,10,10,10
	defb 0,0,0,10,0,0,0
	defb 0,0,0,10,0,0,0
	defb 0,0,0,10,0,0,0
	defb 0,0,10,0,10,0,0
	defb 0,10,0,0,0,10,0
	defb 10,10,0,0,0,10,10


