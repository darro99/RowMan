
final_0:
	jsr mensaje_fin  
	lda #GAMEOVER
	sta vars_game.is_dead
	rts
	
final_1:
	lda #1
	sta vars_game.num_final
	lda #0
	sta vars_game.est_final
	jsr mensaje_fin
	lda #$B1			//Carga el 'oni'
	sta SP_POINTER + 1
	lda #2				//HAce al 'oni' grande
	sta $d017
	sta $d01d
	lda #0
	sta SP_POSITION +2 	//Posiona el 'oni'
	lda #140
	sta SP_POSITION +3
	rts

final_2:
	lda #2
	sta vars_game.num_final
	lda #0
	sta vars_game.est_final
	jsr mensaje_fin
	lda #$AE			//Carga la roca
	sta SP_POINTER + 1
	sta sprites.num_roca	//Anim roca
	lda #SP_PINIT		
	sta sprites.frame_barca	//Anim rogelio
	lda #2				//Hace la roca grande
	sta $d017
	sta $d01d
	lda #0
	sta SP_POSITION +2 	//Posiona la roca'
	sta SP_POSITION +3
	lda #30
	sta SP_POSITION		//Posiona rogelio
	rts	
	
mensaje_fin:
	lda #CHAR_VACIO
	sta PARAM1
	lda #1
	sta PARAM2
	jsr borra_pant
	
	lda #FIN_JUEGO
	sta vars_game.is_dead
	lda #47
	sta vars_game.nivel
	jsr solo_init
	jsr init_agua
	
	ldx #0
	stx vars_game.fire
finales_0:	
	rts

finales_1:
	ldx vars_game.est_final
	:rti_jump_using_x(final_1_actions)
	rts

final_1_actions: :define_rti_jump_table(FINAL_1)

final_1_oni:
	lda SP_POSITION + 2
	cmp #157
	beq cambia_1_1
	adc #1
	sta SP_POSITION + 2 
	rts
cambia_1_1:
	lda #$AC			//Carga a rogelio
	sta SP_POINTER
	inc vars_game.est_final
	rts	
	
final_1_barca:
	lda SP_POSITION + 1
	cmp #165
	beq cambia_1_2
	sbc #1
	sta SP_POSITION + 1
	rts
cambia_1_2:
	lda #0
	sta SP_POSITION + 1
	inc vars_game.est_final	
	rts	

final_1_sefue:
	lda SP_POSITION + 3
	cmp #0
	beq cambia_1_3
	sbc  #1
	sta SP_POSITION + 3 
	rts
cambia_1_3:
	lda #GAMEOVER
	sta vars_game.is_dead
	rts	

finales_2:
	ldx vars_game.est_final
	:rti_jump_using_x(final_2_actions)
	rts

final_2_actions: :define_rti_jump_table(FINAL_2)

final_2_rocas:
	lda SP_POSITION
	adc #1
	sta SP_POSITION
	sta SP_POSITION + 2
	sta SP_POSITION + 3
	inc sprites.frame_barca
	lda sprites.frame_barca
	cmp #$A9
	bne anin_rocas_2
	lda #SP_PINIT
	sta sprites.frame_barca
anin_rocas_2:
	lda sprites.frame_barca
	sta SP_POINTER
	lda SP_POSITION
	cmp #216
	bne final_2_rts
	lda #0
	sta SP_POSITION
	inc vars_game.est_final
final_2_end:
	lda #GAMEOVER
	sta vars_game.is_dead
final_2_rts:
	rts					