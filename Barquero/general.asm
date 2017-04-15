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
	lda #CHAR_VACIO
	sta PARAM1
	lda #1
	sta PARAM2
	sta SP_POSITION + 1 	//Oculta la barca
	jsr borra_pant
	jsr oculta_rocas
	//Escribe en la pantalla el literal 'GAME OVER'
	:escribe($C0,$64,16,12) 
	jsr init_agua
	ldx #0
	stx vars_game.fire
	jsr music.init  
	rts	
	
principal:
	ldx vars_game.is_dead
	cpx #VIVO
	beq fin_principal
	cpx #INICIO
	beq gameo_prin
	cpx #GAMEOVER
	beq comp_go
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
	
comp_go:
	ldx vars_game.fire
	cpx #0
	beq fin_principal
	ldx #INICIO
	stx vars_game.is_dead
	ldx #0
	stx vars_game.fire  
	jsr pant_init
	rts		
	
gameo_prin:
	ldx vars_game.fire
	cpx #0
	beq fin_principal
	
	jsr fin_musica
	ldx #0
	stx BORDER
	
	ldy #NUMVIDAS
    sty vars_game.vidas
	lda #4					//Se reinicia el juego,
	sta vars_game.nivel		//PERO DEBERiA DE IR A PANTALLA PRINCIPAL
	jsr gen_niveles
	jsr init_agua
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

fin_musica:
	ldx #0
loop_f_musica:	
	lda #0
	sta $D400,x
	inx
	cpx #25
	bne loop_f_musica
	lda #5
	sta BORDER
	rts
	
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
	
	:escribe($C0, $6E, 17,  5)	//ROWMAN
	:escribe($C0, $75,  9,  8)	//Programado por
	:escribe($C0, $8C,  9, 12)	//GrAficos por
	:escribe($C0, $A8,  9, 16)	//MUsica por
	:escribe($C0, $A3, 18, 19)	//2017
	:escribe($C0, $C0,  0,  0)	//VersiOn
	
	ldx #0
	stx vars_game.fire  
	rts
	
.macro escribe(byte_bajo, byte_alto, x, y) {
	lda #byte_bajo		//Escribe en la pantalla el literal 'GAME OVER'
	sta ZEROPAGE_POINTER_3 + 1
	lda #byte_alto			
	sta ZEROPAGE_POINTER_3
	lda #x
	sta PARAM1
	lda #y
	sta PARAM2
	lda #255
	sta ZEROPAGE_POINTER_4
	jsr get_linea
	jsr print_txt
}		    