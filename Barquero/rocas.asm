rocas:
	jsr get_dead
	cpx #VIVO
	bne end_rocas

	lda sprites.num_roca
	cmp #0
	beq end_rocas
	

	ldy sprites.puntero_roca	
	lda rocas_vel, y
	sta PARAM1
	lda rocas_vela, y
	cmp PARAM1
	beq mov_roca
	adc #1
	sta rocas_vela, y
	//jmp mas_roca  //Con este salto no hay animaciOn
	jmp anim_roca
mov_roca:
	ldx tabla_spy, y
	stx sprites.desp_roca	
	lda SP_POSITION, x
	adc #1
	sta SP_POSITION, x
	dex
	jsr get_coorde_pant	//Se comprueba se da contra algo
	jsr get_linea
	ldy #0
	lda (ZEROPAGE_POINTER_1),y
	ldy sprites.puntero_roca	
	cmp #CHAR_AGUA_PROF
	bne cero_cont
	ldx sprites.desp_roca
	lda rocas_y, y
	sta SP_POSITION, x
cero_cont:	
	lda #0
	sta rocas_vela, y

anim_roca:
	ldx rocas_del, y
	dex	
	bne anim_roca_sig	
	lda #200
	sta rocas_del, y
	iny
	ldx SP_POINTER, y
	inx
	cpx #SP_PROCK_FIN
	bne anim_roca_next
	ldx #SP_PROCK		//Reset de la animaciOn
	jmp anim_roca_next
	
anim_roca_sig:
	txa
	sta rocas_del, y
	jmp mas_roca
	
anim_roca_next:
	txa
	sta SP_POINTER, y	

mas_roca:	
	inc sprites.puntero_roca
	lda sprites.puntero_roca
	cmp sprites.num_roca
	beq reset_rocas
	rts

reset_rocas:
	lda #0
	sta sprites.puntero_roca
	ldx tabla_spy, y
	
end_rocas:
	rts	

oculta_rocas:
	lda sprites.num_roca
	beq end_rocas
	lda #0
	ldy #0
ocu_sig:
	ldx tabla_spy, y
	sta SP_POSITION, x
	sta SP_POSITION + 1, x
	iny
	cpy sprites.num_roca
	bne ocu_sig
	rts	