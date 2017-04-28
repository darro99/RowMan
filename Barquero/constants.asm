.const BORDER = $d020
.const BACKGROUND = $d021

//address of the screen buffer
.const SCREEN_CHAR	= $0400

//address of color ram
.const SCREEN_COLOR = $D800

//Varibales de juego
.namespace vars_game{
	.label nivel	= $0B
	.label vidas	= $14
	.label is_dead  = $15	//2.Game Over/ 1. EstA muerto/ 0. EstA vivo
	.label fire		= $16	//Bandera de fuego pulsado
	.label num_final= $1C	//Indica el nUmero de final en el que se encuentra el juego
	.label est_final= $1D	//Estado del final actual	
}
.const VIVO 	 = 0
.const MUERTO 	 = 1
.const INICIO    = 2
.const GAMEOVER  = 3
.const FIN_JUEGO = 4

.const NUMVIDAS = 3

//Variables para el pintado y animaciOn del agua
.namespace vars_agua {
	.label linea  = $08
	.label delay  = $09
	.label DELAY  = $28	
	.label cont	  = $0A
	.label CONT	  = $27
}
.const CHAR_AGUA			   = 86//98
.const CHAR_AGUA_PROF		   = 85//102


//Variables para el pintado de las cueva
//XXX: Sobreescriben a los PARAM del 1 al 5
.namespace vars_cueva{
	.label x		= $03
	.label y   		= $04
	.label caracter = $05
	.label color	= $06
	.label ancho	= $07
	.label ancho_min= $11	//Son el mismo nUmero, ancho_min es para las
	.label lineas   = $11	//cuevas y estalactitas. lineas para bloque
	.label direccion= $12
	.label sentido	= $13 
	.label car_actu = $28
}
//Banderas que indican el sentido de los salientes/estalactitas
.const UP		  = 0
.const DOWN		  = 1
.const RIGHT	  = 0
.const LEFT		  = 1
//Etiquetas para formar cada uno de los niveles
.const TEXTO	  = 0		//Escribe texto en el nivel
.const SALIENTE	  = 1		//Tipo de cueva
.const ESTALACT	  = 2		//Tipo de cueva
.const BLOQUE	  = 3		//Tipo de cueva
.const JUGADOR	  = 4		//Inicio del jugador
.const DELAY	  = 5		//Retardo del agua
.const MONEDA	  = 6		//Modenilla
.const TESORO	  = 7		//Tesorete
.const ROCA		  = 8		//Roca
.const ROCABMS	  = 9		//Roca (desplazada mas de 255)
.const SALARRI	  = 10		//Salida hacia arriba
.const SALIZQU	  = 11		//Salida hacia la izquierda
.const SALDERE	  = 12		//Salida hacia la derecha
.const SALIDAD	  = 13		//Salida hacia la derecha y una pantalla indicada
.const SALIDAI	  = 14		//Salida hacia la izquierda y una pantalla indicada
.const SALIDAA	  = 15		//Salida hacia la izquierda y una pantalla indicada
.const BTESOROS   = 16		//Bloque de monedillas
.const BMONEDAS   = 17		//Bloque de tesoros
.const FIN_NIVEL  = 18		//Fin de nivel
.const JUGADORBMS = 19		//Inicio del jugador con bms
.const FINJUEGO   = 20		//Pantalla final
.const TEXTOCOLOR = 21		//Texto con color
.const NOFISH 	  = 22		//No aparece el pecao

//Array de las acciones para formar los niveles
.const ACTIONS = List().add(
  carga_texto,	
  carga_saliente,
  carga_estalac,
  carga_bloque,
  carga_jugador,
  carga_delay,
  carga_moneda,
  carga_tesoro,
  carga_roca,
  carga_roca_bms,
  carga_sal_arr,
  carga_sal_izq,
  carga_sal_der,
  carga_sal_dp,
  carga_sal_ip,
  carga_sal_ap,
  carga_btesoros,
  carga_bmonedas,
  fin_nivel,
  carga_jugador_bms,
  carga_finjuego,
  carga_texto_color,
  carga_nofish
).lock()

.const INITS = List().add(
	pant_init,
	instrucci,
	init_game
).lock() 

//Array de las acciones para formar los finales
.const ENDS = List().add(
	final_0,
	final_1,
	final_2
).lock()

.const FINALES = List().add(
	finales_0,
	finales_1,
	finales_2
).lock()

