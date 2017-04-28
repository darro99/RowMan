tabla_screen_lo:
  .byte [ SCREEN_CHAR +   0 ] & $00ff
  .byte [ SCREEN_CHAR +  40 ] & $00ff
  .byte [ SCREEN_CHAR +  80 ] & $00ff
  .byte [ SCREEN_CHAR + 120 ] & $00ff
  .byte [ SCREEN_CHAR + 160 ] & $00ff
  .byte [ SCREEN_CHAR + 200 ] & $00ff
  .byte [ SCREEN_CHAR + 240 ] & $00ff
  .byte [ SCREEN_CHAR + 280 ] & $00ff
  .byte [ SCREEN_CHAR + 320 ] & $00ff
  .byte [ SCREEN_CHAR + 360 ] & $00ff
  .byte [ SCREEN_CHAR + 400 ] & $00ff
  .byte [ SCREEN_CHAR + 440 ] & $00ff
  .byte [ SCREEN_CHAR + 480 ] & $00ff
  .byte [ SCREEN_CHAR + 520 ] & $00ff
  .byte [ SCREEN_CHAR + 560 ] & $00ff
  .byte [ SCREEN_CHAR + 600 ] & $00ff
  .byte [ SCREEN_CHAR + 640 ] & $00ff
  .byte [ SCREEN_CHAR + 680 ] & $00ff
  .byte [ SCREEN_CHAR + 720 ] & $00ff
  .byte [ SCREEN_CHAR + 760 ] & $00ff
  .byte [ SCREEN_CHAR + 800 ] & $00ff
  .byte [ SCREEN_CHAR + 840 ] & $00ff
  .byte [ SCREEN_CHAR + 880 ] & $00ff
  .byte [ SCREEN_CHAR + 920 ] & $00ff
  .byte [ SCREEN_CHAR + 960 ] & $00ff
tabla_screen_hi:  
  .byte [ [ SCREEN_CHAR +   0 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR +  40 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR +  80 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 120 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 160 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 200 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 240 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 280 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 320 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 360 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 400 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 440 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 480 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 520 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 560 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 600 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 640 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 680 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 720 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 760 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 800 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 840 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 880 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 920 ] & $ff00 ] >> 8
  .byte [ [ SCREEN_CHAR + 960 ] & $ff00 ] >> 8
tabla_spy:	//Tabla para accerder a las coordenadas y de los sprites 1-7
  .byte 3,5,7,9,11,13,15		  
rocas_y:	//Coordenadas Y de inicio para las rocas ($C032)
  .byte 0,0,0,0,0,0,0
rocas_vel:	//Velocidad de cada una de las rocas ($C039)
  .byte 0,0,0,0,0,0,0
rocas_vela:  
  .byte 0,0,0,0,0,0,0
rocas_del:	//Delay actual de cada una de las rocas (AnimaciOn)  
  .byte 0,0,0,0,0,0,0  
salidas_l:
  .byte 0,0,0   
puntuacion://$C058
  .byte 0,0,0,0,0,0
txt_vidas: //Vidas $C05E
  .byte 57, 18, 13, 10, 28, 255
txt_gameover: //GAME OVER $C064
  .byte 42, 36, 48, 40, 74, 50, 57, 40, 53, 255
txt_rowman: //ROWMAN $C06E
  .byte 53, 50, 58, 48, 36, 49, 255
//Programado por DARRO99 $C075
  .byte  51, 27, 24, 16, 27, 10, 22, 10, 13, 24, 74, 25, 24, 27, 74, 39, 36, 53, 53, 50, 09, 09, 255
//Graficos por ERRAZKING $C08C
  .byte  42, 27, 63, 15, 18, 12, 24, 28, 74, 25, 24, 27, 74, 40, 53, 53, 36, 61, 46, 44, 49, 42, 255
//2017 $C0A3
  .byte  02, 00, 01, 07, 255
//Musica por Arkanix Labs $C0A8
  .byte  48, 67, 28, 18, 12, 10, 74, 25, 24, 27, 74, 36, 27, 20, 10, 23, 18, 33, 74, 47, 10, 11, 28, 255 
//Beta 9 $c0c0
.byte  37, 14, 29, 10, 74, 09, 255
//Enhorabuena!! $c0c7
.byte  40, 23, 17, 24, 27, 10, 11, 30, 14, 23, 10, 69, 69, 255
//Has conseguido que Rogelio escape $c0d5
.byte  43, 10, 28, 74, 12, 24, 23, 28, 14, 16, 30, 18, 13, 24, 74, 26, 30, 14, 74, 53, 24, 16, 14, 21, 18, 24, 74, 14, 28, 12, 10, 25, 14, 255 
// de las cuevas. $c0f7
.byte 13, 14, 74, 21, 10, 28, 74, 12, 30, 14, 31, 10, 28, 72, 255
//Gracias por jugar. $c105
.byte 42, 27, 10, 12, 18, 10, 28, 74, 25, 24, 27, 74, 19, 30, 16, 10, 27, 72, 255
//Ayuda a Rogelio a salir del laberinto 
//$c119
.byte 36, 34, 30, 13, 10, 74, 10, 74, 53, 24, 16, 14, 21, 18, 24, 74, 10, 74, 28, 10, 21, 18, 27, 74, 13, 14, 21, 74, 21, 10, 11, 14, 27, 18, 23
.byte 29, 24, 255
//de cuevas en el que se ha metido 
//$c13f
.byte 13, 14, 74, 12, 30, 14, 31, 10, 28, 74, 14, 23, 74, 14, 21, 74, 26, 30, 14, 74, 28, 14, 74, 17, 10, 74, 22, 14, 29, 18, 13, 24, 255
//buscando los mejores peces para su cena.
//$c160
.byte 11, 30, 28, 12, 10, 23, 13, 24, 74, 21, 24, 28, 74, 22, 14, 19, 24, 27, 14, 28, 74, 25, 14, 12, 14, 28, 74, 25, 10, 27, 10, 74, 28, 30, 74, 12, 14, 23, 10, 72, 255
//Las cuevas son inestables y caen rocas 
//$c189
.byte 47, 10, 28, 74, 12, 30, 14, 31, 10, 28, 74, 28, 24, 23, 74, 18, 23, 14, 28, 29, 10, 11, 21, 14, 28, 74, 34, 74, 12, 10, 14, 23, 74, 27, 24, 12, 10, 28, 255
//constantemente. $c1b0
.byte 12, 24, 23, 28, 29, 10, 23, 29, 14, 22, 14, 23, 29, 14, 72, 255
//Gana mas puntos recogiendo monedas M 
//$c1c0
.byte 42, 10, 23, 10, 74, 22, 10, 28, 74, 25, 30, 23, 29, 24, 28, 74, 27, 14, 12, 24, 16, 18, 14, 23, 13, 24, 74, 22, 24, 23, 14, 13, 10, 28, 74, 48, 255
// y tesoros T $c1e5
.byte 34, 74, 29, 14, 28, 24, 27, 24, 28, 74, 97, 255
//Suerte... la necesitaras... $c1f1
.byte 54, 30, 14, 27, 29, 14, 72, 72, 72, 74, 21, 10, 74, 23, 14, 12, 14, 28, 18, 29, 10, 27, 10, 28, 72, 72, 72, 255