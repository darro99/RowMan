esquinas:
	.byte CHAR_CAVE_ID_LEFT, CHAR_CAVE_ID_RIGHT, CHAR_CAVE_DI_LEFT, CHAR_CAVE_DI_RIGHT		 
pantallas:
	.word NIVEL0, NIVEL1 
	.word NIVEL2,  NIVEL3,  NIVEL4,  NIVEL5, NIVEL6
	.word NIVEL7,  NIVEL8,  NIVEL9,  NIVEL10, NIVEL11
	.word NIVEL12, NIVEL13, NIVEL14, NIVEL15, NIVEL16 //12 y 13 no monedas
	.word NIVEL17, NIVEL18, NIVEL19, NIVEL20, NIVEL21
	.word NIVEL22, NIVEL23, NIVEL24, NIVEL25, NIVEL26
	.word NIVEL27, NIVEL28, NIVEL29, NIVEL30, NIVEL31
	.word NIVEL32, NIVEL33, NIVEL34, NIVEL35, NIVEL36
	.word NIVEL37, NIVEL38, NIVEL39, NIVEL40, NIVEL41
	.word NIVEL42, NIVEL43, NIVEL44, NIVEL45, NIVEL46
	.word NIVEL47, NIVEL48, NIVEL49, NIVEL50, NIVEL51
	.word NIVEL52, NIVEL53, NIVEL54

//TEXTO,	x, y, byte alto, byte bajo
//SALIENTE, x, y, ancho, ancho_min,izq/der,up/down
//ESTALACT, x, y, ancho, up/down (el ancho SIEMPRE debe ser par)
//BLOQUE,   x, y, ancho, lineas
//JUGADOR,	x, y (La coordenada x SIEMPRE debe ser par))
//MODENA,	x, y
//ROCA,		x, y, velocidad 
//ROCABMS,	X, Y, velocidad Rocas para mas de 255 choche agua x>=17
//SALARRI,	x, y, ancho
//SALIZQU,	x, y, ancho
//SALDERE,	x, y, ancho
//SALIDAD,	pantalla, x, y, ancho
//SALIDAI,	pantalla, x, y, ancho
//SALIDAA,	pantalla, x, y, ancho
//BTESOROS, x, y, ancho, lineas
//BMONEDAS, x, y, ancho, lineas
//DELAY,	contador1, contador2 [SIEMPRE EL ULTIMO]	
//DefiniciOn de niveles
NIVEL0: //PORTADA
	.byte JUGADOR, 170,222
	//R ////////////////////////////////
	.byte BMONEDAS,  4,  1,  2, 1 	
	.byte MONEDA,    5,  1
	.byte MONEDA,    7,  2
	.byte MONEDA,    7,  3
	.byte BMONEDAS,  4,  1,  1, 4
	.byte BMONEDAS,  4,  2,  1, 4
	.byte BMONEDAS,  4,  4,  2, 1
	.byte MONEDA,    5,  4
	.byte BMONEDAS,  7,  5,  1, 2
	.byte BMONEDAS,  7,  6,  1, 2
	//O ////////////////////////////////
	.byte BMONEDAS, 10,  1,  2, 1 
	.byte MONEDA,   11,  1
	.byte BMONEDAS,  9,  2,  1, 3
	.byte BMONEDAS,  9,  3,  1, 2
	.byte MONEDA,    9,  7
	.byte BMONEDAS, 10,  8,  2, 1
	.byte MONEDA,   11,  8
	.byte BMONEDAS, 13,  2,  1, 3
	.byte BMONEDAS, 13,  3,  1, 2
	.byte MONEDA,   13,  7
	//W ////////////////////////////////
	.byte BMONEDAS, 15,  1,  1, 3 
	.byte BMONEDAS, 15,  2,  1, 3
	.byte MONEDA,   15,  7
	.byte BMONEDAS, 17,  1,  1, 3 
	.byte BMONEDAS, 17,  2,  1, 3
	.byte MONEDA,   17,  7
	.byte BMONEDAS, 19,  1,  1, 3 
	.byte BMONEDAS, 19,  2,  1, 3
	.byte MONEDA,   19,  7
	.byte MONEDA,   16,  8
	.byte MONEDA,   18,  8
	//M ////////////////////////////////
	.byte MONEDA,   22,  1			 
	.byte BMONEDAS, 21,  2,  1, 4 
	.byte BMONEDAS, 21,  3,  1, 3
	.byte BMONEDAS, 23,  2,  1, 2
	.byte MONEDA,   23,  3
	.byte MONEDA,   24,  1
	.byte BMONEDAS, 25,  2,  1, 4 
	.byte BMONEDAS, 25,  3,  1, 3
	//A ////////////////////////////////
	.byte BMONEDAS, 28,  1,  2, 1
	.byte MONEDA,   29,  1
	.byte BMONEDAS, 27,  2,  1, 4 
	.byte BMONEDAS, 27,  3,  1, 3 
	.byte BMONEDAS, 28,  4,  2, 1
	.byte MONEDA,   29,  4
	.byte BMONEDAS, 31,  2,  1, 4 
	.byte BMONEDAS, 31,  3,  1, 3 
	//N ////////////////////////////////
	.byte BMONEDAS, 33,  1,  1, 4 
	.byte BMONEDAS, 33,  2,  1, 4
	.byte MONEDA,   34,  2
	.byte MONEDA,   35,  3
	.byte BMONEDAS, 36,  1,  1, 4 
	.byte BMONEDAS, 36,  2,  1, 4
	///////////////////////////////////
	.byte TEXTO,     9, 12, $75, $C0
	.byte TEXTOCOLOR,10, 9, 14, $8C, $C0
	.byte TEXTOCOLOR, 6, 9, 16, $A8, $C0
	.byte TEXTO, 	33,  9, $C0, $C0
	.byte TEXTO, 	18, 19, $A3, $C0  
	.byte FIN_NIVEL