.const FINAL_1 = List().add(
	final_1_oni,
	final_1_barca,
	final_1_sefue
).lock()

.const FINAL_2 = List().add(
	final_2_rocas,
	final_2_end
).lock()

.const MOVPEZ = List().add(
	pez_sale,
	pez_frame_1,
	pez_frame_2,
	pez_frame_3,
	pez_entra,
	pez_puntua
).lock()	

//Carcateres para formar la cueva
.const CHAR_CAVE_ID_RIGHT	   = 76//95		// '\'
.const CHAR_CAVE_ID_LEFT	   = 78//233	// '/'
.const CHAR_CAVE_DI_RIGHT	   = 77//105	// '\'
.const CHAR_CAVE_DI_LEFT	   = 79//223	// '/'
.const CHAR_CAVE_INIT		   = 80		//Caracter incio de las cuevas
.const CHAR_CAVE_END		   = 83		//Caracter + 1 fin de las cuevas
.const CHAR_CAVE_SAL_A		   = 98
.const CHAR_CAVE_SAL_I		   = 99
.const CHAR_CAVE_SAL_D		   = 100

.const CHAR_VACIO			   = 74//32
.const CHAR_MONEDA			   = 96
.const CHAR_TESORO			   = 97
.const CHAR_FONDO			   = 83
.const CHAR_FONDO_FIN	 	   = 84

//Variables para el manejo de los sprites
.namespace sprites{
.label delay_barca 	=$0C
.label frame_barca  =$0D
.label dir_barca	=$0E
.label init_anim	=$0F
.label delay_anim	=$10
.label puntero_roca =$29
.label num_roca 	=$2A
.label desp_roca	=$2B
}

.namespace pez{	
.label delay		=$2E
.label frame		=$2F
.label vivo			=$30
.label x			=$31
.label y    		=$32
.label max_delay   	=$33	
}
//Direcciones de sprites
.const SP_POSITION = $d000	//DirecciOn desde la cual se posicionan los sprites
.const SP_ENBABLE  = $d015	//DirecciOn para habilitar sprites
.const SP_PCOLOR   = $d027	//DirecciOn a partir de la cual se asignan los colores principales de los sprites
.const SP_POINTER  = $07f8	//DirecciOn a partir de la cual se asignan los punteros de los sprites
.const SP_PINIT    = $A6	//Inicio de los punteros de los sprites
							//Inicio del puntero de la barca hacia la izquierda	
.const SP_PBRIGHT  = $A9	//Inicio del puntero de la barca hacia la derecha
.const SP_PBDEAD   = $AC	//Inicio del puntero de la barca hundida
.const SP_PROCK    = $AE	//Inicio del puntero de la roca
.const SP_PROCK_FIN= $B1	//Fin del puntero de la roca
.const SP_FISH_R   = $B2	//Inicio pez derecha
.const SP_FISH_L   = $B7	//Inicio pez izquierda
.const SP_MCOLOR   = $d01c	//DirecciOn para asignar el multicolor a los sprites
.const SP_COLOR1   = $d025	//DirecciOn para asignar el color 1 de los sprites multicolores
.const SP_COLOR2   = $d026	//DirecciOn para asignar el color 2 de los sprites multicolores
.const SP_BMS	   = $d010  //DirecciOn para comprobar el bit mas significativo
.const SP_COLI	   = $d01e	//DirecciOn para comprobar colisiones entre sprites 

.const joy_state   = $2C
.const joy_p_state = $2D

.const JOY_PORT2 = $dc00
//Constantes para saber cual es movimiento del joystick
.const JOY_UP     = %00000001
.const JOY_DOWN   = %00000010
.const JOY_LEFT   = %00000100
.const JOY_RIGHT  = %00001000
.const JOY_BUTTON = %00010000
.const JOY_NEUTRAL= %00011111

//placeholder for various temp .const PARAMeters
.const PARAM1                  = $03
.const PARAM2                  = $04
.const PARAM3                  = $05
.const PARAM4                  = $06
.const PARAM5                  = $07
.const PARAM6	               = $1B

//placeholder for zero page pointers
.const ZEROPAGE_POINTER_1      = $17	//$17-$18
.const ZEROPAGE_POINTER_2      = $19	//$19-$1A
.const ZEROPAGE_POINTER_3      = $21	//$21-$22
.const ZEROPAGE_POINTER_4      = $23	//$23-$24
.const ZEROPAGE_POINTER_5      = $25	//$25-$26
  