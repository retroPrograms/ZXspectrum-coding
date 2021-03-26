org &8000
	ld de,31
start_loop:
	call drawSides
	call pause
	;call pause
	call unDrawSides
	dec e
	jr nz, start_loop
	call drawTops
	;call pause
	;call unDrawTops
	ret

drawTops:
	ld ix,screen_map
	ld c,19
	ld a,255
dt_loopO
	ld b,31
dt_loop:
	ld (ix+0),a
	inc ix
	dec b
	jp nz,dt_loop
	dec c
	jp nz,dt_loopO
	ret

undrawTops:
	ld ix,screen_map
	ld c,191
	ld a,0
dt_loopUN:
	ld b,31
dt_loop1:
	ld (ix+0),a
	dec b
	jp nz,dt_loop1
	dec c
	jp nz,dt_loopUN
	ret



pause:
	ld bc,&ffff
pause_loop:
	dec c
	jr nz,pause_loop
	dec b
	jr nz,pause_loop
	ret

drawSides
	ld ix,screen_map
	ld b,190
main_loop:
	ld l,(ix+0)
	ld h,(ix+1)
	;ld hl,&4000
	;call drawLine
	ld (hl),1
	;ld de,31
	add hl,de
	ld (hl),1
	inc ix
	inc ix
	dec b
	ld a,b
	dec b
	jr nz,main_loop
	ret

unDrawSides
	ld ix,screen_map
	ld b,190
main_loopU:
	ld l,(ix+0)
	ld h,(ix+1)
	;ld hl,&4000
	;call drawLine
	ld (hl),0
	;ld de,31
	add hl,de
	ld (hl),0
	inc ix
	inc ix
	dec b
	ld a,b
	dec b
	jr nz,main_loopU
	ret



screen_map:
		
	defw #4000, #4100, #4200,  #4300 
	defw #4400, #4500, #4600,  #4700 
	defw #4020, #4120, #4220,  #4320 
	defw #4420, #4520, #4620,  #4720 
	defw #4040, #4140, #4240,  #4340 
	defw #4440, #4540, #4640,  #4740 
	defw #4060, #4160, #4260,  #4360 
	defw #4460, #4560, #4660,  #4760 
	defw #4080, #4180, #4280,  #4380 
	defw #4480, #4580, #4680,  #4780 
	defw #40A0, #41A0, #42A0,  #43A0 
	defw #44A0, #45A0, #46A0,  #47A0 
	defw #40C0, #41C0, #42C0,  #43C0 
	defw #44C0, #45C0, #46C0,  #47C0 
	defw #40E0, #41E0, #42E0,  #43E0 
	defw #44E0, #45E0, #46E0,  #47E0 
	defw #4800, #4900, #4A00,  #4B00 
	defw #4C00, #4D00, #4E00,  #4F00 
	defw #4820, #4920, #4A20,  #4B20 
	defw #4C20, #4D20, #4E20,  #4F20 
	defw #4840, #4940, #4A40,  #4B40 
	defw #4C40, #4D40, #4E40,  #4F40 
	defw #4860, #4960, #4A60,  #4B60 
	defw #4C60, #4D60, #4E60,  #4F60 
	defw #4880, #4980, #4A80,  #4B80 
	defw #4C80, #4D80, #4E80,  #4F80 
	defw #48A0, #49A0, #4AA0,  #4BA0 
	defw #4CA0, #4DA0, #4EA0,  #4FA0 
	defw #48C0, #49C0, #4AC0,  #4BC0 
	defw #4CC0, #4DC0, #4EC0,  #4FC0 
	defw #48E0, #49E0, #4AE0,  #4BE0 
	defw #4CE0, #4DE0, #4EE0,  #4FE0 
	defw #5000, #5100, #5200,  #5300 
	defw #5400, #5500, #5600,  #5700 
	defw #5020, #5120, #5220,  #5320 
	defw #5420, #5520, #5620,  #5720 
	defw #5040, #5140, #5240,  #5340 
	defw #5440, #5540, #5640,  #5740 
	defw #5060, #5160, #5260,  #5360 
	defw #5460, #5560, #5660,  #5760 
	defw #5080, #5180, #5280,  #5380 
	defw #5480, #5580, #5680,  #5780 
	defw #50A0, #51A0, #52A0,  #53A0 
	defw #54A0, #55A0, #56A0,  #57A0 
	defw #50C0, #51C0, #52C0,  #53C0 
	defw #54C0, #55C0, #56C0,  #57C0 
	defw #50E0, #51E0, #52E0,  #53E0 
	