NIVEL1:
	.byte JUGADOR, 170,222
	.byte ROCA,   255, 64, 36
	.byte ROCA,    80, 60, 35
	.byte SALARRI,  2, 1, 34
	.byte SALIENTE, 0,  24, 15, 2, RIGHT,UP
	.byte SALIENTE, 25, 24, 15, 2, LEFT,UP
	.byte BLOQUE, 	0,   0,  2, 10
	.byte BLOQUE, 	38,  0,  2, 10
	.byte ESTALACT, 14, 0,  12, DOWN 	
	.byte BMONEDAS, 12,  6,  8, 5
	.byte BTESOROS,  7,  3,  2, 7
	.byte BTESOROS, 29,  3,  2, 7
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL2:
	.byte JUGADOR, 176,222
	.byte SALARRI,   1, 1, 36
	.byte BLOQUE, 	39,  0,  1, 23
	.byte BLOQUE, 	 0,  0,  1, 23
	.byte ESTALACT, 13, 12, 14, UP
	.byte BLOQUE, 	13, 11, 14,  5
	.byte BMONEDAS, 29,  2,  4, 10
	.byte BTESOROS, 30,  3,  4, 10
	.byte BTESOROS, 14, 18,  7,  2
	.byte BMONEDAS,  4,  2,  4, 10
	.byte BTESOROS,  3,  3,  4, 10			
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL3:
	.byte JUGADOR, 190,222
	.byte ROCABMS,  40, 32, 28
	.byte ROCA,    250, 30, 24	
	.byte ROCA,     60, 30, 28
	.byte SALARRI,   2,  1, 34
	.byte BMONEDAS,  2,  3, 18, 7
	.byte SALIDAI,   7,  0,  6,  5
	.byte ESTALACT,  7,  0, 22, DOWN
	.byte BLOQUE,  	 0,  0,  2,  5
	.byte BLOQUE,  	 0, 11,  4, 12
	.byte SALIENTE,  4, 24, 15,  2, RIGHT,UP
	.byte BLOQUE, 	38,  0,  2, 10
	.byte SALIENTE, 25, 24, 15, 2, LEFT,UP
	.byte TESORO,	18,	11
	.byte DELAY, 255, 50
	.byte FIN_NIVEL	
NIVEL4:
	.byte JUGADOR, 186,222	//Primero para que no interfiera con las rocas
	.byte ROCA,    120, 64, 25
	.byte ROCA,    175, 70, 30
	.byte ROCA,    225, 70, 25
	.byte SALDERE,  39, 1, 9
	.byte SALIZQU,   0, 1, 9
	.byte BMONEDAS,  1,  3, 19, 4			
	.byte SALIENTE,  0, 24, 15, 2, RIGHT,UP
	.byte SALIENTE, 25, 24, 15, 2, LEFT,UP
	.byte ESTALACT,  1,  0, 12, DOWN
	.byte ESTALACT, 14,  0, 12, DOWN
	.byte ESTALACT, 27,  0, 12, DOWN
	.byte BMONEDAS,  1,  7, 19, 2			
	.byte TESORO,	20,	 12
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL5:
	.byte JUGADOR, 186,222
	.byte ROCA,    120, 64, 20
	.byte ROCA,    175, 70, 30
	.byte ROCA,    225, 70, 25
	.byte SALARRI,  14,  1, 12
	.byte SALDERE,  39,  1,  9
	.byte SALIENTE, 0,   0, 15, 4, RIGHT,DOWN
	.byte SALIENTE, 0,  24, 15, 4, RIGHT,UP
	.byte SALIENTE, 25, 24, 15, 2, LEFT,UP
	.byte ESTALACT, 27, 0,  12, DOWN
	.byte BMONEDAS, 12, 10, 10, 3	
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL6:
	.byte JUGADOR, 210,222
	.byte ROCA,    190, 30, 45
	.byte SALARRI,  14,  1, 14
	.byte SALIENTE,  0, 24, 22, 10, RIGHT,UP
	.byte BLOQUE, 	 0,  0, 14, 11
	.byte SALIENTE, 10, 11,  4,  2, RIGHT,DOWN
	.byte BLOQUE, 	30,  0, 10, 23
	.byte BMONEDAS, 16,  5,  7,  6
	.byte BTESOROS, 20,  5,  3,  6	
	.byte DELAY, 255, 50
	.byte FIN_NIVEL	
NIVEL7:
	//.byte NOFISH
	.byte JUGADOR, 170,222
	.byte ROCA,    145, 10, 40
	.byte ROCA,    195, 10, 40
	.byte SALARRI,   4,  1, 14
	.byte SALIENTE, 20, 0, 20, 14, LEFT ,DOWN
	.byte BLOQUE, 	25, 5, 15, 18
	.byte SALIENTE,  0, 7, 13,  7, RIGHT,UP
	.byte BLOQUE, 	 0, 6, 13, 18
	.byte BMONEDAS, 19, 3,  1,  9			
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL8:
	.byte JUGADOR, 230,222
	.byte ROCA,     50, 30, 40
	.byte ROCA,    195, 10, 40
	.byte SALDERE,  37, 17,  7
	.byte SALIZQU,   0,  1, 22
	.byte BMONEDAS, 30, 18,  4, 3
	.byte BMONEDAS,  3,  1, 15, 5
	.byte ESTALACT,  1,  0, 16, DOWN
	.byte SALIENTE, 18,  0, 20, 4, LEFT ,DOWN
	.byte ESTALACT,  1, 24, 22, UP	
	.byte TESORO,	12,	13
	.byte DELAY, 200, 40
	.byte FIN_NIVEL	
