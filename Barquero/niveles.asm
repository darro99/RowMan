esquinas:
	.byte CHAR_CAVE_ID_LEFT, CHAR_CAVE_ID_RIGHT, CHAR_CAVE_DI_LEFT, CHAR_CAVE_DI_RIGHT		 
pantallas:
	.word NIVEL0, NIVEL1 
	.word NIVEL2,  NIVEL3,  NIVEL4,  NIVEL5, NIVEL6
	.word NIVEL7,  NIVEL8,  NIVEL9,  NIVEL10, NIVEL11
	.word NIVEL12, NIVEL13, NIVEL14, NIVEL15, NIVEL16
	.word NIVEL17, NIVEL18, NIVEL19, NIVEL20, NIVEL21
	.word NIVEL22, NIVEL23, NIVEL24

//SALIENTE, x, y, color, ancho, ancho_min,izq/der,up/down
//ESTALACT, x, y, color, ancho, up/down (el ancho SIEMPRE debe ser par)
//BLOQUE,   x, y, color, ancho, lineas
//JUGADOR,	x, y (La coordenada x SIEMPRE debe ser par))
//MODENA,	x, y
//ROCA,		x, y, velocidad 
//ROCABMS,	X, Y, velocidad Rocas para mas de 255 choche agua x>=17
//SALARRI,	x, y, ancho
//SALIZQU,	x, y, ancho
//SALDERE,	x, y, ancho
//SALIDAD,	pantalla, x, y, ancho
//BTESOROS, x, y, color, ancho, lineas
//BMONEDAS, x, y, color, ancho, lineas
//DELAY,	contador1, contador2 [SIEMPRE EL ULTIMO]	
//DefiniciOn de niveles
//11,11,15,15,11 Colores antiguos del nivel
NIVEL0:
NIVEL1:
	.byte JUGADOR, 170,222
	.byte ROCA,   253, 64, 36
	.byte ROCA,    80, 60, 35
	.byte SALARRI,  2, 1, 34
	.byte SALIENTE, 0,  24, 15, 15, 2, RIGHT,UP
	.byte SALIENTE, 25, 24, 15, 15, 2, LEFT,UP
	.byte BLOQUE, 	0,   0, 15, 2, 10
	.byte BLOQUE, 	38,  0, 15, 2, 10
	.byte ESTALACT, 14, 0,  11, 12, DOWN 	
	.byte TESORO,	8,	12
	.byte MONEDA,	16,	12
	.byte MONEDA,	18,	12
	.byte MONEDA,	20,	12
	.byte MONEDA,	22,	12
	.byte MONEDA,	24,	12
	.byte TESORO,	30,	12
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL2:
	.byte JUGADOR, 176,222
	.byte SALARRI,  3, 1, 32
	.byte BLOQUE, 	37,  0, 11,  3, 23
	.byte BLOQUE, 	 0,  0, 11,  3, 23
	.byte ESTALACT, 13, 12, 11, 14, UP
	.byte BLOQUE, 	13, 11, 11, 14,  5
	.byte BMONEDAS, 29,  2, 15,  4, 10
	.byte BTESOROS, 14, 18, 11,  7,  2
	.byte BMONEDAS,  4,  2, 15,  4, 10			
	.byte TESORO,	20,	4  //Representa el 1UP
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL3:
	.byte JUGADOR, 190,222
	.byte ROCA,     60, 30, 45
	.byte SALARRI,   2,  1, 34
	.byte BMONEDAS,  2,  3, 15, 18, 7
	.byte SALIZQU,   0,  6,  5
	.byte ESTALACT,  7,  0, 11, 22, DOWN
	.byte BLOQUE,  	 0,  0, 11,  2,  5
	.byte BLOQUE,  	 0, 11, 11,  4, 12
	.byte SALIENTE,  4, 24, 11, 15, 2, RIGHT,UP
	.byte BLOQUE, 	38,  0, 11,  2, 10
	.byte SALIENTE, 25, 24, 11, 15, 2, LEFT,UP
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
	.byte BMONEDAS,  1,  3, 15, 19, 4			
	.byte SALIENTE,  0, 24, 11, 15, 2, RIGHT,UP
	.byte SALIENTE, 25, 24, 11, 15, 2, LEFT,UP
	.byte ESTALACT,  1,  0, 11, 12, DOWN
	.byte ESTALACT, 14,  0, 11, 12, DOWN
	.byte ESTALACT, 27,  0, 11, 12, DOWN
	.byte BMONEDAS,  1,  7, 15, 19, 2			
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
	.byte SALIENTE, 0,   0, 11, 15, 4, RIGHT,DOWN
	.byte SALIENTE, 0,  24, 11, 15, 4, RIGHT,UP
	.byte SALIENTE, 25, 24, 11, 15, 2, LEFT,UP
	.byte ESTALACT, 27, 0,  11, 12, DOWN
	.byte BMONEDAS, 12, 10, 15, 10, 3	
	.byte DELAY, 255, 50
	.byte FIN_NIVEL
