10 print chr$(147)
20 PRINT "                                    {brown}{166}{166}{166}"
30 PRINT "                                {166}{166}{166}{166}{166}{166}{166}{166}";
40 PRINT "                                {166}{166}{166}{166}{166}{166}{166}{166}";
50 PRINT "                               {166}{166}{166}{166}{166}{166}{166}{166}{166}";
60 PRINT "          {166}                    {166}{166}{166}{166}{166}{166}{166}{166}{166}";
70 PRINT "         {166}{166}{166}{166}{166}{166}               {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
80 PRINT "         {166}{166}{166}{166}{166}{166}              {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
90 PRINT "        {166}{166}{166}{166}{166}{166}{166}              {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
100 PRINT "        {166}{166}{166}{166}{166}{166}{166}{166}             {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
110 PRINT "        {166}{166}{166}{166}{166}{166}{166}{166}             {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
120 PRINT "        {166}{166}{166}{166}{166}{166}{166}{166}             {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
130 PRINT "        {166}{166}{166}{166}{166}{166}{166}{166}            {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
140 PRINT "        {166}{166}{166}{166}{166}{166}{166}{166}{166}           {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
150 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}          {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
160 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
170 PRINT "      {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
180 PRINT "     {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
190 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
200 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
210 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
220 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}"
230 poke 53285,2: rem multicolor 1
240 poke 53286,7: rem multicolor 2
250 poke 53269,255 : rem set all 8 sprites visible
260 for x=12800 to 12800+383: read y: poke x,y: next x: rem sprite generation
270 :: rem sprite0
280 poke 53287,15: rem color = 15
290 poke 2040,200: rem pointer
300 poke 53248, 44: rem x pos
310 poke 53249, 120: rem y pos
320 :: rem sprite1
330 poke 53288,12: rem color = 12
340 poke 2041,201: rem pointer
350 poke 53250, 92: rem x pos
360 poke 53251, 120: rem y pos
370 :: rem sprite2
380 poke 53289,7: rem color = 7
390 poke 2042,202: rem pointer
400 poke 53252, 140: rem x pos
410 poke 53253, 120: rem y pos
420 :: rem sprite3
430 poke 53290,7: rem color = 7
440 poke 2043,203: rem pointer
450 poke 53254, 188: rem x pos
460 poke 53255, 120: rem y pos
470 :: rem sprite4
480 poke 53291,15: rem color = 15
490 poke 2044,204: rem pointer
500 poke 53256, 200: rem x pos
510 poke 53257, 140: rem y pos
520 :: rem sprite5
530 poke 53292,15: rem color = 15
540 poke 2045,205: rem pointer
550 poke 53258, 92: rem x pos
560 poke 53259, 172: rem y pos
570 poke 53276, 63: rem multicolor
580 poke 53277, 0: rem width
590 poke 53271, 0: rem height
600 :: rem sprite0 / multicolor / color: 15
610 data 0,0,0,0,40,0,0,40,0,0,40,0,0,40,0,3
620 data 190,192,2,255,128,10,170,160,2,190,128,2,190,128,10,190
630 data 160,10,190,160,2,170,128,2,170,128,0,170,0,0,130,0
640 data 10,130,160,34,0,136,40,0,40,32,0,8,168,0,42,143
650 :: rem sprite1 / multicolor / color: 12
660 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
670 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
680 data 0,0,0,0,0,0,0,0,0,0,0,20,0,0,48,0
690 data 0,52,0,0,12,0,0,16,0,0,12,0,0,16,0,140
700 :: rem sprite2 / multicolor / color: 7
710 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
720 data 0,0,0,0,0,0,0,0,116,0,0,24,0,0,0,0
730 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
740 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135
750 :: rem sprite3 / multicolor / color: 7
760 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
770 data 0,0,0,0,0,0,0,0,0,0,29,0,0,60,0,0
780 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
790 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135
800 :: rem sprite4 / multicolor / color: 15
810 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
820 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
830 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
840 data 84,0,21,252,0,63,169,85,106,171,255,234,170,170,170,143
850 :: rem sprite5 / multicolor / color: 15
860 data 240,0,240,60,16,192,23,231,60,7,100,51,7,21,255,7
870 data 182,192,13,245,208,13,229,144,19,181,176,23,158,80,5,94
880 data 160,37,118,164,1,89,20,53,217,4,12,249,64,12,242,64
890 data 5,241,84,34,53,68,60,48,40,44,0,8,168,0,42,143
1500 REM GENERATED ML LOADER
1510 SA = 49152
1520 FOR N = 0 TO 464
1530 READ A% : POKE SA+N,A%: NEXT N
1540 SYS SA
1550 END 
1560 DATA 169,0,141,188,193,141,189,193
1570 DATA 141,190,193,141,191,193,141,192
1580 DATA 193,141,193,193,141,194,193,141
1590 DATA 195,193,169,0,141,33,208,169
1600 DATA 1,141,134,2,169,160,162,0
1610 DATA 157,192,7,232,224,40,208,248
1620 DATA 162,0,157,152,7,232,224,40
1630 DATA 208,248,162,0,157,112,7,232
1640 DATA 224,20,208,248,162,0,157,72
1650 DATA 7,232,224,19,208,248,162,0
1660 DATA 157,32,7,232,224,17,208,248
1670 DATA 162,0,157,248,6,232,224,15
1680 DATA 208,248,169,9,162,0,162,0
1690 DATA 157,192,219,232,224,40,208,248
1700 DATA 162,0,157,152,219,232,224,40
1710 DATA 208,248,162,0,157,112,219,232
1720 DATA 224,20,208,248,162,0,157,72
1730 DATA 219,232,224,19,208,248,162,0
1740 DATA 157,32,219,232,224,17,208,248
1750 DATA 162,0,157,248,218,232,224,15
1760 DATA 208,248,169,255,205,18,208,208
1770 DATA 251,169,17,141,21,208,169,0
1780 DATA 141,188,193,169,1,141,189,193
1790 DATA 169,1,44,31,208,240,38,169
1800 DATA 48,141,21,208,173,0,208,141
1810 DATA 10,208,173,1,208,141,11,208
1820 DATA 162,0,189,202,193,157,241,5
1830 DATA 169,1,157,241,217,232,224,7
1840 DATA 208,240,76,187,193,169,16,44
1850 DATA 30,208,240,24,238,32,208,162
1860 DATA 0,189,196,193,157,241,5,169
1870 DATA 1,157,241,217,232,224,2,208
1880 DATA 240,76,187,193,169,1,44,0
1890 DATA 220,208,10,169,19,141,21,208
1900 DATA 169,252,141,189,193,169,2,44
1910 DATA 0,220,208,5,169,2,141,189
1920 DATA 193,169,4,44,0,220,208,10
1930 DATA 169,25,141,21,208,169,255,141
1940 DATA 188,193,169,8,44,0,220,208
1950 DATA 10,169,21,141,21,208,169,1
1960 DATA 141,188,193,24,173,190,193,109
1970 DATA 188,193,141,190,193,44,188,193
1980 DATA 48,4,169,0,16,2,169,255
1990 DATA 109,191,193,141,191,193,24,173
2000 DATA 192,193,109,189,193,141,192,193
2010 DATA 44,189,193,48,4,169,0,16
2020 DATA 2,169,255,109,193,193,141,193
2030 DATA 193,24,173,194,193,109,190,193
2040 DATA 141,194,193,173,0,208,109,191
2050 DATA 193,141,0,208,141,2,208,141
2060 DATA 4,208,141,6,208,24,173,195
2070 DATA 193,109,192,193,141,195,193,173
2080 DATA 1,208,109,193,193,141,1,208
2090 DATA 141,3,208,141,5,208,141,7
2100 DATA 208,169,16,44,0,220,240,3
2110 DATA 76,162,192,96,0,0,0,0
2120 DATA 0,0,0,0,12,1,14,4
2130 DATA 5,4,3,18,1,19,8,5
2140 DATA 4