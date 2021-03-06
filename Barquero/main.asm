

.var music = LoadSid("bin/Bambam.sid")
:BasicUpstart2(main)

//Sprites
.pc = $2980
//.import binary "bin/sprites.bin"
.import binary "bin/Sprites0425.raw"

//UGDs (GrAficos definidos por el usuario)
.var dataChars = LoadBinary("bin/charset0425.bin")
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

.import source "peces.asm"

.import source "fx.asm"
main:
       
   
       
    lda #0
    sta BACKGROUND
    sta BORDER
    //sta roca_suena
    //sta roca_sonando
    
    jsr init_sprites
    jsr init_screen
    jsr init_pez
    
    //INCIALIZACION SIN PORTADA
	/*lda #30
    sta pez.max_delay
    ldy #NUMVIDAS
    sty vars_game.vidas
	lda #4
	sta vars_game.nivel
	jsr init_fx
	jsr gen_niveles
	jsr init_agua*/
	

	//INCIALIZACION CON PORTADA
	jsr pant_init
	jsr pez_sale
	
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
	asl $d019
	jsr music.play
	jsr comp_fire
	jsr pez_anim
	jsr principal
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
	jsr peces
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

