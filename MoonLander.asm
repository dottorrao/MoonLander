f*=$c000


init    ;## initialization of variables ##
        
        lda #%00010001  ; make visible only lander and platform sprite
        sta $D015

        lda #44         ; position of lander
        sta $d000
        lda #120
        sta $d001
        
        lda #150        ; position of platform
        sta $d008
        lda #165
        sta $d009

        lda #35         ;lenght for fuel bar
        sta decfl
        lda #35         ;number of game cycle to do before to decrement fuel bar by 1
        sta decflF      
        sta decflFBk    ;this is needed to restart the counter of game cycle 
        
        lda #0          ;inizialization of variables to manage lander movement
        sta ax           
        sta ay  
        sta vx           
        sta vx+1
        sta vy  
        sta vy+1
        sta pxL          
        sta pyL

        lda #%00000000  ; %00000000 = black
        sta $d021       ; backgoud color set to black    
        lda #1          ; $00 = white
        sta $0286       ; text color set to white

        lda #%00000001  ; these variables are used for joystick management  
        sta up          ;  using these variables, it's possible to deactivate joystick
        lda #%00000010  ;  when fuel is over
        sta dw 
        lda #%00000100
        sta lf
        lda #%00001000
        sta rg
        
        ;## This section of code is to generate the bottom part of landscape ##
                  
        lda #160        ; chars and colour are set chars by chars
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
drawfL  lda fl_lab,x    ; drow of fuel label
        sta $0770,x
        lda #1
        sta $DB70,x
        inx
        cpx #4
        bne drawfL

        ldx #0
        
drawfLBar               ; drow of fuel bar  
        lda #160
        sta $0775,x
        lda #1
        sta $DB75,x
        inx
        cpx decfl       
        bne drawfLBar
 
       
        ldx #0
drawWlc lda wl_msg,x   ; diaply message "PRESS BUTTON TO START"
        sta $05F1,x
        lda #1
        sta $D9F1,x
        inx
        cpx #18
        bne drawWlc

welcome lda #%00010000 ; mask joystick button push 
        bit $dc00      ; bitwise AND with address 56320.
        bne welcome    ; button pressed -> continue. Program wait until button pressed.

        ldx #0
delWelcome 
        lda wl_msg_bl,x ; delete welcome message  
        sta $05F1,x
        lda #1
        sta $D9F1,x
        inx
        cpx #18
        bne delWelcome

        ;## MAIN LOOP ##

main    lda #$ff ; 255 = %11111111 ;>> Trick to make the program more slow.

wait    cmp $d012                  ;  wait until that raster is at row 255      
        bne wait                   ;  $d012 contains the number of screen row that raster is drowing
                                   
        lda #%00010001             ;>> Into register $D015 are reported which
        sta $D015                  ;  sprites are visible or not. At beginning only lander and platform.
        lda #0
        sta ax
        lda #1
        sta ay
        
        ; #######################################################
        ; collision management between lander and background.
        ; $d01f 
        ; Bit #x: 1 = Sprite #x collided with background.
        ; If collision between lander and background is detected,
        ; lander sprite is disabled and game quits.
        ; #######################################################
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
        jmp exit         ; game quits!
        
        ; #######################################################
        ; collision management between lander and platform
        ; $d01e 
        ; Bit #x: 1 = Sprite #x collided with another sprite.
        ; ########################################################
cont01  lda #%00000001  
        bit $d01e
        beq cont02
        jmp landed

landed  ldx #0
drawOK  lda ld_msg,x    ; diaply message for landing
        sta $05F1,x     
        lda #1          
        sta $D9F1,x
        inx
        cpx #6
        bne drawOk
        jmp exit        ; game quits!

        ;## Joystick management. If program arrives here, no collisions are detected. ##

cont02  lda up          ; mask joystick up movement 
        bit $dc00       ; bitwise AND with address 56320
        bne cont1       ; no thrust up
        lda #%00010011
        sta $D015
        lda #-4
        sta ay

cont1   lda dw          ; mask joystick down movement 
        bit $dc00       ; bitwise AND with address 56320
        bne cont2       ; no thrust down
        lda #2
        sta ay

cont2   lda lf          ; mask joystick left movement 
        bit $dc00       ; bitwise AND with address 56320
        bne cont3       ; no thrust left
        lda #%00011001
        sta $D015
        lda #-1
        sta ax

cont3   lda rg          ; mask joystick right movement 
        bit $dc00       ; bitwise AND with address 56320
        bne cont4       ; no thrust right
        lda #%00010101
        sta $D015
        lda #1
        sta ax

        ;## Management of lander position ##

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
        
        ;## Management of fuel bar ##
        
        ldy decflF
        dey
        sty decflF
        cpy #0
        bne endLoop     ; decrement fuel bar only if 'decflF' cycles game are passed,
        ldy decfl       
        dey
        cpy #0
        beq endFuel     ; decrement fuel bar 
        lda #160
        sta $0775,y
        lda #0
        sta $DB75,y
        sty decfl       
        lda decflFBk    ; if fuel bar has been decremented, it's needed to restore the number of cycles game
        sta decflF
        
endLoop jmp main 

        ;## if fule bar is OVER ##

endFuel
        lda #%00010001   ; disable lander sprite for engines
        sta $D015        
        lda #%00000000   ; make the Joystick no longer available
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
        jmp main            ; in case of out of fuel, process go back to main
                            ; to simulate the lander precipitare    


         ;## EXIT: game wait until that fire button is pressed, then jump to init##
exit    
restart lda #%00010000 ; mask joystick button push 
        bit $dc00      ; bitwise AND with address 56320
        bne restart    ; button pressed -> continue
        jmp init

        ;## variables ##

ax      byte 0
ay      byte 0  
vx      byte 0
        byte 0
vy      byte 0
        byte 0
pxL     byte 0
pyL     byte 0
decfl   byte 0          ; decrement fluel
decflF  byte 0          ; counter of game cycles
decflFBk byte 0         ; counter of game cycles backup to restore them

up      byte 0          ; for Joistick management
dw      byte 0
lf      byte 0
rg      byte 0

         ;## STRINGS ##

wl_msg  
        byte 16,18,5,19,19,32,6,9,18,5,32,20,15,32,12,1,14,4            ;PRESS FIRE TO LAND

wl_msg_bl 
        byte 32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32,32      ;SPACE ROW

ld_msg  
        byte 12,1,14,4,5,4                                              ; LANDED

cr_msg  
        byte 3,18,1,19,8,5,4                                            ; CRASHED

fl_lab  
        byte 6,21,5,12                                                  ; FUEL

endFuel_msg
        byte 18,21,14,32,1,21,20,32,15,6,32,6,21,5,12                   ; RUN OUT OF FUEL
        