NIVEL6:
	.byte JUGADOR, 210,222
	.byte ROCA,    190, 30, 45
	.byte SALARRI,  14,  1, 14
	.byte SALIENTE,  0, 24, 11, 22, 10, RIGHT,UP
	.byte BLOQUE, 	 0,  0, 11, 14, 11
	.byte SALIENTE, 10, 11, 11,  4,  2, RIGHT,DOWN
	.byte BLOQUE, 	30,  0, 11, 10, 23
	.byte BMONEDAS, 16,  5, 15,  7,  6
	.byte BTESOROS, 20,  5, 11,  3,  6	
	.byte DELAY, 255, 50
	.byte FIN_NIVEL	
NIVEL7:
	.byte JUGADOR, 170,222
	.byte ROCA,    145, 10, 40
	.byte ROCA,    195, 10, 40
	.byte SALARRI,   4,  1, 14
	.byte SALIENTE, 20, 0, 12, 20, 14, LEFT ,DOWN
	.byte BLOQUE, 	25, 5, 12, 15, 18
	.byte SALIENTE,  0, 7, 12, 13,  7, RIGHT,UP
	.byte BLOQUE, 	 0, 6, 12, 13, 19
	.byte BMONEDAS, 19, 3, 15,  1,  9			
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL8:
	.byte JUGADOR, 230,222
	.byte ROCA,     50, 30, 40
	.byte ROCA,    195, 10, 40
	.byte SALDERE,  37, 17,  7
	.byte SALIZQU,   0,  1, 22
	.byte BMONEDAS, 30, 18, 15,  4, 3
	.byte BMONEDAS,  3,  1, 15, 15, 5
	.byte ESTALACT,  1,  0, 12, 16, DOWN
	.byte SALIENTE, 18,  0, 12, 20, 4, LEFT ,DOWN
	.byte ESTALACT,  1, 24, 12, 22, UP	
	.byte TESORO,	12,	13
	.byte DELAY, 200, 40
	.byte FIN_NIVEL	
NIVEL9:
	.byte JUGADOR, 170,222
	.byte ROCA,    228, 10, 40
	.byte ROCA,    116, 30, 40
	.byte SALARRI,   2,  1, 34
	.byte BMONEDAS,  3,  2, 15, 15,  5
	.byte BTESOROS, 19, 12, 11,  2,  2
	.byte SALIENTE, 25, 24, 12, 15,  8, LEFT,UP
	.byte BLOQUE, 	32,  0, 12,  8, 16
	.byte SALIENTE,  0, 24, 12, 15,  8, RIGHT,UP
	.byte BLOQUE, 	 0,  0, 12,  8, 16
	.byte ESTALACT, 12,  0, 12, 16, DOWN
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL10:
	.byte JUGADOR, 170,222
	.byte ROCA,     70, 40, 15
	.byte ROCA,    180, 10, 40
	.byte SALARRI,   2,  1, 34
	.byte SALIZQU,   0, 12,  7
	.byte SALIENTE, 20,  0, 12, 20, 12, LEFT ,DOWN
	.byte BLOQUE, 	28,  7, 12, 12, 16
	.byte SALIENTE,  0,  7, 12, 13,  7, RIGHT,UP
	.byte BLOQUE, 	 0,  6, 12, 13,  5
	.byte BLOQUE, 	 0, 19, 12, 13,  4
	.byte BMONEDAS, 19,  4, 15,  2,  8
	.byte BTESOROS,  4, 14, 11,  1,  3
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL11:
	.byte JUGADOR, 170,222
	.byte ROCA,     173, 40, 30
	.byte ROCA,     121, 40, 40
	.byte ROCA,     220, 40, 40
	.byte SALARRI,  13,  2, 12
	.byte BLOQUE, 	 0,  1, 12, 13, 13
	.byte BLOQUE, 	27,  1, 12, 13, 13
	.byte SALIENTE, 27, 14, 12, 13,  4, LEFT  ,DOWN
	.byte SALIENTE,  0, 14, 12, 13,  4, RIGHT ,DOWN
	.byte TESORO,	20,	12
	.byte TESORO,	14, 15
	.byte TESORO,	25,	15
	.byte TESORO,	20,	18
	.byte DELAY, 200, 40
	.byte FIN_NIVEL
