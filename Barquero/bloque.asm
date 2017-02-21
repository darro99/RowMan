bloque:
	//lda #CHAR_CAVE_UP
	//sta vars_cueva.caracter
	//jsr pintar_pared
prin_bloque:
		
	inc vars_cueva.y
	jsr get_linea
	jsr pinta_c
	dec vars_cueva.lineas
	bne prin_bloque
	//lda #CHAR_CAVE_DOWN
	//sta vars_cueva.caracter
	//jsr pintar_pared
	rts	
	
prin_salida_a:
	jsr prin_esquina
    inc vars_cueva.x
	jsr get_linea
	jsr pinta_w
	dec vars_cueva.ancho
	lda vars_cueva.x
	adc vars_cueva.ancho
	sta vars_cueva.x
	jsr get_linea
	jsr prin_esquina
	rts
	
prin_salida_b:
	jsr prin_esquina
for_salida_b:	
	inc vars_cueva.y
	jsr get_linea
	jsr prin_esquina
	dec vars_cueva.ancho
	bne for_salida_b
	jsr prin_esquina
	rts		
	
prin_esquina:
	ldy #0
	lda vars_cueva.caracter
	sta (ZEROPAGE_POINTER_1),y
	lda vars_cueva.color
	sta (ZEROPAGE_POINTER_2),y	
	rts	