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
	
prin_tesoros_lin:
	lda vars_cueva.sentido
	sta vars_cueva.x
	lda vars_cueva.direccion
	sta vars_cueva.ancho
loop_prin_tesoros_lin:	
	jsr get_linea
	jsr prin_esquina
	inc vars_cueva.x
	inc vars_cueva.x
	dec vars_cueva.ancho
	bne loop_prin_tesoros_lin
	inc vars_cueva.y
	inc vars_cueva.y
	dec vars_cueva.lineas
	bne prin_tesoros_lin
	rts	