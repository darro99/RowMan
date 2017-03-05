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
salidas_l:
  .byte 0,0,0   
puntuacion://$C051 
  .byte 0,0,0,0,0,0
txt_vidas: //Vidas $C057 
  .byte 57, 18, 13, 10, 28, 255
txt_gameover: //GAME OVER $C05D
  .byte 42, 36, 48, 40, 74, 50, 57, 40, 53, 255    	  