estalac:
	lda vars_cueva.ancho
	cmp vars_cueva.ancho_min
	beq end_estal
	lda vars_cueva.sentido
	cmp #UP
	bne down_estal
	dec vars_cueva.y
	jmp next_estal
down_estal:
	inc vars_cueva.y
next_estal:	
	lda vars_cueva.ancho	//Se dibuja el caracter izq.
	sta ZEROPAGE_POINTER_4 + 1
	lda #1
	sta vars_cueva.ancho
	jsr get_ca_left
	jsr pintar_pared
	lda vars_cueva.x		//Se dibuja el caracter der
	sta ZEROPAGE_POINTER_4
	adc ZEROPAGE_POINTER_4 + 1
	sta vars_cueva.x
	dec vars_cueva.x
	dec vars_cueva.x
	jsr get_ca_right
	jsr pintar_pared
	lda ZEROPAGE_POINTER_4 + 1
	sta vars_cueva.ancho
	dec vars_cueva.ancho
	dec vars_cueva.ancho
	lda ZEROPAGE_POINTER_4
	sta vars_cueva.x
	inc vars_cueva.x
	jsr get_linea
	jsr pinta_c
	jmp estalac
end_estal:
	rts	

get_ca_right:
	ldy vars_cueva.sentido
	iny
	iny
	jmp load_ca 
get_ca_left:
	ldy vars_cueva.sentido		
load_ca:
	lda esquinas,y
	sta vars_cueva.caracter
	rts		