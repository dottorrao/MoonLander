f*=$c000


; ###########################################
; INITIALIZATION OF ALL VARIABLES WITH VALUE 0
; ###########################################

init    
        
        lda #%00010001  ; make visible only lander and platform sprite
        sta $D015

        lda #44         ; position of lander
        sta $d000
        lda #120
        sta $d001
        
        lda #150         ; position of platform
        sta $d008
        lda #165
        sta $d009

        lda #35         ; index for fuel bar
        sta decfl
        lda #35          ;35
        sta decflF 
        sta decflFBk
        
        ;jsr $e544      ; clean screen
        lda #0
        sta ax          ; accelerazione low
        sta ay  
        sta vx          ; velocità low-high
        sta vx+1
        sta vy  
        sta vy+1
        sta pxL         ; posizione low
        sta pyL

        ;lda #%00000111  ; %00000111 = brown
        ;sta $d020       ; border color set to brown
        lda #%00000000   ; %00000000 = black
        sta $d021        ; backgoud color set to black    
        lda #1           ; $00 = white
        sta $0286        ; text color set to write

        lda #%00000001
        sta up 
        lda #%00000010
        sta dw 
        lda #%00000100
        sta lf
        lda #%00001000
        sta rg
        
        
        
; ##############################################################################
; SCREEN LANDSCAPE. USING A LOOP THE LANDSCAPE
;       IS GENERATED ROW BY ROW. X REGISTER IS USED TO COUNT THE NUMBER OF CHAR
;       TO DROW ROW BY ROW. ACCUMULATOR CONTAINS THE CHARS TO DROW, IN THIS 
;       CASE A SPACE. rowX BLOCKS ARE USED TO GENERATED THE ROWS, rowXc to define
;       THE COLOUR OF EACH CHAR. FOR EACH CHAR/COLOUR SEE THE MEMORY MAPS 
;       REPORTED INTO PROGRAMMER USER MANUAL.
; ##############################################################################       
;        ldy #>_screen_data
;        ldx #<_screen_data
;        stx $FB
;        sty $FC
;        ldx #$00
;        ldy #$04
;        stx $FD 
;        sty $FE
;        
;        ldy #$00
;
;loop    
;        lda ($FB),y
;        sta ($FD),y
;        iny
;        bne loop
;        inc $FC
;        inc $FE
;        ldx $FE
;        cmp #$07
;        bne loop

;       ldy #$00

;lastlap
;        lda ($FB),y
;        sta ($FD),y
;        iny
;        cpy #$E8
;        bne lastlap
;;;;;;;;;;;;;;;;;;;;;;;

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
        
        ldx #0
drawfL  lda fl_lab,x    ; diaply fuel label
        sta $0770,x
        lda #1
        sta $DB70,x
        inx
        cpx #4
        bne drawfL

        ldx #0
        
drawfLBar  
        lda #160
        sta $0775,x
        lda #1
        sta $DB75,x
        inx
        cpx decfl       
        bne drawfLBar

; ###########################################
; MAIN CODE
; ###########################################

 
        ;####################################
        ;PRESS BUTTON TO START
        ;####################################
        ldx #0
drawWlc lda wl_msg,x   ; diaply welcome message
        sta $05F1,x
        lda #1
        sta $D9F1,x
        inx
        cpx #18
        bne drawWlc

welcome lda #%00010000 ; mask joystick button push 
        bit $dc00      ; bitwise AND with address 56320
        bne welcome    ; button pressed -> continue


        ldx #0
delWelcome 
        lda wl_msg_bl,x   ; diaply welcome message
        sta $05F1,x
        lda #1
        sta $D9F1,x
        inx
        cpx #18
        bne delWelcome


main    lda #$ff ; 255 = %11111111 ;>> Trick to make the program more slow.
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
        lda $d000       ; move explosion sprite to right location
        sta $D00A       ;
        lda $d001
        sta $D00B
        ldx #0
