init_fx:
	lda #15			//VOLUMEN
	sta VOLUMEN
	lda #TRIANGULO	//VOZ1
	sta ENVOLVENTE1
	lda #68			//ATAQUE DECAIMIENTO
	sta AD1
	lda #133		//SOSTENIMIENTO RELAJACION
	sta SR1
	
	lda #RUIDO		//VOZ2
	sta ENVOLVENTE2
	lda #129		//ATAQUE DECAIMIENTO
	sta AD2
	lda #33		//SOSTENIMIENTO RELAJACION
	sta SR2
	
	lda #TRIANGULO	//VOZ3
	sta ENVOLVENTE3
	lda #129		//ATAQUE DECAIMIENTO
	sta AD3
	lda #33			//SOSTENIMIENTO RELAJACION
	sta SR3
	rts
	
pez_fx:
	ldy NOTA_ACT_PEZ	
	lda notas_pez, y
	sta VOZ1A
	iny	
	lda notas_pez, y
	sta VOZ1B
	cpy #17
	beq pez_fx_fin
	sty NOTA_ACT_PEZ
	jmp pez_fx_end
pez_fx_fin:
	lda #0
	sta VOZ1A
	sta VOZ1B
pez_fx_end:		
	rts		

roca_fx:
	lda #1
	sta roca_suena
	lda #1
	sta roca_sonando
	rts
	
roca_fx_suena:
	lda roca_suena
	cmp #1
	bne roca_fx_end
	
	dec roca_sonando
	bne roca_fx_end
	lda #175
	
	sta roca_sonando
	ldy NOTA_ACT_ROCA	
	lda notas_pez, y
	sta VOZ2A
	iny	
	lda notas_pez, y
	sta VOZ2B
	cpy #17
	beq roca_fx_fin
	sty NOTA_ACT_ROCA
	jmp roca_fx_end
roca_fx_fin:
	lda #0
	sta VOZ2A
	sta VOZ2B
	sta roca_suena
	sta NOTA_ACT_ROCA
roca_fx_end:		
	rts		

fin_musica:
	lda #0
	sta VOZ1A
	sta VOZ1B
	sta VOZ2A
	sta VOZ2B
	sta VOZ3A
	sta VOZ3B
	sta PULSOB1
	sta PULSOA1
	sta PULSOB2
	sta PULSOA2
	sta PULSOB3
	sta PULSOA3
	rts	
	