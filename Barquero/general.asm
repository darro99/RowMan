//FunciOn para cargar la bandera del personaje a muerto
//ParAmetros:
//	Registro X. 1. EstA muerto/ 0. EstA vivo
/*set_dead:
	stx vars_game.is_dead
	rts*/

//FunciOn para obtener la bandera del personaje muerto
//Retorno:
//	Registro X. 1. EstA muerto/ 0. EstA vivo
get_dead:
	ldx vars_game.is_dead
	rts	

//FunciOn para la gestiOn de vidas del juego	
muerte:
	lda #2
	sta BORDER
	lda #SP_PBDEAD			//Se pone el sprite de hundido
	sta SP_POINTER	
	ldx #MUERTO				//Se pone la bandera de muerto
	stx vars_game.is_dead
	rts
game_over:
	ldx #GAMEOVER			//Se pone la bandera de Game Over
	stx vars_game.is_dead
	rts	
	
principal:
	ldx vars_game.is_dead
	cpx #VIVO
	beq fin_principal
	cpx #MUERTO
	bne gameo_prin
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
gameo_prin:	
fin_principal:
	rts	
	
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