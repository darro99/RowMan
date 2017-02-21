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
}
.const VIVO 	= 0
.const MUERTO 	= 1
.const GAMEOVER = 2

//Variables para el pintado y animaciOn del agua
.namespace vars_agua {
	.label linea  = $08
	.label delay  = $09
	.label DELAY  = $28	
	.label cont	  = $0A
	.label CONT	  = $27
}
.const CHAR_AGUA			   = 80//98
.const CHAR_AGUA_PROF		   = 81//102


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
.const FIN_NIVEL  = 255		//Fin de nivel
//Carcateres para formar la cueva
.const CHAR_CAVE_ID_RIGHT	   = 76//95		// '\'
.const CHAR_CAVE_ID_LEFT	   = 78//233	// '/'
.const CHAR_CAVE_DI_RIGHT	   = 77//105	// '\'
.const CHAR_CAVE_DI_LEFT	   = 79//223	// '/'
.const CHAR_CAVE_INIT		   = 82		//Caracter incio de las cuevas
.const CHAR_CAVE_END		   = 96		//Caracter + 1 fin de las cuevas
.const CHAR_CAVE_SAL_D		   = 98		//Caracter incio salida derecha 
.const CHAR_CAVE_SAL_I		   = 101	//Caracter incio salida izquierda
.const CHAR_CAVE_SAL_A_1	   = 101	//Caracter salida arriba 1
.const CHAR_CAVE_SAL_A_2	   = 104	//Caracter salida arriba 2
.const CHAR_CAVE_SAL_A_3	   = 98		//Caracter salida arriba 3
.const CHAR_CAVE_SAL_DC		   = 99
.const CHAR_CAVE_SAL_IC		   = 102

.const CHAR_VACIO			   = 74//32
.const CHAR_MONEDA			   = 96
.const CHAR_TESORO			   = 97
.const CHAR_FONDO			   = 105

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
.const SP_MCOLOR   = $d01c	//DirecciOn para asignar el multicolor a los sprites
.const SP_COLOR1   = $d025	//DirecciOn para asignar el color 1 de los sprites multicolores
.const SP_COLOR2   = $d026	//DirecciOn para asignar el color 2 de los sprites multicolores
.const SP_BMS	   = $d010  //DirecciOn para comprobar el bit mas significativo
.const SP_COLI	   = $d01e	//DirecciOn para comprobar colisiones entre sprites 

.const JOY_PORT2 = $dc00
//Constantes para saber cual es movimiento del joystick
.const JOY_UP     = %00000001
.const JOY_DOWN   = %00000010
.const JOY_LEFT   = %00000100
.const JOY_RIGHT  = %00001000
.const JOY_BUTTON = %00010000

//placeholder for various temp .const PARAMeters
.const PARAM1                  = $03
.const PARAM2                  = $04
.const PARAM3                  = $05
.const PARAM4                  = $06
.const PARAM5                  = $07

//placeholder for zero page pointers
.const ZEROPAGE_POINTER_1      = $17	//$17-$18
.const ZEROPAGE_POINTER_2      = $19	//$19-$1A
.const ZEROPAGE_POINTER_3      = $21	//$1B-$1C
.const ZEROPAGE_POINTER_4      = $23	//$1D-$1E
.const ZEROPAGE_POINTER_5      = $25	//$1F-$20
  