NIVEL12:
	.byte JUGADOR, 110,222
	.byte ROCA,     146, 40, 45
	.byte SALARRI,   4,  2, 21
	.byte SALDERE,  39,  9, 15
	.byte SALIENTE,  0, 14, 13, 13, 4, RIGHT ,DOWN
	.byte BLOQUE, 	 0,  8, 13, 13, 6
	.byte SALIENTE,  0,  9, 13, 13, 6, RIGHT ,UP
	.byte SALIENTE, 20,  9, 13, 20, 13, LEFT ,UP
	.byte SALIENTE, 15, 24, 13, 21, 10, LEFT ,UP
	.byte TESORO,	16,	12
	.byte TESORO,	12,	 4
	.byte TESORO,	20,	 4
	.byte TESORO,	30,	11
	.byte DELAY, 150, 40
	.byte FIN_NIVEL
NIVEL13:
	.byte JUGADOR, 190,222
	.byte ROCABMS,  52, 40, 35
	.byte ROCABMS,   0, 50, 30
	.byte ROCA,    145, 40, 25
	.byte SALARRI,   9,  1, 10
	.byte SALDERE,  39,  8,  8
	.byte BLOQUE, 	 0,  0, 13, 10, 14
	.byte SALIENTE,  0, 24, 13, 20, 10, RIGHT ,UP
	.byte SALIENTE, 20,  0, 13, 20, 13, LEFT ,DOWN
	.byte SALIENTE, 26, 18, 13, 14, 13, LEFT ,UP
	.byte BLOQUE, 	26, 17, 13, 14,  6
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
	.byte SALARRI,  29,  1,  9
	.byte SALIENTE, 24, 16, 13, 16, 2, LEFT ,UP
	.byte BLOQUE, 	10, 15, 13, 30, 8
	.byte BLOQUE, 	 0, 15, 13,  4, 8
	.byte SALIENTE,  0,  8, 13, 12, 4, RIGHT,DOWN
	.byte BLOQUE, 	 0,  0, 13, 20, 8
	.byte SALIENTE, 20,  0, 13, 10, 2, RIGHT,DOWN
	.byte MONEDA,	 6,	18
	.byte MONEDA,	 6,	15
	.byte TESORO,	18, 12
	.byte MONEDA,	24,	 8
	.byte MONEDA,	29,	 4
	.byte MONEDA,	32,	 2
	.byte DELAY, 150, 40
	.byte FIN_NIVEL
NIVEL15:
	.byte JUGADOR, 74,222
	.byte ROCA,    115, 40, 45
	.byte ROCA,    180, 40, 40
	.byte SALARRI,  31,  2,  6
	.byte SALIENTE, 10, 24, 13, 20,  4, LEFT ,UP
	.byte BLOQUE, 	30,  7, 13,  9, 17
	.byte BLOQUE, 	39,  1, 13,  2, 22
	.byte BLOQUE, 	 0, 14, 13,  4,  9
	.byte SALIENTE,  0,  1, 13, 18,  4, RIGHT,DOWN
	.byte BLOQUE, 	15,  1, 13, 14,  2
	.byte SALIENTE, 28,  1, 13,  4,  2, RIGHT,DOWN
	.byte MONEDA,	 7,	18
	.byte MONEDA,	12,	14
	.byte MONEDA,	18,	10
	.byte TESORO,	35,	 3
	.byte DELAY, 150, 40
	.byte FIN_NIVEL	
