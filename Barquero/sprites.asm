//FunciOn para inicializar los sprites
init_sprites:
	lda #%11111111	//Se habilitan todos los sprites
	sta SP_ENBABLE
	lda #255		//Se habilita el multicolor 
	sta SP_MCOLOR
	lda #15			//Multicolor 1
	sta SP_COLOR1
	lda #1			//Multicolor 2
	sta SP_COLOR2
	ldx #0
	lda #9			//Se carga el color de los sprites
sp_color:
	sta SP_PCOLOR, x
	inx
	cpx #8
	bne sp_color	
	rts					

//FunciOn para que la barca 'flote' con la subida del agua	
barca_up:
	lda SP_POSITION+1
	sbc #8
	sta SP_POSITION+1
	
	lda #1
	sta PARAM3
	ldx #5
	stx PARAM4
	jsr puntua
	jsr m_puntuacion
	
	ldx #0
	jsr get_coorde_pant	//Se comprueba se da contra algo
	jsr get_linea
	jsr set_caracter
	rts
	
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
	beq chg_bmsl
	dec SP_POSITION
	jsr get_car_left
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
	inc SP_POSITION
	beq chg_bms
	jsr get_car_right
	rts	

chg_bmsl:
	lda #254
	sta SP_POSITION
	
//FunciOn para cambiar el BMS del sprite 0
chg_bms:
	lda SP_BMS
	eor #$01
	sta SP_BMS	
	rts

//FunciOn para comprobar si el sprite 0 ha colisionado con otro sprite	
cmp_coli:
	lda SP_COLI
	lsr
	bcc end_coli
	jsr muerte
end_coli:
	rts		
	
anim_barca:
	inc sprites.delay_anim
	ldx sprites.delay_anim
	cpx #10
	bne anim_end
	ldx #0
	stx sprites.delay_anim
	
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

get_car_left:
	ldx #0
	jsr get_coorde_pant
	dec PARAM1
	jsr get_linea
	jsr set_caracter
	jmp get_car_down
	
get_car_right:
	ldx #0
	jsr get_coorde_pant
	inc PARAM1
	jsr get_linea
	jsr set_caracter	

get_car_down:
	inc PARAM5
	beq get_car_fin
	inc PARAM2		
	jsr get_linea
	jsr set_caracter
get_car_fin:	
	rts

//FunciOn para obetner las coordenadas generales de la pantalla 
//donde estA la barca para poder comprobar si choca
//ParAmetros:
//SP_POSITION: 		coordenada X del sprite
//SP_POSITION + 1: 	coordenada Y del sprite
//Retorno:
//PARAM1: Coordenada X de la pantalla
//PARAM2: Coordenada Y de la pantalla	
get_coorde_pant:
	lda SP_POSITION + 1, x 	//Obtiene la coordenada Y
	lsr
	lsr
	lsr
	sbc #5	
	sta PARAM2
		
	lda SP_POSITION, x		//Obtiene la coordenada X
	lsr
	lsr
	lsr
	sta PARAM1
	
	
	cpx #0
	bne suma_coor
	lda SP_BMS			//Esto es sOlo para el sprite 0	
	lsr
	bcc get_x_end
suma_coor:	
	lda PARAM1
	adc #30
	sta PARAM1	
	rts
get_x_end:
	dec PARAM1
	dec PARAM1
	rts 
			 	