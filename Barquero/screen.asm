init_screen:
	lda $d018
	ora #$0e  // set chars location to $3800 for displaying the custom font
	sta $d018 // Bits 1-3 ($400+512bytes * low nibble value) of $d018 sets char location
	          // $400 + $200*$0E = $3800
	
	ldx #$0C
	stx $d022
					 
	ldx #$09
	stx $d023
					 
	lda $d016 
//and #$ef ; turn off multicolor for characters by cleaing Bit#4 of $D016
	ora #$10 // Activa el multicolor de los caracteres
	sta $d016
	rts


//FunciOn para pintar una lInea en la pantalla
//ParAmetros: 
//	ZEROPAGE_POINTER_1 direcciOn de la pantalla donde pintar
// 	ZEROPAGE_POINTER_2 direcciOn de la pantalla donde colorear
//	PARAM3 Caracter a pintar en la pantalla
//  PARAM4 Color con el que colorear la pantalla
//  PARAM5 Tamagno de la lInea
pinta_w:
	ldy #$0
agua_pinta:
	lda PARAM3
	sta (ZEROPAGE_POINTER_1),y
	lda PARAM4
	sta (ZEROPAGE_POINTER_2),y
	iny
	cpy PARAM5
	bne agua_pinta
	rts
	
pinta_c:
	ldy #$0
	ldx vars_cueva.car_actu
pinta_carac:
	stx PARAM3
	lda PARAM3
	sta (ZEROPAGE_POINTER_1),y
	lda PARAM4
	sta (ZEROPAGE_POINTER_2),y
	inc vars_cueva.car_actu
	inx
	cpx #CHAR_CAVE_END
	bne psum_y
	ldx #CHAR_CAVE_INIT
	stx vars_cueva.car_actu
psum_y:	
	iny
	cpy PARAM5
	bne pinta_carac
	rts
	

//FunciOn para obtener las dieccines donde pintar y colorear
//ParAmetros:
// 	 PARAM1 (X)
//	 PARAM2 (Y) 
//Retorno:
//	ZEROPAGE_POINTER_1 direcciOn de la pantalla donde pintar
// 	ZEROPAGE_POINTER_2 direcciOn de la pantalla donde colorear
get_linea:
	ldx PARAM2
    lda tabla_screen_lo,x
    sta ZEROPAGE_POINTER_1
    sta ZEROPAGE_POINTER_2
    lda tabla_screen_hi,x
    sta ZEROPAGE_POINTER_1 + 1
    clc
    adc #[ [ SCREEN_COLOR - SCREEN_CHAR ] & $ff00 ] >> 8
    sta ZEROPAGE_POINTER_2 + 1
	
	lda ZEROPAGE_POINTER_1
	clc
	adc PARAM1
	sta ZEROPAGE_POINTER_1
    lda ZEROPAGE_POINTER_1 + 1
    adc #0
    sta ZEROPAGE_POINTER_1 + 1
	
	lda ZEROPAGE_POINTER_2
	clc
	adc PARAM1
	sta ZEROPAGE_POINTER_2
    lda ZEROPAGE_POINTER_2 + 1
    adc #0
    sta ZEROPAGE_POINTER_2 + 1
	rts

//FunciOn para rellenar la pantalla con un caracter
//ParAmetros:
//	PARAM1: caracter con el cual se rellena
//	PARAM2: color del caracter	
borra_pant:
	ldx #0
loop_pant:	
	lda PARAM1
	sta $0400,x
	sta $0500,x
	sta $0600,x
	sta $0700,x	
	lda PARAM2
	sta $d800,x
	sta $d900,x
	sta $da00,x
	sta $db00,x
	inx
	bne loop_pant
	rts

//Funcio para borrar sOlo la lInea de la puntuaciOn
borra_lin_p:
	ldx #39
loop_b_p:
	lda #CHAR_VACIO
	sta $0400,x
	dex
	bne loop_b_p
	ldx #0
	sta $0400,x
	rts		

//FunciOn para comprobar si el caracter marcado por el puntero
//forma parte de la cueva o no.
//ParAmetros:
//	ZEROPAGE_POINTER_1 que contiene la direcciOn de la pantalla a comprobar	
set_caracter:
	ldy #0
	lda (ZEROPAGE_POINTER_1),y
	cmp #CHAR_MONEDA
	bne !sig_caracter+
	ldx #1
	stx PARAM3
	ldx #4
	stx PARAM4
	jmp puntos
!sig_caracter:
	cmp #CHAR_TESORO
	bne !sig_caracter+	
	ldx #2
	stx PARAM3
	ldx #4
	stx PARAM4
puntos:
	lda #CHAR_FONDO
	sta (ZEROPAGE_POINTER_1),y
	lda #14
	sta (ZEROPAGE_POINTER_2),y
	jsr puntua
	jsr m_puntuacion
	jmp no_com_down
!sig_caracter:	
	cmp #CHAR_CAVE_SAL_D
	bne !sig_caracter+		
	ldx #2
	jmp nuevo_niv	
!sig_caracter:	
	cmp #CHAR_CAVE_SAL_I
	bne !sig_caracter+		
	ldx #1
	jmp nuevo_niv	
!sig_caracter:	
	cmp #CHAR_CAVE_SAL_A
	bne !sig_caracter+	
	ldx #0
nuevo_niv:	
	lda salidas_l, x
	sta vars_game.nivel
	jsr oculta_rocas
	jsr gen_niveles
	jsr init_agua
no_com_down:	
	lda #255 	//Esto es para que no haga
	sta PARAM5	//la comprobaciOn del carcater de abajo
	rts
!sig_caracter:	
	cmp #CHAR_FONDO
	bne !sig_caracter+
	rts
!sig_caracter:
	jsr muerte	 
	rts

marcadores:
	jsr borra_lin_p

	lda #255
	sta ZEROPAGE_POINTER_4

	ldx #36				//Escribe en la pantalla en nUmero de vidas
	stx PARAM1
	ldy #0
	sty PARAM2
	jsr get_linea
	ldy #0
	lda vars_game.vidas
	sta (ZEROPAGE_POINTER_1),y
	lda #7
	sta (ZEROPAGE_POINTER_2),y
	
	ldx #6				//Escribe en la pantalla en nUmero de nivel
	stx PARAM1
	jsr get_linea
	lda vars_game.nivel
	sta (ZEROPAGE_POINTER_1),y
	lda #7
	sta (ZEROPAGE_POINTER_2),y
	
	
	lda #$C0		//Escribe en la pantalla el literal 'Vidas'
	sta ZEROPAGE_POINTER_3 + 1
	lda #$5E			
	sta ZEROPAGE_POINTER_3
	lda #30
	sta PARAM1
	jsr get_linea
	jsr print_txt
	jsr m_puntuacion
	rts
	
m_puntuacion:
	lda #17
	sta PARAM1
	lda #0
	sta PARAM2
	lda #$58		//Escribe en la pantalla la puntuaciOn
	sta ZEROPAGE_POINTER_3
	lda #$C0
	sta ZEROPAGE_POINTER_3 + 1
	lda #57
	sta ZEROPAGE_POINTER_4
	jsr get_linea
	jsr print_txt
	rts
	
print_txt:
	ldy #0
init_txt:	
	lda (ZEROPAGE_POINTER_3),y
	cmp ZEROPAGE_POINTER_4
	beq fin_print
	sta (ZEROPAGE_POINTER_1),y
	lda #1
	sta (ZEROPAGE_POINTER_2),y
	iny
	jmp init_txt
fin_print:
	rts			 	