NIVEL9:
	.byte JUGADOR, 170,222
	.byte ROCA,    228, 10, 40
	.byte ROCA,    116, 30, 40
	.byte SALARRI,   2,  1, 34
	.byte BMONEDAS,  3,  2, 15,  5
	.byte BTESOROS, 19, 12,  2,  2
	.byte SALIENTE, 25, 24, 15,  8, LEFT,UP
	.byte BLOQUE, 	32,  0,  8, 16
	.byte SALIENTE,  0, 24, 15,  8, RIGHT,UP
	.byte BLOQUE, 	 0,  0,  8, 16
	.byte ESTALACT, 12,  0, 16, DOWN
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL10:
	.byte JUGADOR, 170,222
	.byte ROCA,     70, 40, 15
	.byte ROCA,    180, 10, 40
	.byte SALARRI,   2,  1, 34
	.byte SALIZQU,   0, 12,  7
	.byte SALIENTE, 20,  0, 20, 12, LEFT ,DOWN
	.byte BLOQUE, 	28,  7, 12, 16
	.byte SALIENTE,  0,  7, 13,  7, RIGHT,UP
	.byte BLOQUE, 	 0,  6, 13,  5
	.byte BLOQUE, 	 0, 19, 13,  4
	.byte BMONEDAS, 19,  4,  2,  8
	.byte BTESOROS,  4, 14,  1,  3
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL11:
	.byte JUGADOR, 170,222
	.byte ROCA,     173, 40, 30
	.byte ROCA,     121, 40, 40
	.byte ROCA,     220, 40, 40
	.byte SALARRI,  13,  2, 12
	.byte BLOQUE, 	 0,  1, 13, 13
	.byte BLOQUE, 	27,  1, 13, 13
	.byte SALIENTE, 27, 14, 13,  4, LEFT  ,DOWN
	.byte SALIENTE,  0, 14, 13,  4, RIGHT ,DOWN
	.byte BMONEDAS, 13, 16,  8,  2
	.byte BTESOROS, 14, 12,  7,  2
	.byte BMONEDAS, 13,  8,  7,  2
	.byte BTESOROS, 14,  4,  7,  2
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL12:
	.byte JUGADOR, 110,222
	.byte ROCA,     146, 40, 45
	.byte SALARRI,   4,  2, 21
	.byte SALDERE,  39,  9, 15
	.byte SALIENTE,  0, 14, 13, 4, RIGHT ,DOWN
	.byte BLOQUE, 	 0,  8, 13, 6
	.byte SALIENTE,  0,  9, 13, 6, RIGHT ,UP
	.byte SALIENTE, 20,  9, 20, 13, LEFT ,UP
	.byte SALIENTE, 15, 24, 21, 10, LEFT ,UP
	.byte TESORO,	16,	12
	.byte TESORO,	12,	 4
	.byte TESORO,	20,	 4
	.byte TESORO,	30,	11
	.byte DELAY, 150, 40
	.byte FIN_NIVEL
NIVEL13:
	.byte JUGADOR, 190,222
	.byte ROCABMS,  52, 40, 35
	.byte ROCABMS,   2, 50, 30
	.byte ROCA,    145, 40, 25
	.byte SALARRI,   9,  1, 10
	.byte SALDERE,  39,  8,  8
	.byte BLOQUE, 	 0,  0, 10, 14
	.byte SALIENTE,  0, 24, 20, 10, RIGHT ,UP
	.byte SALIENTE, 20,  0, 20, 13, LEFT ,DOWN
	.byte SALIENTE, 26, 18, 14, 13, LEFT ,UP
	.byte BLOQUE, 	26, 17, 14,  6
	.byte TESORO,	16,	 8
	.byte MONEDA,	28,	12
	.byte MONEDA,	32,	12
	.byte MONEDA,	35,	12
	.byte MONEDA,	38,	12
	.byte DELAY, 150, 40
	.byte FIN_NIVEL
NIVEL14:
	.byte JUGADOR, 74,222
	.byte ROCA,    130, 40, 45
	.byte BMONEDAS, 25,  4,  5, 5
	.byte BMONEDAS,  5, 14,  2, 3
	.byte SALARRI,  29,  1,  9
	.byte SALIENTE, 24, 16, 16, 2, LEFT ,UP
	.byte BLOQUE, 	10, 15, 30, 8
	.byte BLOQUE, 	 0, 15,  4, 8
	.byte SALIENTE,  0,  8, 12, 4, RIGHT,DOWN
	.byte BLOQUE, 	 0,  0, 20, 8
	.byte SALIENTE, 20,  0, 10, 2, RIGHT,DOWN
	.byte TESORO,	18, 12
	.byte DELAY, 150, 40
	.byte FIN_NIVEL
NIVEL15:
	.byte JUGADOR, 74,222
	.byte ROCA,    115, 40, 45
	.byte ROCA,    180, 40, 40
	.byte BMONEDAS,  4,  4, 12,  8
	.byte SALARRI,  31,  2,  6
	.byte SALIENTE, 10, 24, 20,  4, LEFT ,UP
	.byte BLOQUE, 	30,  7,  9, 17
	.byte BLOQUE, 	39,  1,  2, 22
	.byte BLOQUE, 	 0, 14,  4,  9
	.byte SALIENTE,  0,  1, 18,  4, RIGHT,DOWN
	.byte BLOQUE, 	15,  1, 14,  2
	.byte SALIENTE, 28,  1,  4,  2, RIGHT,DOWN
	.byte DELAY, 150, 40
	.byte FIN_NIVEL	
NIVEL16:
	.byte JUGADOR, 254,222
	.byte ROCA,    200, 85, 25
	.byte ROCA,    150, 85, 23
	.byte ROCA,    100, 85, 12
	.byte ROCA,     40, 55, 10
	.byte BMONEDAS, 22, 10,  2,  6
	.byte BTESOROS, 16,  8,  2,  7
	.byte BMONEDAS,  6,  8,  2,  7
	.byte SALIZQU,   0,  2, 22
	.byte SALIENTE,  1,  1, 10,  4, LEFT ,DOWN
	.byte BLOQUE,   11,  1, 27,  6
	.byte SALIENTE, 22,  7, 16,  4, LEFT ,DOWN
	.byte BLOQUE,    0, 21, 27,  2
	.byte BLOQUE,   36, 19,  2,  4
	.byte DELAY, 150, 40
	.byte FIN_NIVEL
NIVEL17:
	.byte JUGADOR, 254,222
	.byte ROCA,    228, 30, 55
	.byte BMONEDAS, 32, 11,  4, 6
	.byte BMONEDAS,  6, 10, 10, 8
	.byte BTESOROS, 22,  5,  8, 2
	.byte SALDERE,  39,  4,  4
	.byte SALIENTE,  1, 10, 16,  4, RIGHT ,DOWN
	.byte BLOQUE,    1,  8, 16,  2
	.byte SALIENTE,  1,  9, 16, 10, RIGHT ,UP
	.byte BLOQUE,    1,  1, 39,  2
	.byte SALIENTE, 30,  8, 10,  8, LEFT ,DOWN
	.byte DELAY, 100, 40
	.byte FIN_NIVEL		
