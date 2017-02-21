gen_niveles:
	
	lda #0					
	sta SP_BMS				//Se iguala a cero el BMS	
	sta vars_game.is_dead	//Se cambia a vivo el personaje
    sta vars_game.fire 		//Se resetea el disparo
	sta sprites.puntero_roca
	sta sprites.num_roca
	ldy #1					//Se resetea el retardo de la barca
	sty sprites.delay_barca
	sty sprites.desp_roca
	ldx #24					//Se marca el principio del nivel de agua
	stx vars_agua.linea
	
	lda #CHAR_FONDO
	sta PARAM1
	lda #14
	sta PARAM2
	jsr borra_pant		//Borra la pantalla
	
	jsr marcadores		//Regenera los marcadores
	ldx #CHAR_CAVE_INIT	//Se inicializa el caracter para formar cuevas
	stx vars_cueva.car_actu

	lda vars_game.nivel	//Empieza la lectura del nivel
	asl					//Se multiplica por dos, por eso los niveles empiezan en cero
	tax 
	lda pantallas,x
	sta ZEROPAGE_POINTER_3
	lda pantallas + 1,x
	sta ZEROPAGE_POINTER_3 + 1
	ldy #255
	
niv_prin:
	iny
	lda (ZEROPAGE_POINTER_3), y
	cmp #SALIENTE
	bne !siguiente+
	jmp carga_saliente
!siguiente:
	cmp #ESTALACT
	bne !siguiente+
	jmp carga_estalac
!siguiente:	
	cmp #BLOQUE
	bne !siguiente+
	jmp carga_bloque
!siguiente:
	cmp #MONEDA
	bne !siguiente+
	jmp carga_moneda
!siguiente:
	cmp #TESORO
	bne !siguiente+
	jmp carga_tesoro	
!siguiente:	
	cmp #JUGADOR
	bne !siguiente+
	jmp carga_jugador
!siguiente:	
	cmp #ROCA
	bne !siguiente+
	jmp carga_roca
!siguiente:	
	cmp #ROCABMS
	bne !siguiente+
	jmp carga_roca_bms
!siguiente:
	cmp #SALARRI
	bne !siguiente+
	jmp carga_sal_arr
!siguiente:
	cmp #SALIZQU
	bne !siguiente+
	jmp carga_sal_izq
!siguiente:
	cmp #SALDERE
	bne !siguiente+
	jmp carga_sal_der
	
!siguiente:
	cmp #SALIDAD
	bne !siguiente+
	jmp carga_sal_dp
							
!siguiente:	
	cmp #DELAY
	bne !siguiente+
	jmp carga_delay
!siguiente:	
	cmp #FIN_NIVEL
	bne niv_prin
	lda #0
	sta sprites.puntero_roca
	rts

carga_saliente:
	jsr carga_gen
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.ancho_min
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.direccion
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.sentido
	sty ZEROPAGE_POINTER_5
	jsr haz_cueva
	ldy ZEROPAGE_POINTER_5
	jmp niv_prin
	
carga_estalac:
	jsr carga_gen
	lda #2
	sta vars_cueva.ancho_min
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.sentido
	sty ZEROPAGE_POINTER_5
	jsr estalac
	ldy ZEROPAGE_POINTER_5
	jmp niv_prin	

carga_bloque:
	jsr carga_gen
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.lineas
	sty ZEROPAGE_POINTER_5
	jsr bloque
	ldy ZEROPAGE_POINTER_5
	jmp niv_prin	
	
carga_gen:
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.x
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.y
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.color
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.ancho
	rts	

carga_jugador:
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta SP_POSITION
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta SP_POSITION + 1
	lda #0
	sta sprites.delay_anim
	sta sprites.frame_barca
	lda #SP_PINIT
	sta sprites.init_anim
	sta SP_POINTER
	lda #LEFT
	sta sprites.dir_barca
	lda SP_COLI
	and #$00
	sta SP_COLI
	jmp niv_prin
	
carga_delay:
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_agua.DELAY
	sta vars_agua.delay
	iny 
	lda (ZEROPAGE_POINTER_3),y
	sta vars_agua.CONT
	sta vars_agua.cont
	jmp niv_prin
	
carga_moneda:
	jsr carga_obj_gen
	lda #CHAR_MONEDA
	sta (ZEROPAGE_POINTER_1),y
	lda #15
	sta (ZEROPAGE_POINTER_2),y
	ldy ZEROPAGE_POINTER_5
	jmp niv_prin  
	
carga_tesoro:
	jsr carga_obj_gen
	lda #CHAR_TESORO
	sta (ZEROPAGE_POINTER_1),y
	lda #11
	sta (ZEROPAGE_POINTER_2),y
	ldy ZEROPAGE_POINTER_5
	jmp niv_prin  

carga_obj_gen:
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta PARAM1
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta PARAM2
	sty ZEROPAGE_POINTER_5
	jsr get_linea
	ldy #0
	rts
		
carga_roca_bms:
	asl sprites.desp_roca
	lda SP_BMS
	eor sprites.desp_roca
	sta SP_BMS
		
carga_roca:
	ldx sprites.puntero_roca
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta SP_POSITION + 2, x
	inx
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta SP_POSITION + 2, x	
	inx
	stx sprites.puntero_roca
	ldx sprites.num_roca
	sta rocas_y, x	
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta rocas_vel, x
	inx
	lda #SP_PROCK
	sta SP_POINTER, x
	inc sprites.num_roca
	jmp niv_prin

carga_sal_arr:
	lda vars_game.nivel
	clc
	adc #5
	sta vars_cueva.sentido
	lda #0
	jsr carga_salida_gen
	lda #CHAR_CAVE_SAL_A_1
	sta vars_cueva.caracter
	jsr prin_salida_a
	ldy ZEROPAGE_POINTER_5
	jmp niv_prin 
	
carga_sal_izq:
	lda vars_game.nivel
	sta vars_cueva.sentido
	dec vars_cueva.sentido
	lda #1
	jsr carga_salida_gen
	lda #CHAR_CAVE_SAL_I
	jmp fin_carga_sal
	  

carga_sal_dp:
	iny
	lda (ZEROPAGE_POINTER_3),y	//Carga la pantalla que queremos
	sta vars_cueva.sentido
	jmp carga_sal_dns			
		  
carga_sal_der:
	lda vars_game.nivel
	sta vars_cueva.sentido
	inc vars_cueva.sentido
carga_sal_dns:		
	lda #2
	jsr carga_salida_gen
	lda #CHAR_CAVE_SAL_D
fin_carga_sal:
	sta vars_cueva.caracter
	jsr prin_salida_b
	ldy ZEROPAGE_POINTER_5
	jmp niv_prin  
	
carga_salida_gen:
	sta vars_cueva.direccion
	jsr carga_obj_gen
	
	ldy ZEROPAGE_POINTER_5
	iny
	lda (ZEROPAGE_POINTER_3),y
	sta vars_cueva.ancho	
	//iny
	//lda (ZEROPAGE_POINTER_3),y
	lda vars_cueva.sentido
	ldx vars_cueva.direccion
	sta salidas_l, x
	lda #14
	sta vars_cueva.color
	sty ZEROPAGE_POINTER_5
	rts					