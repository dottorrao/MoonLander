10 print chr$(147)
20 PRINT "                                      {brown}{166}{166}";
30 PRINT "                   {166}{166}{166}{166}{166}            {166}{166}{166}{166}";
40 PRINT "        {166}          {166}{166}{166}{166}{166}           {166}{166}{166}{166}{166}";
50 PRINT "        {166}{166}{166}{166}{166}      {166}{166}{166}{166}{166}{166}         {166}{166}{166}{166}{166}{166}";
60 PRINT "        {166}{166}{166}{166}{166}      {166}{166}{166}{166}{166}{166}         {166}{166}{166}{166}{166}{166}";
70 PRINT "        {166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}       {166}{166}{166}{166}{166}{166}{166}";
80 PRINT "       {166}{166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
90 PRINT "       {166}{166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
100 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}{166}   {166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
110 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}{166}   {166}{166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}{166}{166}";
120 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}{166}   {166}{166}{166}{166}{166}{166}{166}      {166}{166}{166}{166}{166}{166}{166}{166}";
130 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}{166}";
140 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}{166}";
150 PRINT "       {166}{166}{166}{166}{166}{166}{166}{166}     {166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}{166}";
160 PRINT "      {166}{166}{166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}{166}";
170 PRINT "     {166}{166}{166}{166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}    {166}{166}{166}{166}{166}{166}{166}{166}{166}";
180 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
190 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
200 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
210 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}";
220 PRINT "{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}{166}"
230 poke 53285,2: rem multicolor 1
240 poke 53286,7: rem multicolor 2
250 rem poke 53269,255 : rem set all 8 sprites visible
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
500 poke 53256, 30: rem x pos
510 poke 53257, 30: rem y pos
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
680 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,48,0
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
1520 FOR N = 0 TO 753
1530 READ A% : POKE SA+N,A%: NEXT N
1540 SYS SA
1550 END 
1560 DATA 169,17,141,21,208,169,44,141
1570 DATA 0,208,169,120,141,1,208,169
1580 DATA 150,141,8,208,169,165,141,9
1590 DATA 208,169,35,141,167,194,169,35
1600 DATA 141,168,194,141,169,194,169,0
1610 DATA 141,159,194,141,160,194,141,161
1620 DATA 194,141,162,194,141,163,194,141
1630 DATA 164,194,141,165,194,141,166,194
1640 DATA 169,0,141,33,208,169,1,141
1650 DATA 134,2,169,1,141,170,194,169
1660 DATA 2,141,171,194,169,4,141,172
1670 DATA 194,169,8,141,173,194,169,160
1680 DATA 162,0,157,192,7,232,224,40
1690 DATA 208,248,162,0,157,152,7,232
1700 DATA 224,40,208,248,162,0,157,112
1710 DATA 7,232,224,20,208,248,162,0
1720 DATA 157,72,7,232,224,19,208,248
1730 DATA 162,0,157,32,7,232,224,17
1740 DATA 208,248,162,0,157,248,6,232
1750 DATA 224,15,208,248,169,9,162,0
1760 DATA 162,0,157,192,219,232,224,40
1770 DATA 208,248,162,0,157,152,219,232
1780 DATA 224,40,208,248,162,0,157,112
1790 DATA 219,232,224,20,208,248,162,0
1800 DATA 157,72,219,232,224,19,208,248
1810 DATA 162,0,157,32,219,232,224,17
1820 DATA 208,248,162,0,157,248,218,232
1830 DATA 224,15,208,248,162,0,189,223
1840 DATA 194,157,112,7,169,1,157,112
1850 DATA 219,232,224,4,208,240,162,0
1860 DATA 169,160,157,117,7,169,1,157
1870 DATA 117,219,232,236,167,194,208,240
1880 DATA 162,0,189,174,194,157,241,5
1890 DATA 169,1,157,241,217,232,224,18
1900 DATA 208,240,169,16,44,0,220,208
1910 DATA 249,162,0,189,192,194,157,241
1920 DATA 5,169,1,157,241,217,232,224
1930 DATA 18,208,240,169,255,205,18,208
1940 DATA 208,251,169,17,141,21,208,169
1950 DATA 0,141,159,194,169,1,141,160
1960 DATA 194,169,1,44,31,208,240,38
1970 DATA 169,48,141,21,208,173,0,208
1980 DATA 141,10,208,173,1,208,141,11
1990 DATA 208,162,0,189,216,194,157,241
2000 DATA 5,169,1,157,241,217,232,224
2010 DATA 7,208,240,76,149,194,169,1
2020 DATA 44,30,208,240,24,76,120,193
2030 DATA 162,0,189,210,194,157,241,5
2040 DATA 169,1,157,241,217,232,224,6
2050 DATA 208,240,76,149,194,173,170,194
2060 DATA 44,0,220,208,10,169,19,141
2070 DATA 21,208,169,252,141,160,194,173
2080 DATA 171,194,44,0,220,208,5,169
2090 DATA 2,141,160,194,173,172,194,44
2100 DATA 0,220,208,10,169,25,141,21
2110 DATA 208,169,255,141,159,194,173,173
2120 DATA 194,44,0,220,208,10,169,21
2130 DATA 141,21,208,169,1,141,159,194
2140 DATA 24,173,161,194,109,159,194,141
2150 DATA 161,194,44,159,194,48,4,169
2160 DATA 0,16,2,169,255,109,162,194
2170 DATA 141,162,194,24,173,163,194,109
2180 DATA 160,194,141,163,194,44,160,194
2190 DATA 48,4,169,0,16,2,169,255
2200 DATA 109,164,194,141,164,194,24,173
2210 DATA 165,194,109,161,194,141,165,194
2220 DATA 173,0,208,109,162,194,141,0
2230 DATA 208,141,2,208,141,4,208,141
2240 DATA 6,208,24,173,166,194,109,163
2250 DATA 194,141,166,194,173,1,208,109
2260 DATA 164,194,141,1,208,141,3,208
2270 DATA 141,5,208,141,7,208,172,168
2280 DATA 194,136,140,168,194,192,0,208
2290 DATA 27,172,167,194,136,192,0,240
2300 DATA 22,169,160,153,117,7,169,0
2310 DATA 153,117,219,140,167,194,173,169
2320 DATA 194,141,168,194,76,43,193,169
2330 DATA 17,141,21,208,169,0,141,170
2340 DATA 194,169,0,141,171,194,169,0
2350 DATA 141,172,194,169,0,141,173,194
2360 DATA 162,0,189,227,194,157,241,5
2370 DATA 169,1,157,241,217,232,224,15
2380 DATA 208,240,76,43,193,169,16,44
2390 DATA 0,220,208,249,76,0,192,0
2400 DATA 0,0,0,0,0,0,0,0
2410 DATA 0,0,0,0,0,0,16,18
2420 DATA 5,19,19,32,6,9,18,5
2430 DATA 32,20,15,32,12,1,14,4
2440 DATA 32,32,32,32,32,32,32,32
2450 DATA 32,32,32,32,32,32,32,32
2460 DATA 32,32,12,1,14,4,5,4
2470 DATA 3,18,1,19,8,5,4,6
2480 DATA 21,5,12,18,21,14,32,1
2490 DATA 21,20,32,15,6,32,6,21
2500 DATA 5,12