NIVEL18:
	.byte JUGADOR, 170,222
	.byte ROCA,     95, 30, 35
	.byte ROCA,    250, 30, 35
	.byte BMONEDAS, 12,  5,  8, 5
	.byte SALARRI,   3,  1, 32
	.byte SALIENTE, 23, 20, 16,  4, LEFT  ,UP
	.byte SALIENTE, 23, 19, 16, 12, LEFT  ,DOWN
	.byte SALIENTE,  1, 20, 16,  4, RIGHT ,UP
	.byte SALIENTE,  1, 19, 16, 12, RIGHT ,DOWN
	.byte ESTALACT, 10,  0, 20, DOWN 	
	.byte BLOQUE,    1,  0,  2, 7
	.byte BLOQUE,   37,  0,  2, 7
	.byte TESORO,	 4,  2
	.byte TESORO,	35,  2
	.byte DELAY, 100, 40
	.byte FIN_NIVEL	
NIVEL19:
	.byte JUGADOR, 206,222
	.byte ROCABMS,  50, 32, 30
	.byte ROCA,    173, 30, 28
	.byte ROCA,    253, 35, 23
	.byte BMONEDAS, 26,  3,  6, 4
	.byte BTESOROS,  5, 12,  5, 2
	.byte SALDERE,  39,  3, 16
	.byte SALIENTE, 28, 24, 12,  8, LEFT  ,UP
	.byte SALIENTE,  0, 24, 20, 12, RIGHT ,UP
	.byte BLOQUE,    0, 10,  6,  5
	.byte SALIENTE,  0,  2, 20, 12, RIGHT ,DOWN
	.byte ESTALACT, 20,  2, 10, DOWN 
	.byte ESTALACT, 30,  2, 10, DOWN
	.byte ESTALACT, 25, 10, 14, DOWN  
	.byte DELAY, 100, 40
	.byte FIN_NIVEL
NIVEL20:
	.byte JUGADOR, 110,222
	.byte ROCABMS,  50, 32, 20
	.byte ROCA,    100, 35, 18
	.byte ROCA,    140, 30, 10
	.byte ROCA,    190, 30, 18
	.byte BTESOROS,  5,  5,  2, 4
	.byte BTESOROS,  5, 16,  2, 4
	.byte BMONEDAS, 22,  3,  6, 6
	.byte SALDERE,  37, 10, 11
	.byte SALARRI,   9,  2, 12
	.byte SALIENTE, 18, 24, 20, 18, LEFT  ,UP		
	.byte SALIENTE,  0, 24,  8,  2, RIGHT ,UP		
	.byte ESTALACT, 22, 13, 12, DOWN  
	.byte SALIENTE, 22 , 1, 16,  8, LEFT  ,DOWN		
	.byte SALIENTE,  0,  1, 10,  2, RIGHT ,DOWN	
	.byte ESTALACT,  0, 16, 12, UP
	.byte BLOQUE,    0,  3,  2, 18
	.byte TESORO,	28, 20
	.byte DELAY, 100, 40
	.byte FIN_NIVEL
NIVEL21:
	.byte JUGADOR,  70,222
	.byte ROCABMS,  50, 31, 17
	.byte ROCA,    100, 28, 16
	.byte ROCA,    176, 30, 19
	.byte ROCA,    250, 32, 13
	.byte SALDERE,  37, 10, 11
	.byte SALIENTE, 18, 24, 20, 18, LEFT  ,UP
	.byte ESTALACT,  1,  1, 18, DOWN 
	.byte SALIENTE, 22 , 1, 16,  8, LEFT  ,DOWN			
	.byte BLOQUE,    0,  1,  2, 22
	.byte BLOQUE,   38,  1,  2, 22
	.byte BMONEDAS,  6, 11,  7, 4
	.byte BMONEDAS, 22, 14,  4, 4
	.byte BTESOROS, 31, 16,  3, 3
	.byte DELAY, 100, 40
	.byte FIN_NIVEL
NIVEL22:
	.byte JUGADOR,  70,222
	.byte BLOQUE,    0, 16, 40, 2
	.byte SALIENTE,  0, 18,  8, 2, RIGHT  ,DOWN	
	.byte SALIDAD,  16, 39, 19,  5
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL23:
	.byte JUGADOR,  70,222
	.byte ROCABMS,  34, 30, 20
	.byte ROCA,    110, 28, 20
	.byte ROCA,    145, 18, 20
	.byte ROCA,    225, 25, 20
	.byte SALIZQU,   0, 15, 10
	.byte SALARRI,   8,  1, 11
	.byte SALDERE,  39, 11, 12
	.byte ESTALACT, 10, 24, 16, UP
	.byte BLOQUE,   21,  0, 19, 10
	.byte SALIENTE,  0,  8,  8,  2, RIGHT  ,DOWN
	.byte BLOQUE,    0,  0,  8,  8
	.byte BTESOROS, 23, 13,  8,  2			
	.byte BMONEDAS,  8,  2,  7, 4
	.byte DELAY, 90, 50
	.byte FIN_NIVEL
NIVEL24: //ESPECIAL COMMODORE
	.byte JUGADOR,  70,222
	.byte SALARRI,   0,  1, 38
	.byte BLOQUE,   10,  1,  6, 5
	.byte SALIENTE,  2,  8,  8, 2, LEFT ,UP
	.byte BLOQUE,    2,  7,  8, 7
	.byte SALIENTE,  2, 14,  8, 2, LEFT ,DOWN
	.byte BLOQUE,   10, 15,  6, 5
	.byte SALIENTE, 16,  6,  6, 2, RIGHT ,DOWN
	.byte SALIENTE, 16, 16,  6, 2, RIGHT ,UP
	.byte BMONEDAS, 23,  2,  8, 11
	.byte BTESOROS, 24,  3,  8, 11			
	.byte DELAY, 255, 255
	.byte FIN_NIVEL	