drawCr  lda cr_msg,x    ; diaply message for crash
        sta $05F1,x
        lda #1
        sta $D9F1,x
        inx
        cpx #7
        bne drawCr
        jmp exit         ; game end!
        ; ###########################################
        ; collision management between lander and platform
        ; $d01e 
        ; Bit #x: 1 = Sprite #x collided with another sprite.
        ; ###########################################
cont01  lda #%00000001  
        bit $d01e
        beq cont02
        jmp landed

landed  ldx #0
drawOK  lda ld_msg,x    ; diaply message for landing
        sta $05F1,x     ; STRANGE BEHAVIOUR HERE!!! SEEMS THAT OLWAYS COLLISION
        lda #1          ; IS PRESENT. WHY???
        sta $D9F1,x
        inx
        cpx #6
        bne drawOk
        jmp exit      ; game end!

cont02  lda up ; mask joystick up movement 
        bit $dc00      ; bitwise AND with address 56320
        bne cont1      ; no thrust up
        lda #%00010011
        sta $D015
        lda #-4
        sta ay

cont1   lda dw ; mask joystick down movement 
        bit $dc00      ; bitwise AND with address 56320
        bne cont2      ; no thrust down
        lda #2
        sta ay

cont2   lda lf ; mask joystick left movement 
        bit $dc00      ; bitwise AND with address 56320
        bne cont3      ; no thrust left
        lda #%00011001
        sta $D015
        lda #-1
        sta ax

cont3   ;lda #%00001000 ; mask joystick right movement 
        lda rg         ; mask joystick right movement 
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
 
        ;LDA $d01e
        ;LDX $d01e
        ;JSR $BDCD
        ;JSR $E544

        ;lda #%00010000 ; mask joystick button push 
        ;bit $dc00      ; bitwise AND with address 56320
        ;beq exit       ; button pressed -> exit
        
        
        ldy decflF
        dey
        sty decflF
        cpy #0
        bne endLoop
        ldy decfl
        dey
        cpy #0
        beq endFuel
        lda #160
        sta $0775,y
        lda #0
        sta $DB75,y
        sty decfl
        lda decflFBk
        sta decflF
        
endLoop jmp main 

endFuel
        lda #%00010001   ; disable lander sprite for engines
        sta $D015        ;
        ;lda $d000       ; move explosion sprite to right location
        ;sta $D00A       ;
        ;lda $d001
        ;sta $D00B
        lda #%00000000
        sta up 
        lda #%00000000
        sta dw 
        lda #%00000000
        sta lf
        lda #%00000000
        sta rg
        
        ldx #0
drawEndFuel
        lda endFuel_msg,x   ; diaply message for out of fuel
        sta $05F1,x
        lda #1
        sta $D9F1,x
        inx
        cpx #15
        bne drawEndFuel  
        jmp main

exit    ;rts           ; back to basic
restart lda #%00010000 ; mask joystick button push 
        bit $dc00      ; bitwise AND with address 56320
        bne restart    ; button pressed -> continue
        jmp init


ax      byte 0
ay      byte 0  
vx      byte 0
        byte 0
vy      byte 0
        byte 0
pxL     byte 0
pyL     byte 0
decfl   byte 0          ; decrement fluel
decflF  byte 0          ; flag for decrement of fuel
decflFBk byte 0 

up      byte 0
dw      byte 0
lf      byte 0
rg      byte 0

wl_msg  
        byte 16,18,5,19,19,32,6,9,18,5,32,20,15,32,12,1,14,4 ;PRESS FIRE TO LAND

wl_msg_bl 
        byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32

ld_msg  
        byte 12,1,14,4,5,4   ; LANDED

cr_msg  
        byte 3,18,1,19,8,5,4 ; CRASHED

fl_lab  
        byte 6,21,5,12       ; FUEL

endFuel_msg
        byte 18,21,14,32,1,21,20,32,15,6,32,6,21,5,12 ; RUN OUT OF FUEL
        

; Screen 1 -  Screen data
;_screen_data
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$20,$66,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $20,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$20,$20,$20,$20,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66
;        BYTE    $66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66,$66