
haz_cueva: 
	lda vars_cueva.sentido
	cmp #UP
	bne down_cueva
	dec vars_cueva.y
	jmp next_cueva
down_cueva:
	inc vars_cueva.y	
next_cueva:	
	lda vars_cueva.ancho
	cmp vars_cueva.ancho_min
	beq end_cueva
	lda vars_cueva.direccion
	cmp #LEFT
	bne right_cueva	
	
	lda vars_cueva.ancho	//Se dibuja de izq. a der. \----
	sta ZEROPAGE_POINTER_4
	lda #1
	sta vars_cueva.ancho
	jsr get_caracter_left
	jsr pintar_pared	
	lda ZEROPAGE_POINTER_4
	sta vars_cueva.ancho
	inc vars_cueva.x
	dec vars_cueva.ancho
	jmp med_cueva

right_cueva:	
	lda vars_cueva.x		//Se dibuja de der. a izs. ----/
	sta ZEROPAGE_POINTER_4
	adc vars_cueva.ancho
	sta vars_cueva.x
	dec vars_cueva.x
	lda vars_cueva.ancho
	sta ZEROPAGE_POINTER_4 + 1
	lda #1
	sta vars_cueva.ancho
	jsr get_caracter_right
	jsr pintar_pared
	lda ZEROPAGE_POINTER_4 + 1
	sta vars_cueva.ancho
	lda ZEROPAGE_POINTER_4
	sta vars_cueva.x
	dec vars_cueva.ancho
	
med_cueva:
	jsr get_linea
	jsr pinta_c
	jmp haz_cueva
	
end_cueva:
	rts	

get_caracter_left:
	ldy vars_cueva.sentido
	lda esquinas,y
	jmp gcc_end
get_caracter_right:
	lda vars_cueva.sentido
	adc #2
	tay
	lda esquinas,y
	jmp gcc_end		
		      	
gcc_end:
	sta vars_cueva.caracter		
	rts
	
pintar_pared:
	jsr get_linea
	jsr pinta_w	
	rts	