NIVEL25:
	.byte JUGADOR, 146,222
	.byte ROCABMS,  34, 30, 20
	.byte ROCA,    110, 28, 20
	.byte ROCA,    177, 18, 20
	.byte SALARRI,  14,  1, 13
	.byte SALDERE,  39,  9,  6
	.byte SALIENTE,  0,  0, 14,  2, RIGHT ,DOWN
	.byte SALIENTE,  0, 24, 14,  2, RIGHT ,UP
	.byte SALIENTE, 22, 24, 10,  2, LEFT  ,UP
	.byte BLOQUE,   31, 15,  9,  8
	.byte SALIENTE, 22,  9, 10,  2, LEFT  ,UP
	.byte BLOQUE,   31,  0,  9,  8
	.byte BLOQUE,   14,  8,  5,  4
	.byte BMONEDAS, 11,  5,  2,  8
	.byte BMONEDAS, 19,  5,  2,  8
	.byte BMONEDAS, 29, 11,  4,  2
	.byte DELAY, 90, 50
	.byte FIN_NIVEL
NIVEL26:
	.byte JUGADOR, 248,222
	.byte ROCA,     50, 28, 20
	.byte ROCA,    116, 16, 20
	.byte ROCA,    180, 18, 20
	.byte SALARRI,   0,  1, 30
	.byte SALIDAD,  22, 39, 16, 8
	.byte BMONEDAS,  2,  2, 13,  3
	.byte SALIENTE, 22,  9, 10,  2, LEFT  ,DOWN
	.byte BLOQUE,   32,  0,  8, 17
	.byte SALIENTE, 22, 10, 10,  2, LEFT  ,UP
	.byte SALIENTE, 16, 24, 10,  2, RIGHT ,UP
	.byte BLOQUE,    0, 15, 16,  8
	.byte SALIENTE,  0, 16, 10,  2, RIGHT ,UP
	.byte ESTALACT,  5,  0, 16,  DOWN
	.byte BMONEDAS, 10, 11,  6,  3
	.byte DELAY, 90, 50
	.byte FIN_NIVEL		
NIVEL27:
	.byte JUGADOR, 248,222	
	.byte ROCABMS, 45, 34, 22
	.byte ROCA,    120, 64, 15
	.byte ROCA,    175, 70, 20
	.byte ROCA,    225, 70, 15
	.byte BMONEDAS,  1,  1, 15, 8	
	.byte SALIDAD,   2, 39,  1,  8	
	.byte SALIDAI,   9,  0,  1,	14
	.byte ESTALACT,  1,  0, 12, DOWN
	.byte ESTALACT, 14,  0, 12, DOWN
	.byte ESTALACT, 27,  0, 12, DOWN	
	.byte SALIENTE, 16, 24, 10,  2, RIGHT ,UP
	.byte BLOQUE,    0, 15, 16,  8	
	.byte SALIENTE, 30, 16, 10,  2, LEFT  ,UP	
	.byte SALIENTE, 30, 15, 10,  2, LEFT  ,DOWN	
	.byte DELAY, 90, 50
	.byte FIN_NIVEL	
NIVEL28:
	.byte JUGADOR, 248,222	
	.byte ROCA,    120, 34, 25
	.byte ROCA,    174, 30, 20
	.byte SALIZQU,   0,  1,  8
	.byte ESTALACT,  1,  0, 12, DOWN
	.byte ESTALACT, 14,  0, 12, DOWN
	.byte BLOQUE,   21,  0, 19,  5	
	.byte SALIENTE, 20,  5, 20,  2, LEFT  ,DOWN
	.byte SALIENTE,  0, 24, 18,  2, RIGHT ,UP
	.byte BMONEDAS, 16,  6,  2,  8
	.byte BMONEDAS,  4,  6,  6,  2	
	.byte DELAY, 90, 50
	.byte FIN_NIVEL	
NIVEL29:	
	.byte JUGADOR, 176,222
	.byte ROCABMS,  25, 70, 20
	.byte ROCA,     65, 54, 25
	.byte SALARRI,  13,  1, 12
	.byte SALIZQU,   0,  1, 14
	.byte SALDERE,  39,  1, 14
	.byte ESTALACT,  1,  0, 12, DOWN
	.byte ESTALACT, 14, 10, 12, DOWN
	.byte ESTALACT, 27,  0, 12, DOWN
	.byte SALIENTE,  0, 24, 10,  2, RIGHT ,UP
	.byte SALIENTE, 30, 24, 10,  2, LEFT ,UP
	.byte BMONEDAS, 14,  5,  6,  3
	.byte BTESOROS,  5,  7,  2,  6
	.byte BTESOROS, 32,  7,  2,  6
	.byte DELAY, 90, 50
	.byte FIN_NIVEL	
NIVEL30:	
	.byte JUGADOR, 176,222	
	.byte ROCA,     173, 40, 20
	.byte ROCA,     121, 40, 30
	.byte ROCA,     220, 40, 30
	.byte SALARRI,  13,  1, 12
	.byte BLOQUE, 	 0,  0, 13, 14
	.byte BLOQUE, 	27,  0, 13, 14
	.byte SALIENTE, 27, 14, 13,  4, LEFT  ,DOWN
	.byte SALIENTE,  0, 14, 13,  4, RIGHT ,DOWN
	.byte ESTALACT, 17, 10,  6, DOWN
	.byte ESTALACT, 17, 11,  6, UP
	.byte BTESOROS, 13,  5,  2,  8
	.byte BTESOROS, 24,  5,  2,  8
	.byte DELAY, 90, 50
	.byte FIN_NIVEL
NIVEL31:	
	.byte JUGADOR, 176,222
	.byte ROCABMS,   55, 40, 13
	.byte ROCA,      40, 40, 13
	.byte ROCA,     100, 30, 13
	.byte ROCA,     236, 33, 13
	.byte SALIDAD,  36, 39,  1, 22
	.byte SALIZQU,   0,  1, 22
	.byte BMONEDAS, 10,  5, 10,  7
	.byte BMONEDAS,  2,  8,  4,  4
	.byte BMONEDAS, 30,  8,  4,  4
	.byte ESTALACT,  1,  0, 12, DOWN
	.byte ESTALACT,  1, 24, 12, UP
	.byte ESTALACT, 14,  0, 12, DOWN
	.byte ESTALACT, 14, 10, 12, DOWN
	.byte ESTALACT, 14, 11, 12, UP
	.byte ESTALACT, 27,  0, 12, DOWN
	.byte ESTALACT, 27, 24, 12, UP
	.byte DELAY, 90, 50
	.byte FIN_NIVEL
