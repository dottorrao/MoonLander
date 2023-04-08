*=$c000

; ###########################################
; INITIALIZATION OF ALL VARIABLES WITH VALUE 0
; ###########################################

init    lda #0
        sta ax ; accelerazione low
        sta ay  
        sta vx ; velocità low-high
        sta vx+1
        sta vy  
        sta vy+1
        sta pxL ; posizione low
        sta pyL


; ##############################################################################
; SCREEN LANDSCAPE. USING A LOOP THE LANDSCAPE
;       IS GENERATED ROW BY ROW. X REGISTER IS USED TO COUNT THE NUMBER OF CHAR
;       TO DROW ROW BY ROW. ACCUMULATOR CONTAINS THE CHARS TO DROW, IN THIS 
;       CASE A SPACE. rowX BLOCKS ARE USED TO GENERATED THE ROWS, rowXc to define
;       THE COLOUR OF EACH CHAR. FOR EACH CHAR/COLOUR SEE THE MEMORY MAPS 
;       REPORTED INTO PROGRAMMER USER MANUAL.
; ##############################################################################

        lda #160
        ldx #0

row1    sta $07C0,x
        inx
        cpx #40
        bne row1

        ldx #0
row2    sta $0798,x
        inx
        cpx #40
        bne row2

        ldx #0
row3    sta $770,x
        inx
        cpx #20
        bne row3

        ldx #0
row4    sta $748,x
        inx
        cpx #19
        bne row4


        ldx #0
row5    sta $720,x
        inx
        cpx #17
        bne row5

        ldx #0
row6    sta $6F8,x
        inx
        cpx #15
        bne row6

        
        lda #9
        ldx #0

        ldx #0
row1c   sta $DBC0,x
        inx
        cpx #40
        bne row1c
        
        ldx #0
row2c   sta $DB98,x
        inx
        cpx #40
        bne row2c     

        ldx #0
row3c   sta $DB70,x
        inx
        cpx #20
        bne row3c     

        ldx #0
row4c   sta $DB48,x
        inx
        cpx #19
        bne row4c     

        ldx #0
row5c   sta $DB20,x
        inx
        cpx #17
        bne row5c     

        ldx #0
row6c   sta $DAF8,x
        inx
        cpx #15
        bne row6c 

; ###########################################
; MAIN CODE
; ###########################################

  
start   lda #$ff ; 255 = %11111111 ;>> Trick to make the program more slow.
wait    cmp $d012                  ;  wait until that raster is at row 255      
        bne wait                   ;  $d012 contains the number of screen row that 
                                   ;  raster is drowing
        lda #%00010001             ;>> Into register $D015 are reported which
        sta $D015                  ;  sprites are visible or not. At beginning      
                                   ;  only lander and platform.
        lda #0
        sta ax
        lda #1
        sta ay
        
        ; ###########################################
        ; collision management between lander and background.
        ; $d01f 
        ; Bit #x: 1 = Sprite #x collided with background.
        ; If collision between lander and background is detected,
        ; lander sprite is disabled and game quits.
        ; ###########################################
        lda #%00000001   
        bit $d01f          
        beq cont01             
        lda #%00110000  ; disable lander sprite and enable explosion
        sta $D015       ;
        lda $d000       ; move explosion sprite lo right location
        sta $D00A       ;
        lda $d001
        sta $D00B
        jmp exit

        ; ###########################################
        ; collision management between lander and platform
        ; $d01e 
        ; Bit #x: 1 = Sprite #x collided with another sprite.
        ; ###########################################
cont01  lda #%00010000  
        bit $d01e
        beq cont02
        inc $d021

cont02  lda #%00000001 ; mask joystick up movement 
        bit $dc00      ; bitwise AND with address 56320
        bne cont1      ; no thrust up
        lda #%00010011
        sta $D015
        lda #-4
        sta ay

cont1   lda #%00000010 ; mask joystick down movement 
        bit $dc00      ; bitwise AND with address 56320
        bne cont2      ; no thrust down
        lda #2
        sta ay

cont2   lda #%00000100 ; mask joystick left movement 
        bit $dc00      ; bitwise AND with address 56320
        bne cont3      ; no thrust left
        lda #%00011001
        sta $D015
        lda #-1
        sta ax

cont3   lda #%00001000 ; mask joystick right movement 
        bit $dc00      ; bitwise AND with address 56320
        bne cont4      ; no thrust right
        lda #%00010101
        sta $D015
        lda #1
        sta ax

cont4   clc
        lda vx  ; vx = vx + ax * dt
        adc ax
        sta vx
        bit ax
        bmi mix
        lda #0
        bpl mix2
mix     lda #255
mix2    adc vx+1
        sta vx+1

        clc
        lda vy  ; vy = vy + ay * dt
        adc ay
        sta vy
        bit ay
        bmi miy
        lda #0
        bpl miy2
miy     lda #255
miy2    adc vy+1
        sta vy+1

        clc
        ;lander
        lda pxL  ; px = px + vx * dt
        adc vx
        sta pxL
        lda $d000
        adc vx+1
        sta $d000 ; lander
        sta $d002 ; mainEngine
        sta $d004 ; left roket
        sta $d006 ; right roket
        
        
        clc
        lda pyL  ; py = py + vy * dt
        adc vy
        sta pyL
        lda $d001
        adc vy+1
        sta $d001 ; lander
        sta $d003 ; mainEngine
        sta $d005 ; left roket
        sta $d007 ; right roket

        lda #%00010000 ; mask joystick button push 
        bit $dc00      ; bitwise AND with address 56320
        beq exit       ; button pressed -> exit
        jmp start
exit    rts            ; back to basic

ax      byte 0
ay      byte 0
vx      byte 0
        byte 0
vy      byte 0
        byte 0
pxL     byte 0
pyL     byte 0