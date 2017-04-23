

.var music = LoadSid("bin/Bambam.sid")
:BasicUpstart2(main)

//Sprites
.pc = $2980
//.import binary "bin/sprites.bin"
.import binary "bin/Sprites0422.raw"

//UGDs (GrAficos definidos por el usuario)
.var dataChars = LoadBinary("bin/charset.bin")
.pc = $3800
myDataChars: .fill dataChars.getSize(), dataChars.get(i)



.pc = $4000
//Importa las constantes
.import source "constants.asm"

.import source "agua.asm"

.import source "cuevas.asm"

.import source "gen_niveles.asm"

.import source "estalac.asm"

.import source "bloque.asm"

.import source "sprites.asm"

.import source "joystick.asm"

.import source "screen.asm"

.import source "general.asm"

.import source "rocas.asm"

.import source "finales.asm"
main:
       
   
       
    lda #0
    sta BACKGROUND
    sta BORDER
    //sta vars_game.is_dead  
    
    jsr init_sprites
    jsr init_screen
    
    //INCIALIZACION SIN PORTADA
    /*ldy #NUMVIDAS
    sty vars_game.vidas
	lda #53
	sta vars_game.nivel
	jsr gen_niveles
	jsr init_agua*/

	//INCIALIZACION CON PORTADA
	jsr pant_init
	
	ldx #0
	ldy #0
	lda #music.startSong-1
	jsr music.init  
	
	lda #<irq
	sta $0314
	lda #>irq
	sta $0315
	asl $d019
	lda #$7b
	sta $dc0d
	lda #$81
	sta $d01a
	lda #$1b
	sta $d011
	lda #$80
	sta $d012
	cli
	this:
	jmp this

  	
 	
 //================================
// Our custom interrupt routines 
//================================

irq: 
	ldx vars_game.is_dead
	cpx #INICIO
	//bne end_irq
	bcc end_irq
cont_irq:	
	jsr comp_fire
	jsr principal
	asl $d019
	jsr music.play
	pla
	tay
	pla
	tax
	pla
	rti

end_irq:
	jsr joystick
	jsr llenado
	jsr rocas
	jsr prin_muerto
	jsr cmp_coli
    jmp $ea31      // return to Kernel routine	
	
.pc=music.location "Music"
.fill music.size, music.getData(i)
	
.pc = $C000
.import source "tabla_txt.asm"

.pc = $8000
.import source "niveles.asm"	
//noends:
//jmp noends 	