NIVEL32:	
	.byte JUGADOR, 176,222
	.byte BLOQUE,    0, 16, 40, 2
	.byte BLOQUE,   33, 18,  7, 5
	.byte SALIENTE, 25, 18,  8, 2, LEFT  ,DOWN	
	.byte SALIDAI,   1,  0, 19,  5 
	.byte DELAY, 255, 50
	.byte FIN_NIVEL		
NIVEL33:	
	.byte JUGADOR, 200,222
	.byte ROCABMS,  72, 43, 13
	.byte ROCA,     93, 40, 13
	.byte ROCA,    173, 30, 13
	.byte ROCA,    251, 35, 13
	.byte SALDERE,  39,  3, 13
	.byte ESTALACT,  0,  1, 10, DOWN
	.byte ESTALACT, 10,  1, 10, DOWN
	.byte ESTALACT, 20,  1, 10, DOWN 
	.byte ESTALACT, 30,  1, 10, DOWN
	.byte ESTALACT, 10, 18, 10, UP
	.byte ESTALACT, 20, 18, 10, UP
	.byte ESTALACT, 30, 18, 10, UP
	.byte BLOQUE,    0,  1,  2, 22
	.byte BMONEDAS, 21,  6,  7,  4
	.byte BMONEDAS,  4, 10,  3,  6
	.byte DELAY, 90, 50
	.byte FIN_NIVEL	
NIVEL34:	
	.byte JUGADOR, 196,222
	.byte ROCA,     173, 34, 16
	.byte ROCA,     173, 40, 20
	.byte ROCA,     121, 40, 30
	.byte ROCA,     220, 40, 30
	.byte SALARRI,  13,  2,  12
	.byte BLOQUE, 	 0,  1,  13, 13
	.byte BLOQUE, 	27,  1,  13, 13
	.byte SALIENTE, 27, 14,  13,  4, LEFT  ,DOWN
	.byte SALIENTE,  0, 14,  13,  4, RIGHT ,DOWN
	.byte ESTALACT, 17,  1,   6, DOWN 
	.byte BMONEDAS, 17, 12,   4,  4
	.byte BTESOROS, 19,  6,   2,  4
	.byte DELAY, 90, 50
	.byte FIN_NIVEL	
NIVEL35:	
	.byte JUGADOR, 176,222
	.byte ROCA,    173, 34, 16
	.byte ROCA,     93, 32, 16
	.byte ROCA,     30, 30, 11
	.byte ROCA,     30, 40, 14
	.byte SALIZQU,   0,  2, 21
	.byte BMONEDAS, 21,  4, 10,  7
	.byte BMONEDAS,  4, 12,  8,  4
	.byte BTESOROS,  8, 14,  4,  2
	.byte ESTALACT, 10,  1,  20, DOWN 
	.byte ESTALACT,  0,  1,  10, DOWN 
	.byte SALIENTE, 30,  1,  10,  2, LEFT ,DOWN
	.byte SALIENTE, 25, 24,  15,  2, LEFT ,UP
	.byte DELAY, 90, 50
	.byte FIN_NIVEL
NIVEL36:	
	.byte JUGADOR, 254,222
	.byte ROCABMS,  30, 40, 14
	.byte ROCA,    173, 34, 11
	.byte ROCA,     93, 32, 11
	.byte ROCA,     30, 30, 11
	.byte SALIDAD,  42, 39, 15, 8
	.byte SALIZQU,   0,  2, 11
	.byte SALARRI,  36,  2,  4
	.byte BLOQUE,    0,  1, 36,  2
	.byte SALIENTE, 20,  3,  8,  2, LEFT  ,DOWN
	.byte SALIENTE, 28,  3,  8,  2, RIGHT ,DOWN	
	.byte SALIENTE, 18, 21, 10,  2, RIGHT ,UP
	.byte SALIENTE, 34, 15,  6,  2, LEFT ,UP
	.byte BLOQUE,    0, 12, 18, 11
	.byte BLOQUE,   18, 20, 10,  3 	
	.byte BMONEDAS,  4,  6,  7,  3
	.byte BTESOROS, 36,  5,  2,  3		
	.byte DELAY, 90, 50
	.byte FIN_NIVEL
NIVEL37: //Instrucciones
	.byte NOFISH
	.byte JUGADOR,   0,222
	.byte TEXTO,    17,  2, $6E, $C0
	.byte MONEDA,   16,  2
	.byte MONEDA,   23,  2
	.byte TEXTO,     2,  7, $19, $C1
	.byte TEXTO,     4,  9, $3f, $C1
	.byte TEXTO,     0, 11, $60, $C1
	.byte TEXTO,     1, 14, $89, $C1
	.byte TEXTO,    13, 16, $B0, $C1
	.byte TEXTO,     1, 18, $C0, $C1
	.byte MONEDA,   36, 18
	.byte TEXTO,    14, 20, $E5, $C1
	.byte TESORO,   24, 20
	.byte TEXTO,    12, 23, $F1, $C1
	.byte FIN_NIVEL
NIVEL38:	//Reservados
NIVEL39:
	.byte JUGADOR, 150,222
	.byte ROCABMS,  30, 40, 20
	.byte ROCA,    224, 34, 11
	.byte ROCA,    120, 32, 11
	.byte ROCA,     30, 30, 11
	.byte SALDERE,  39,  1,  9
	.byte SALIDAI,  44,  0,  1, 14
	.byte ESTALACT,  1,  0, 12, DOWN
	.byte ESTALACT, 14,  0, 12, DOWN
	.byte ESTALACT, 27,  0, 12, DOWN
	.byte SALIENTE, 28, 19, 12,  2, LEFT  ,UP
	.byte BLOQUE,   28, 18, 12,  6
	.byte SALIENTE, 16,  8, 12,  2, RIGHT ,DOWN
	.byte SALIENTE,  6,  8, 12,  2, LEFT  ,DOWN
	.byte SALIENTE,  0, 22, 10,  4, RIGHT ,UP
	.byte BLOQUE,    0, 21, 10,  2
	.byte BMONEDAS,  4,  6, 13,  2
	.byte DELAY, 80, 40
	.byte FIN_NIVEL	
