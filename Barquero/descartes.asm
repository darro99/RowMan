mov_left:
	lda sprites.dir_barca
	cmp #LEFT
	beq mov_left2
	lda #LEFT
	sta sprites.dir_barca
	lda #SP_PINIT
	sta SP_POINTER
	sta sprites.init_anim
mov_left2:
	jsr anim_barca
	dec SP_POSITION
	lda SP_POSITION
	cmp #255
	beq chg_bms
	rts
	
mov_right:
	lda sprites.dir_barca
	cmp #RIGHT
	beq mov_right2
	lda #RIGHT	
	sta sprites.dir_barca
	lda #$A9	
	sta SP_POINTER
	sta sprites.init_anim
mov_right2:
	jsr anim_barca	
	inc SP_POSITION
	lda SP_POSITION
	cmp #0
	beq chg_bms
	rts	
	
	anim_barca:
	inc sprites.frame_barca
	lda sprites.frame_barca
	cmp #3
	beq anim_reset
	inc SP_POINTER
anim_end:	
	rts
anim_reset:
	lda #0
	sta sprites.frame_barca
	lda sprites.init_anim
	sta SP_POINTER
	jmp anim_end
	
	
	//FunciOn para obetner las coordenadas generales de la pantalla 
//donde estA la barca para poder comprobar si choca
//ParAmetros:
//SP_POSITION: 		coordenada X del sprite
//SP_POSITION + 1: 	coordenada Y del sprite
//Retorno:
//PARAM1: Coordenada X de la pantalla
//PARAM2: Coordenada Y de la pantalla	
get_coorde_pant:
	lda SP_POSITION + 1 	//Obtiene la coordenada Y
	sbc #60
	lsr
	lsr
	lsr
	bcc no_suma_y
	adc #1
no_suma_y:	
	sta PARAM2
		
	lda SP_POSITION		//Obtiene la coordenada X
	lsr
	lsr
	lsr
	sta PARAM1
	lda SP_BMS
	lsr
	bcc get_x_end
	lda PARAM1
	adc #30
	sta PARAM1
	rts
get_x_end:
	//dec PARAM1
	//dec PARAM1
	rts	 	
	
	
niv_prin:
	iny
	lda (ZEROPAGE_POINTER_3), y
	cmp #SALIENTE
	beq carga_saliente
	cmp #ESTALACT
	beq carga_estalac
	cmp #BLOQUE
	beq carga_bloque
	cmp #JUGADOR
	beq carga_jugador
	cmp #DELAY
	beq carga_delay
	cmp #FIN_NIVEL
	bne niv_prin
	rts
	
	
//FunciOn para comprobar si el caracter marcado por el puntero
//forma parte de la cueva o no.
//ParAmetros:
//	ZEROPAGE_POINTER_1 que contiene la direcciOn de la pantalla a comprobar	
set_caracter:
	ldy #0
	lda (ZEROPAGE_POINTER_1),y
	cmp #CHAR_VACIO
	bne end_set_caracter
	rts
//////////
	/*ldy #0
	lda #$51 
	sta (ZEROPAGE_POINTER_1),y
	lda #7
	sta (ZEROPAGE_POINTER_2),y*/
	//noends:
	//jmp noends
end_set_caracter:
	lda #2
	sta BORDER
	jsr muerte
	rts
	
//////////
	/*ldy #0
	lda #$51 
	sta (ZEROPAGE_POINTER_1),y
	lda #7
	sta (ZEROPAGE_POINTER_2),y*/
	//noends:
	//jmp noends

set_caracter:
	ldy #0
	lda (ZEROPAGE_POINTER_1),y
	cmp #CHAR_MONEDA
	bne !sig_caracter+
	lda #CHAR_VACIO
	sta (ZEROPAGE_POINTER_1),y
	ldx #0
	stx PARAM1
	ldx #4
	stx PARAM2
	jsr puntua
	jsr m_puntuacion
	rts
!sig_caracter:
	cmp #CHAR_TESORO
	bne !sig_caracter+	
	lda #CHAR_VACIO
	sta (ZEROPAGE_POINTER_1),y
	ldx #2
	stx PARAM1
	ldx #4
	stx PARAM2
	jsr puntua
	jsr m_puntuacion
	rts
	
NIVEL0:
	//.byte ROCABMS, 10, 60, 12
	//.byte ROCA, 170, 64, 25
	//.byte ROCA, 100, 60, 15
	//.byte ROCA, 150, 60, 17
	//.byte ESTALACT, 0,  1,  9, 10, DOWN
	//.byte ESTALACT, 15, 1,  11, 10, DOWN
	//.byte BLOQUE,   0,  0, 11, 5, 5
	.byte ROCA, 140, 60, 35
	.byte ROCA, 200, 64, 36
	.byte SALIENTE, 0,  24, 15, 15, 2, RIGHT,UP
	.byte SALIENTE, 0,  0, 15, 15, 4, RIGHT,DOWN
	.byte SALIENTE, 25, 24, 15, 15, 2, LEFT,UP
	.byte SALIENTE, 25, 0, 15, 15, 4, LEFT,DOWN
	.byte TESORO,	8,	12
	.byte MONEDA,	16,	12
	.byte MONEDA,	18,	12
	.byte MONEDA,	20,	12
	.byte MONEDA,	22,	12
	.byte MONEDA,	24,	12
	.byte TESORO,	32,	12
	.byte JUGADOR, 170,222
	.byte DELAY, 255, 50
	.byte SALARRI, 14, 1, 9, 1
	.byte FIN_NIVEL
NIVEL1:
	.byte ESTALACT, 0,  0,  9, 10, DOWN
	.byte ESTALACT, 30, 0,  11, 10, DOWN
	.byte SALIENTE, 0,  24, 15, 10, 2, RIGHT,UP
	.byte SALIENTE, 30, 24, 15, 10, 2, LEFT,UP
	//.byte BLOQUE,   15,  7, 11, 10, 13
	//.byte MONEDA,	11,	21
	.byte JUGADOR, 200,222
	.byte DELAY, 255, 50
	.byte SALARRI, 14, 1, 9, 0
	.byte FIN_NIVEL					