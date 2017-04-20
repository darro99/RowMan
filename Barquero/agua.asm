llenado:
	ldx vars_game.is_dead
	cpx #VIVO
	bne end_cont

	ldx vars_agua.cont
	dex
	bne end_cont
	ldx vars_agua.CONT
	stx vars_agua.cont
	ldx vars_agua.delay
	dex
	bne end_delay
	ldx vars_agua.DELAY
	stx vars_agua.delay
	jsr agua
	jsr barca_up
	rts
end_cont:
	stx vars_agua.cont
	rts
end_delay:
	stx vars_agua.delay
	rts


//FunciOn para rellenar la pantalla con las lIneas.
//La primera es la del 'agua profunda' y la segunda
//la del 'agua superfice' 
//ParAmetros: vars_agua.liena LInea actual de la pantalla
agua:
	ldx vars_agua.linea
	cpx #3
	bcs add_linea
	//jmp agua_end
	rts
	
add_linea:
	stx PARAM2				//Coordenada Y de la lInea
	lda #0
	sta PARAM1				//Coordenada X de la LInea
	lda #CHAR_AGUA_PROF
	sta PARAM3				//Caracter a pintar
	lda #14
	sta PARAM4				//Color del caracter
	lda #40
	sta PARAM5				//Ancho de la columna
	jsr pintar_pared
	
	dex
	stx PARAM2
	lda #0
	sta PARAM1	
	lda #CHAR_AGUA
	sta PARAM3
	lda #14
	sta PARAM4
	jsr pintar_pared
	stx vars_agua.linea
agua_end:	
	rts
	
init_agua:
	ldx #0
	stx	PARAM1
	ldx #24
	stx	PARAM2
	ldx #CHAR_AGUA
	stx PARAM3
	lda #14
	sta PARAM4				//Color del caracter
	lda #40
	sta PARAM5				//Ancho de la columna
	jsr pintar_pared
	rts
	
		