NIVEL40:
	.byte JUGADOR, 170,222
	.byte ROCABMS,  30, 30, 10
	.byte ROCABMS,  60, 46, 10
	.byte ROCA,    248, 34,  8
	.byte ROCA,     90, 32,  8
	.byte ROCA,     30, 46, 10
	.byte ROCA,     60, 30, 10
	.byte SALDERE,  39,  8, 14
	.byte SALIDAI,  33,  0,  8, 14
	.byte BMONEDAS, 11,  8,  9,  7
	.byte BMONEDAS, 29, 12,  5,  2
	.byte BMONEDAS,  1, 12,  5,  2
	.byte ESTALACT,  0, 24, 18, UP 							
	.byte ESTALACT, 22, 24, 18, UP
	.byte BLOQUE,    0,  0, 40,  7
	.byte ESTALACT, 12,  7, 16, DOWN
	.byte DELAY, 80, 40
	.byte FIN_NIVEL	
NIVEL41:
	.byte JUGADOR, 188,222
	.byte ROCABMS,  30, 30, 12
	.byte ROCA,    228, 34, 11
	.byte ROCA,    138, 32, 11
	.byte ROCA,     30, 46, 17
	.byte ROCA,     80, 30, 14
	.byte SALDERE,  39,  1,  7
	.byte SALIDAI,  46,  0,  1,  6
	.byte BMONEDAS,  1,  1, 10,  8
	.byte BMONEDAS, 24,  1,  8,  8
	.byte SALIENTE, 28, 19, 12,  2, LEFT  ,UP
	.byte BLOQUE,   28, 18, 12,  6
	.byte ESTALACT, 10,  0, 24, DOWN
	.byte SALIENTE,  0, 24, 20,  4, RIGHT ,UP
	.byte DELAY, 80, 40
	.byte FIN_NIVEL
NIVEL42:
	.byte JUGADOR, 188,222
	.byte ROCABMS,  45, 30, 18
	.byte ROCA,    218, 34, 19
	.byte ROCA,    142, 32, 24
	.byte SALIDAI,  43,  0,  1,  3
	.byte BMONEDAS,  5,  4,  7,  4
	.byte BMONEDAS, 15, 12,  7,  2
	.byte BMONEDAS, 25, 16,  7,  3
	.byte BLOQUE,    0, 18, 34,  2
	.byte BLOQUE,    0, 13, 24,  2
	.byte BLOQUE,   28, 13, 12,  2
	.byte BLOQUE,    0,  8, 14,  2
	.byte BLOQUE,   18,  8, 22,  2
	.byte BLOQUE,    0,  3,  5,  2
	.byte BLOQUE,    9,  3, 31,  2
	.byte BLOQUE,   38,  0,  2, 23
	.byte BLOQUE,    0,  4,  2, 19
	.byte BTESOROS, 19, 12,  3,  1
	.byte DELAY, 110, 50
	.byte FIN_NIVEL
NIVEL43: //Especial fantasmita
	.byte JUGADOR, 188,222
	.byte SALDERE,  39,  1, 22
	.byte BMONEDAS, 26,  1,  6, 11
	.byte BMONEDAS, 27,  2,  6, 11
	.byte SALIENTE,  4,  8,  8,  2, LEFT  ,UP
	.byte BLOQUE,   12,  1,  6,  6
	.byte SALIENTE, 17,  8,  8,  2, RIGHT ,UP
	.byte BLOQUE,    4,  6, 21,  6
	.byte BLOQUE,    4, 12,  6,  6
	.byte BLOQUE,   12, 12,  5,  6
	.byte BLOQUE,   19, 12,  6,  6
	.byte BTESOROS, 11,  5,  2,  2
	.byte TESORO,	12,	 5
	.byte MONEDA,	12,	 6
	.byte MONEDA,	12,	 7
	.byte MONEDA,	13,	 7
	.byte TESORO,	11,	 6
	.byte MONEDA,	13,	 6
	.byte BTESOROS, 17,  5, 2,  2
	.byte TESORO,	18,	 5
	.byte TESORO,	17,	 6
	.byte MONEDA,	19,	 6
	.byte MONEDA,	18,	 6
	.byte MONEDA,	19,	 7
	.byte MONEDA,	18,	 7						
	.byte DELAY, 255, 255
	.byte FIN_NIVEL
NIVEL44:
	.byte JUGADOR,  42,222
	.byte ROCABMS,  45, 30,  7
	.byte ROCA,     85, 30,  8
	.byte ROCA   , 118, 50, 14
	.byte ROCA,    155, 30,  8
	.byte ROCA   , 185, 50, 14
	.byte ROCA,    230, 30,  8
	.byte SALDERE,  39,  1, 14
	.byte BMONEDAS,  7,  3,  2,  9
	.byte BTESOROS, 16,  3,  2,  9
	.byte BMONEDAS, 25,  3,  2,  7
	.byte BTESOROS, 34,  3,  2,  7
	.byte ESTALACT,  0,  0,  8, DOWN
	.byte ESTALACT,  9,  0,  8, DOWN
	.byte ESTALACT, 18,  0,  8, DOWN
	.byte ESTALACT, 27,  0,  8, DOWN
	.byte SALIENTE, 36,  0,  4,  2, LEFT  ,DOWN
	.byte BLOQUE,   27, 15, 13,  8
	.byte DELAY, 100, 60
	.byte FIN_NIVEL
NIVEL45:
	.byte JUGADOR,  102,222
	.byte ROCABMS,  15, 30, 17
	.byte ROCA,     85, 30,  8
	.byte ROCA   , 118, 50, 14
	.byte ROCA,    155, 30,  8
	.byte ROCA   , 185, 50, 14
	.byte ROCA,    230, 30,  8
	.byte SALARRI,  22,  1,  9
	.byte BLOQUE,    0,  0,  7,  23
	.byte BLOQUE,   33,  0,  7,  23
	.byte ESTALACT, 15,  0, 10, DOWN
	.byte ESTALACT,  7,  0,  8, DOWN
	.byte BMONEDAS,  7, 16,  8,  3
	.byte BMONEDAS, 16, 13,  8,  3
	.byte BMONEDAS, 25, 10,  4,  3
	.byte BMONEDAS, 26,  3,  4,  7
	.byte BTESOROS, 25, 10,  4,  3
	.byte BTESOROS, 15, 16,  4,  2
	.byte DELAY, 100, 60
	.byte FIN_NIVEL	
