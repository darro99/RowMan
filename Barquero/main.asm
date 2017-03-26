
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


:BasicUpstart2(main)

//Sprites
.pc = $2980
.import binary "bin/sprites.bin"

//UGDs (GrAficos definidos por el usuario)
.var dataChars = LoadBinary("bin/CHARS.RAW")
.pc = $3800
myDataChars: .fill dataChars.getSize(), dataChars.get(i)

.pc = $C000
.import source "tabla_txt.asm"

.pc = $8000
.import source "niveles.asm"

main:
       
    lda #0
    sta BACKGROUND
    sta BORDER
    sta vars_game.is_dead  
    
    jsr init_sprites
    jsr init_screen
    
    ldy #NUMVIDAS
    sty vars_game.vidas
   
	lda #44
	sta vars_game.nivel
	
	jsr gen_niveles
	jsr init_agua
		
	sei
	ldy #$7f   // $7f = %01111111
  	sty $dc0d  // Turn off CIAs Timer interrupts ($7f = %01111111)
  	sty $dd0d  // Turn off CIAs Timer interrupts ($7f = %01111111)
  	lda $dc0d  // by reading $dc0d and $dd0d we cancel all CIA-IRQs in queue/unprocessed
  	lda $dd0d  // by reading $dc0d and $dd0d we cancel all CIA-IRQs in queue/unprocessed
   
  	lda #$01   // Set Interrupt Request Mask...
  	sta $d01a  // ...we want IRQ by Rasterbeam (%00000001)

  	lda #<irq  // point IRQ Vector to our custom irq routine
  	ldx #>irq 
  	sta $0314   // store in $314/$315
  	stx $0315   

  	lda #$00   // trigger interrupt at row zero
  	sta $d012

  	cli        // clear interrupt disable flag   
  	jmp *
 	
 //================================
// Our custom interrupt routines 
//================================

irq: 
	jsr joystick
	jsr llenado
	jsr rocas
	jsr principal
	jsr cmp_coli
	
end_irq:
    jmp $ea31      // return to Kernel routine	
	
//noends:
//jmp noends 	

