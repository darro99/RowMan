
//FunciOn para la gestiOn de vidas del juego	
muerte:
	lda #2
	sta BORDER
	lda #SP_PBDEAD			//Se pone el sprite de hundido
	sta SP_POINTER	
	ldx #MUERTO				//Se pone la bandera de muerto
	stx vars_game.is_dead
	lda #0
	sta roca_suena
	jsr fin_musica
	rts
	
game_over:
	jsr music.init  
	ldy #NUMVIDAS + 1
    sty vars_game.vidas
	lda #CHAR_VACIO
	sta PARAM1
	lda #1
	sta PARAM2
	sta SP_POSITION + 1 	//Oculta la barca
	jsr borra_pant
	jsr oculta_rocas
	jsr oculta_pez
	//Escribe en la pantalla el literal 'GAME OVER'
	:escribe($C0, $64, 16, 12, 255, 1) 
	jsr init_agua
	ldx #0
	stx vars_game.fire
	ldy #GAMEOVER			//Se pone la bandera de Game Over
	sty vars_game.is_dead
	rts	

//FunciOn para comprobar si el jugador estA muertesito
prin_muerto:	
	ldx vars_game.is_dead
	cpx #MUERTO
	bne fin_principal
	ldx vars_game.fire
	cpx #0
	beq fin_principal
	dec vars_game.vidas		//Se decremanetan la vidas
	beq game_over			//ComprobaciOn de Game Over
	jsr gen_niveles
	jsr init_agua
	ldx #0
	stx BORDER
	rts
	
principal:
	ldx vars_game.is_dead
	cpx #INICIO
	beq gameo_prin
	cpx #GAMEOVER
	beq comp_go
	cpx #FIN_JUEGO
	beq finales_prin
	rts
		
comp_go:
	ldx vars_game.fire
	cpx #0
	beq fin_comp_go
	ldx #INICIO
	stx vars_game.is_dead
	ldx #0
	stx BORDER
	stx $d017			//Vuelve a su tagano original todo (culpa de los finales)
	stx $d01d
	stx SP_POSITION + 2 //Por si queda una piedra (culpa de los finales)
	stx vars_game.est_final
	stx vars_game.fire  
	jsr pant_init
	jsr init_pez
	jsr pez_sale
fin_comp_go:	
	rts		
	
gameo_prin:
	ldx vars_game.fire
	cpx #0
	beq fin_principal
	ldx vars_game.est_final
	:rti_jump_using_x(inicios_actions)

fin_principal:
	rts
	
inicios_actions: :define_rti_jump_table(INITS)		
	
finales_prin:
	ldx vars_game.num_final
	:rti_jump_using_x(finales_actions)
	rts
	
//DefiniciOn de las acciones para los finales
finales_actions: :define_rti_jump_table(FINALES)	
	
//Función para sumar el contador. 
//Parámetros: 
//	puntuacion:	Dirección donde está la puntuación 
//  PARAM3:     Número de puntos (1-9) 
//  PARAM4:     Lugar del array donde añadir el punto (5-0, siendo 5 las unidades) 
puntua:         
	ldy PARAM4 
haz_puntos:         
    lda puntuacion, y   //Carga el número del array
	clc 
    adc PARAM3 			//Se le suma la cantidad 
    cmp #10 
    bcs salto           //Si es >= 10 
    sta puntuacion, y
    rts 
salto: 
    sbc #10             //Se le resta 10 para quedarse con las unidades 
    sta puntuacion, y   //Se carga en el array 
    dey                 //Se mueve el puntero hacia la siguiente cantidad 
    lda #1 
    sta PARAM3          //Se asigna 1 (El acarreo)         
    jmp haz_puntos 	
	
pant_init:
	lda #CHAR_VACIO
	sta PARAM1
	lda #1
	sta PARAM2
	jsr borra_pant
	
	lda #INICIO
	sta vars_game.is_dead  
	lda #0
	sta vars_game.nivel
	jsr solo_init
	jsr init_agua
	
	inc vars_game.est_final
	ldx #0
	stx vars_game.fire  
	rts
	
instrucci:
	sta SP_POSITION + 15
	lda #CHAR_VACIO
	sta PARAM1
	lda #1
	sta PARAM2
	jsr borra_pant
	lda #37
	sta vars_game.nivel
	jsr solo_init
	inc vars_game.est_final
	ldx #0
	stx vars_game.fire  
	rts	
	
	
init_game:
	jsr fin_musica
	jsr init_fx
	ldy #NUMVIDAS
    sty vars_game.vidas
    lda #30
    sta pez.max_delay
	lda #4					//Se reinicia el juego,
	sta vars_game.nivel		//PERO DEBERiA DE IR A PANTALLA PRINCIPAL

	ldy #5
	lda #0
	init_puntuacion:
	sta puntuacion, y
	dey 
	bne init_puntuacion

	jsr gen_niveles
	jsr init_agua
	
	rts	

////////////////////////////////////////////////////////////
//				MACROS									  //
////////////////////////////////////////////////////////////
	
.macro escribe(byte_bajo, byte_alto, x, y, fin, color) {
	lda #byte_bajo		
	sta ZEROPAGE_POINTER_5 + 1
	lda #byte_alto			
	sta ZEROPAGE_POINTER_5
	lda #x
	sta PARAM1
	lda #y
	sta PARAM2
	lda #fin
	sta ZEROPAGE_POINTER_4
	lda #color
	sta vars_cueva.color
	jsr get_linea
	jsr print_txt
}

//Macro para las redirecciones de la tabla de funciones
//Fuente 64bites.com
//ParAmetro: Tabla de funciones
.macro rti_jump_using_x(rti_jump_table) {
  lda rti_jump_table.actions_msb, X
  pha
  lda rti_jump_table.actions_lsb, X
  pha
  php
  rti
}

//Macro para el relleno de la tabla de funciones de 
//creaciOn de niveles
//Fuente 64bites.com
//ParAmetro: Array de funciones
.macro define_rti_jump_table(actions) {
  actions_lsb:
    .fill actions.size(), <actions.get(i)

  actions_msb:
    .fill actions.size(), >actions.get(i)
}		    