NIVEL46:
	.byte JUGADOR,  30,222
	.byte ROCA,     70, 30,  8
	.byte ROCA   , 118, 50, 14
	.byte ROCA,    175, 30, 12
	.byte ROCA,    230, 25, 16
	.byte SALIDAI,  49,  39,  1,  9
	.byte BMONEDAS,  7, 16,  5,  3
	.byte BMONEDAS, 14, 13,  5,  3
	.byte BMONEDAS, 21, 10,  5,  3
	.byte BMONEDAS, 22,  3,  8,  5
	.byte SALIENTE,  8, 24,  6,  2, LEFT  ,UP
	.byte SALIENTE, 14, 20,  6,  2, LEFT  ,UP
	.byte SALIENTE, 20, 16,  6,  2, LEFT  ,UP
	.byte SALIENTE, 26, 12,  6,  2, LEFT  ,UP
	.byte SALIENTE, 32,  8,  6,  2, LEFT  ,UP
	.byte BLOQUE,   14, 19, 26,  4
	.byte BLOQUE,   20, 15, 20,  4
	.byte BLOQUE,   26, 11, 14,  4
	.byte BLOQUE,   32,  7,  8,  4
	.byte BLOQUE,   38,  3,  2,  4
	.byte BLOQUE,    0,  0, 39,  1
	.byte DELAY, 100, 60
	.byte FIN_NIVEL
NIVEL47: //Final
	.byte JUGADOR, 170,222
	.byte TEXTO,    13,  5, $C7, $C0
	.byte TEXTO,     3,  7, $D5, $C0
	.byte TEXTO,    14,  8, $F7, $C0
	.byte TEXTO,    12, 12, $06, $C1
	.byte FIN_NIVEL
NIVEL48:		
	.byte JUGADORBMS,  40,222
	.byte ROCABMS,     15, 30,  3
	.byte ROCA,       210, 25,  5
	.byte ROCA,       185, 35,  8
	.byte ROCA,       160, 28,  5
	.byte ROCA,       130, 27,  6
	.byte ROCA,        84, 25,  5
	.byte SALIDAI, 46, 39,  1,  9
	.byte SALARRI,  6,  1,  6	//SALIDA AL FINAL 3
	.byte SALIDAD, 32,  0,  7, 16
	.byte SALIENTE, 0,  0,  8,  2, RIGHT  ,DOWN
	.byte BLOQUE,  14,  0, 26,  8
	.byte BLOQUE,  38, 10,  2, 13
	.byte BMONEDAS, 5,  4,  5, 10
	.byte BTESOROS, 2,  9, 18,  2
	.byte DELAY, 100, 60
	.byte FIN_NIVEL	
NIVEL49:
	.byte JUGADOR, 180,222
	.byte ROCA,    225, 30, 10
	.byte ROCA,    200, 25, 12
	.byte ROCA,    175, 20,  8
	.byte ROCA,    150, 25, 12
	.byte ROCA,    123,  0, 15
	.byte SALIZQU,   0,  7,  3
	.byte SALIDAD,  54, 39, 11,  3 //SALIDA AL FINAL 2
	.byte BMONEDAS,  3,  7, 10,  4
	.byte BMONEDAS, 20, 10,  9,  4
	.byte BTESOROS, 20, 18,  2,  2
	.byte ESTALACT, 13,  0, 14, DOWN
	.byte BLOQUE,   29, 13, 11, 10
	.byte BLOQUE,   29,  0, 11, 10
	.byte BLOQUE,    0,  9, 11, 14
	.byte BLOQUE,    0,  0, 11,  6	
	.byte DELAY, 100, 60
	.byte FIN_NIVEL	
NIVEL50:
	.byte JUGADORBMS, 40,222
	.byte ROCABMS,  40, 30,  6
	.byte ROCA,    239, 34,  5
	.byte ROCA,    190, 30,  5
	.byte ROCA,    190, 30,  9
	.byte ROCA,    135, 32,  5
	.byte ROCA,     80, 31,  5
	.byte BLOQUE,   14,  0, 24, 1
	.byte SALIDAA,  53, 18,  1,  6	//SALIDA AL FINAL 1
	.byte SALIZQU,   0, 13,  3
	.byte SALDERE,  39, 21,  3
	.byte BLOQUE,   38,  0,  2, 20
	.byte SALIENTE,  0,  0, 14,  2, RIGHT  ,DOWN
	.byte SALIENTE,  0, 24, 10,  2, RIGHT  ,UP	
	.byte BMONEDAS, 19,  3,  4, 10
	.byte BMONEDAS,  6, 12, 16,  3
	.byte DELAY, 100, 60
	.byte FIN_NIVEL
NIVEL51:
	.byte JUGADOR,  160,222	
	.byte ROCABMS,  10, 38, 11
	.byte ROCA,    239, 37, 10
	.byte ROCA,    220, 36,  9
	.byte ROCA,    190, 35,  8
	.byte ROCA,    160, 34,  7
	.byte ROCA,    135, 33,  6
	.byte ROCA,     80, 32,  5
	.byte BTESOROS,  5, 12, 16,  5
	.byte SALIENTE,  0, 10, 14,  2, RIGHT  ,DOWN
	.byte SALIENTE, 26, 10, 14,  2, LEFT  ,DOWN
	.byte BLOQUE,    0,  0, 40, 10
	.byte BLOQUE,    0, 12,  2, 11
	.byte BLOQUE,   38, 12,  2, 11
	.byte SALIDAA,  52, 14, 10, 10	//SALIDA AL FINAL 0
	.byte DELAY, 100, 60
	.byte FIN_NIVEL
NIVEL52:
	.byte NOFISH
	.byte FINJUEGO, 0
NIVEL53:
	.byte NOFISH
	.byte FINJUEGO, 1			
NIVEL54:
	.byte NOFISH
	.byte FINJUEGO, 2	