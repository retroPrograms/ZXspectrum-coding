	org &8000

MAIN

	
	call init
	ld hl, mesg
	call printString
	call newLine
	call regSave
	call dispRegs
	ret

dispHex:
	;ld a,(hl)
	ld a,10
	cp 9
	jr nc,isHex
	add a, 48
	rst 16
	jr hexEnd
isHex:
	add a, 54
	rst 16
hexEnd:
	ret

dispRegs:
	ld hl,reg_bc
	call printString
	ld hl,reg_all
	call dispHex
	ret

regSave:
	push hl
	ld hl, reg_all
	ld (hl),c
	inc hl
	ld (hl),b
	inc hl    ;bc
	pop bc
	ld (hl), e
	inc hl
	ld (hl), d
	inc hl	  ;de
	ld (hl), c
	inc hl
	ld (hl), b
	inc hl	   ;hl
	push af
	pop bc
	ld (hl), c
	inc hl
	ld (hl), b
	inc hl	;af
	
	ret

newLine
	ld a,13
	jr printChar

printChar
	push hl
	push bc
	push de
	push af
		ld a,2
		call &1601
	pop af
	push af
		rst 16  ;call &0010 PRINT_A_1
	pop af
	pop de
	pop bc
	pop hl
	ret

printString
	ld a,(hl)
	cp 255
	ret z
	inc hl
	call printChar
	jr PrintString

init
; open channel to upper screen
 	ld a, 2
 	call 5633
	ret


mesg 	defb "Z80 registers",255

reg_bc   defb "BC: ",255

reg_de   defb "DE: ",255

reg_hl   defb "HL: ",255

reg_af   defb "AF: ",255

reg_all defb 0,0, 0,0 ,0,0 ,0,0 ;