NIVEL16:
	.byte JUGADOR, 254,222
	.byte ROCA,    200, 85, 25
	.byte ROCA,    150, 85, 23
	.byte ROCA,    100, 85, 12
	.byte ROCA,     40, 55, 10
	.byte SALIZQU,   0,  2, 22
	.byte SALIENTE,  1,  1, 13, 10,  4, LEFT ,DOWN
	.byte BLOQUE,   11,  1, 13, 27,  6
	.byte SALIENTE, 22,  7, 13, 16,  4, LEFT ,DOWN
	.byte BLOQUE,    0, 21, 13, 27,  2
	.byte BLOQUE,   36, 19, 13,  2,  4
	.byte TESORO,	 7,	16
	.byte MONEDA,	14, 18
	.byte MONEDA,	22, 18
	.byte MONEDA,	30, 20
	.byte DELAY, 150, 40
	.byte FIN_NIVEL
NIVEL17:
	.byte JUGADOR, 254,222
	.byte ROCA,    228, 30, 55
	.byte SALDERE,  39,  4,  4
	.byte SALIENTE,  1, 10, 14, 16,  4, RIGHT ,DOWN
	.byte BLOQUE,    1,  8, 14, 16,  2
	.byte SALIENTE,  1,  9, 14, 16, 10, RIGHT ,UP
	.byte BLOQUE,    1,  1, 14, 39,  2
	.byte SALIENTE, 30,  8, 14, 10,  8, LEFT ,DOWN
	.byte MONEDA,	14, 18
	.byte MONEDA,	22, 18
	.byte MONEDA,	30, 18
	.byte MONEDA,	22, 14
	.byte MONEDA,	30, 14
	.byte MONEDA,	38, 14
	.byte MONEDA,	22, 10
	.byte MONEDA,	30, 10
	.byte TESORO,	22,  6
	.byte TESORO,	30,  6
	.byte DELAY, 100, 40
	.byte FIN_NIVEL		
NIVEL18:
	.byte JUGADOR, 170,222
	.byte ROCA,     95, 30, 35
	.byte ROCA,    250, 30, 35
	.byte SALARRI,   3,  1, 32
	.byte SALIENTE, 23, 20, 14, 16,  4, LEFT  ,UP
	.byte SALIENTE, 23, 19, 14, 16, 12, LEFT  ,DOWN
	.byte SALIENTE,  1, 20, 14, 16,  4, RIGHT ,UP
	.byte SALIENTE,  1, 19, 14, 16, 12, RIGHT ,DOWN
	.byte ESTALACT, 10,  0, 14, 20, DOWN 	
	.byte BLOQUE,    1,  0, 14,  2, 7
	.byte BLOQUE,   37,  0, 14,  2, 7
	.byte MONEDA,	19, 12
	.byte MONEDA,	20, 12
	.byte MONEDA,	14, 12
	.byte MONEDA,	24, 12
	.byte TESORO,	 4,  2
	.byte TESORO,	35,  2
	.byte DELAY, 100, 40
	.byte FIN_NIVEL	
NIVEL19:
	.byte JUGADOR, 206,222
	.byte ROCABMS,  50, 32, 30
	.byte ROCA,    173, 30, 28
	.byte ROCA,    253, 35, 23
	.byte SALDERE,  39,  3, 16
	.byte SALIENTE, 28, 24, 14, 12,  8, LEFT  ,UP
	.byte SALIENTE,  0, 24, 14, 20, 12, RIGHT ,UP
	.byte BLOQUE,    0, 10, 14,  6,  5
	.byte SALIENTE,  0,  2, 14, 20, 12, RIGHT ,DOWN
	.byte ESTALACT, 20,  2, 14, 10, DOWN 
	.byte ESTALACT, 30,  2, 14, 10, DOWN
	.byte ESTALACT, 25, 10, 14, 14, DOWN  
	.byte TESORO,	 8, 15
	.byte TESORO,	10, 13
	.byte TESORO,	 6, 13
	.byte MONEDA,	26,  9
	.byte MONEDA,	30,  9
	.byte MONEDA,	34,  9
	.byte MONEDA,	38,  9
	.byte DELAY, 100, 40
	.byte FIN_NIVEL
