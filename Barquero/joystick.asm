joystick:
	
	jsr get_dead
	cpx #VIVO
	bne comp_fire
	
	inc sprites.delay_barca
	lda sprites.delay_barca
	cmp #100
	bne end_joy
	lda #0
	sta sprites.delay_barca
		
	lda JOY_PORT2 
  	and #JOY_LEFT
 	bne !no_action+
!action:
	jsr mov_left
	jmp end_joy
!no_action:
  	lda JOY_PORT2 
 	and #JOY_RIGHT
	bne !no_action+
!action:
	jsr mov_right	
!no_action:
	lda JOY_PORT2 
 	and #JOY_UP
	bne !no_action+
!action:
	jsr mov_up
!no_action:	
end_joy:
	rts	
	
comp_fire:
	lda vars_game.fire
	cmp #1
	beq comp_f_end
	lda JOY_PORT2 
	and #JOY_BUTTON
	bne comp_f_end 
	lda #1
	sta vars_game.fire
comp_f_end:	
	lda #0
	sta JOY_PORT2
	rts
	
mov_up:
	ldx #1
	stx vars_agua.cont
	stx vars_agua.delay	
	rts		