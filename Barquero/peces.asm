peces:
	
	ldx vars_game.is_dead
	cpx #VIVO
	bne pez_salir
	
pez_anim:
	ldx pez.vivo
	cpx #VIVO
	bne pez_salir
			
	inc pez.delay
	ldx pez.delay
	cpx pez.max_delay
	bne pez_salir
	ldx #0
	stx pez.delay
	
end_peces:
	ldx pez.frame
	:rti_jump_using_x(movpez_actions)

movpez_actions: :define_rti_jump_table(MOVPEZ)
pez_salir:
	rts	

pez_sale:
	
    lda $d012 
	eor $dc04 
	sbc $dc05 
	
	sta pez.x
	
	lda SP_BMS
	rol
	bcc pez_sigue
	lda SP_BMS
  	eor #$80
  	sta SP_BMS
	
pez_sigue:	
  	lda SP_POINTER + 7
  	cmp #$B6
  	beq pez_izq_comp
  	
  	lda pez.x
  	cmp #190
  	bcs pez_izquierda
 
  	lda #SP_FISH_R
  	jmp pez_init_sp
 pez_izq_comp: 	
  	lda pez.x
  	cmp #70
  	bcs pez_izquierda
  	lda SP_BMS
  	eor #$80
  	sta SP_BMS
  	lda #SP_FISH_R
  	jmp pez_init_sp
  	
pez_izquierda:	
  	lda #SP_FISH_L
pez_init_sp: 	
  	sta SP_POINTER + 7
  	
  	lda pez.x
  	sta SP_POSITION + 14   //Carga la x del pez
	lda SP_POSITION + 1		//Carga la y de la barca
	sta pez.y
	sta SP_POSITION + 15   //Carga la y del pez
  	
  	
  	inc pez.frame
  	lda #20
	sta pez.x
	inc SP_POINTER + 7
	rts	
	
pez_frame_1:
	lda SP_POINTER + 7
	cmp #$B5
	bcc pez_suma_1
	dec SP_POSITION + 14
	dec SP_POSITION + 15	
	jmp fin_frame_1
pez_suma_1:
	inc SP_POSITION + 14
	dec SP_POSITION + 15
fin_frame_1:		
	jsr pez_mov
	rts	
	
pez_frame_2:
	lda SP_POINTER + 7
	cmp #$B5
	bcc pez_suma_2
	dec SP_POSITION + 14
	jmp fin_frame_2
pez_suma_2:	
	inc SP_POSITION + 14
fin_frame_2:	
	jsr pez_mov
	rts
	
pez_frame_3:	
	lda SP_POINTER + 7
	cmp #$B6
	bcc pez_resta_3
	dec SP_POSITION + 14
	inc SP_POSITION + 15
	jmp fin_frame_3
pez_resta_3:
	inc SP_POSITION + 14
	inc SP_POSITION + 15
fin_frame_3:
	jsr pez_mov			
	rts
		
pez_entra:	
	lda #0
	sta pez.frame
	rts

pez_puntua:
	dec SP_POSITION + 15
	dec SP_POSITION + 15
	dec SP_POSITION + 15
	dec SP_POSITION + 15
	lda SP_POSITION + 15
	cmp #4
	bcs pez_sigue_mov
	lda #MUERTO
	sta pez.vivo
pez_sigue_mov:	
	rts	
	
pez_fin:
	lda #1
	sta PARAM3
	lda #3
	sta PARAM4
	jsr puntua
	jsr m_puntuacion
	lda #$B5
	lda SP_POINTER + 7
	lda	#5
	sta pez.frame
	rts	

pez_mov:
	dec pez.x
	bne fin_pez_mov
	lda #20
	sta pez.x
	inc pez.frame
	inc SP_POINTER + 7
fin_pez_mov:
	rts			
	
oculta_pez:
	lda #0
	sta SP_POSITION + 15
	rts
		
init_pez:
	lda #0
	sta pez.vivo
    sta pez.delay
    sta pez.frame
    
    lda #1
    sta pez.max_delay
    rts
	