NIVEL20:
	.byte JUGADOR, 110,222
	.byte ROCABMS,  50, 32, 20
	.byte ROCA,    100, 35, 18
	.byte ROCA,    140, 30, 10
	.byte ROCA,    190, 30, 18
	.byte SALDERE,  37, 10, 11
	.byte SALARRI,   9,  2, 12
	.byte SALIENTE, 18, 24, 14, 20, 18, LEFT  ,UP		
	.byte SALIENTE,  0, 24, 14,  8,  2, RIGHT ,UP		
	.byte ESTALACT, 22, 13, 14, 12, DOWN  
	.byte SALIENTE, 22 , 1, 14, 16,  8, LEFT  ,DOWN		
	.byte SALIENTE,  0,  1, 14, 10,  2, RIGHT ,DOWN	
	.byte ESTALACT,  0, 16, 14, 12, UP
	.byte BLOQUE,    0,  3, 14,  2, 18
	.byte TESORO,	 5, 17
	.byte TESORO,	28, 20
	.byte TESORO,	 6,  9
	.byte MONEDA,	22, 13
	.byte MONEDA,	26, 13
	.byte MONEDA,	30, 13
	.byte MONEDA,	34, 13
	.byte DELAY, 100, 40
	.byte FIN_NIVEL
NIVEL21:
	.byte JUGADOR,  70,222
	.byte ROCABMS,  50, 31, 17
	.byte ROCA,    100, 28, 16
	.byte ROCA,    176, 30, 19
	.byte ROCA,    250, 32, 13
	.byte SALDERE,  37, 10, 11
	.byte SALIENTE, 18, 24, 14, 20, 18, LEFT  ,UP
	.byte ESTALACT,  1,  1, 14, 18, DOWN 
	.byte SALIENTE, 22 , 1, 14, 16,  8, LEFT  ,DOWN			
	.byte BLOQUE,    0,  1, 14,  2, 22
	.byte BLOQUE,   38,  1, 14,  2, 22
	.byte MONEDA,	 6, 16
	.byte MONEDA,	10, 16				
	.byte MONEDA,	14, 16
	.byte MONEDA,	18, 16
	.byte MONEDA,	22, 14
	.byte MONEDA,	26, 14
	.byte MONEDA,	30, 14
	.byte TESORO,	34, 14
	.byte DELAY, 100, 40
	.byte FIN_NIVEL
NIVEL22:
	.byte JUGADOR,  70,222
	.byte BLOQUE,    0, 16, 11, 39, 2
	.byte SALIENTE,  0, 18, 11,  8, 2, RIGHT  ,DOWN	
	.byte SALIDAD,   16, 37, 19,  5 
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
	.byte ESTALACT, 10, 24, 15, 16, UP
	.byte BLOQUE,   21,  0, 15, 19, 10
	.byte SALIENTE,  0,  8, 15,  8,  2, RIGHT  ,DOWN
	.byte BLOQUE,    0,  0, 15,  8,  8
	.byte BTESOROS, 23, 13, 11,  8,  2			
	.byte BMONEDAS,  8,  2, 15, 7, 4
	.byte DELAY, 90, 50
	.byte FIN_NIVEL
NIVEL24:
	.byte JUGADOR,  70,222
	.byte SALARRI,   0,  1, 38
	.byte BLOQUE,   16,  1, 14, 6, 5
	.byte SALIENTE,  8,  8, 14, 8, 2, LEFT ,UP
	.byte BLOQUE,    8,  7, 14, 8, 7
	.byte SALIENTE,  8, 14, 14, 8, 2, LEFT ,DOWN
	.byte BLOQUE,   16, 15, 14, 6, 5
	.byte SALIENTE, 22,  6, 14, 6, 2, RIGHT ,DOWN
	.byte SALIENTE, 22, 16, 10, 6, 2, RIGHT ,UP
	.byte BMONEDAS,  1,  2, 15, 3, 10
	.byte BMONEDAS, 30,  2, 15, 5, 10
	.byte BTESOROS, 24, 17, 11, 3,  3			
	.byte BTESOROS, 24,  2, 11, 3,  3
	.byte DELAY, 255, 255
	.byte FIN_NIVEL	
					