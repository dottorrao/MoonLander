10 print chr$(147):poke53281,15
20 print "generated with spritemate"
30 print "6 of 6 sprites displayed."
40 poke 53285,2: rem multicolor 1
50 poke 53286,7: rem multicolor 2
60 poke 53269,255 : rem set all 8 sprites visible
70 for x=12800 to 12800+383: read y: poke x,y: next x: rem sprite generation
80 :: rem sprite0
90 poke 53287,15: rem color = 15
100 poke 2040,200: rem pointer
110 poke 53248, 44: rem x pos
120 poke 53249, 120: rem y pos
130 :: rem sprite1
140 poke 53288,12: rem color = 12
150 poke 2041,201: rem pointer
160 poke 53250, 92: rem x pos
170 poke 53251, 120: rem y pos
180 :: rem sprite2
190 poke 53289,7: rem color = 7
200 poke 2042,202: rem pointer
210 poke 53252, 140: rem x pos
220 poke 53253, 120: rem y pos
230 :: rem sprite3
240 poke 53290,7: rem color = 7
250 poke 2043,203: rem pointer
260 poke 53254, 188: rem x pos
270 poke 53255, 120: rem y pos
280 :: rem sprite4
290 poke 53291,15: rem color = 15
300 poke 2044,204: rem pointer
310 poke 53256, 200: rem x pos
320 poke 53257, 215: rem y pos
330 :: rem sprite5
340 poke 53292,15: rem color = 15
350 poke 2045,205: rem pointer
360 poke 53258, 92: rem x pos
370 poke 53259, 172: rem y pos
380 poke 53276, 63: rem multicolor
390 poke 53277, 0: rem width
400 poke 53271, 0: rem height
1000 :: rem sprite0 / multicolor / color: 15
1010 data 0,0,0,0,40,0,0,40,0,0,40,0,0,40,0,3
1020 data 190,192,2,255,128,10,170,160,2,190,128,2,190,128,10,190
1030 data 160,10,190,160,2,170,128,2,170,128,0,170,0,0,130,0
1040 data 10,130,160,34,0,136,40,0,40,32,0,8,168,0,42,143
1050 :: rem sprite1 / multicolor / color: 12
1060 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1070 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1080 data 0,0,0,0,0,0,0,0,0,0,0,20,0,0,48,0
1090 data 0,52,0,0,12,0,0,16,0,0,12,0,0,16,0,140
1100 :: rem sprite2 / multicolor / color: 7
1110 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1120 data 0,0,0,0,0,0,0,0,116,0,0,24,0,0,0,0
1130 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1140 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135
1150 :: rem sprite3 / multicolor / color: 7
1160 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1170 data 0,0,0,0,0,0,0,0,0,0,29,0,0,60,0,0
1180 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1190 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,135
1200 :: rem sprite4 / multicolor / color: 15
1210 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1220 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1230 data 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
1240 data 84,0,21,252,0,63,169,85,106,171,255,234,170,170,170,143
1250 :: rem sprite5 / multicolor / color: 15
1260 data 240,0,240,60,16,192,23,231,60,7,100,51,7,21,255,7
1270 data 182,192,13,245,208,13,229,144,19,181,176,23,158,80,5,94
1280 data 160,37,118,164,1,89,20,53,217,4,12,249,64,12,242,64
1290 data 5,241,84,34,53,68,60,48,40,44,0,8,168,0,42,143
1500 REM GENERATED ML LOADER
1510 SA = 49152
1520 FOR N = 0 TO 402
1530 READ A% : POKE SA+N,A%: NEXT N
1540 SYS SA
1550 END 
1560 DATA 169,0,141,139,193,141,140,193
1570 DATA 141,141,193,141,142,193,141,143
1580 DATA 193,141,144,193,141,145,193,141
1590 DATA 146,193,169,160,162,0,157,192
1600 DATA 7,232,224,40,208,248,162,0
1610 DATA 157,152,7,232,224,40,208,248
1620 DATA 162,0,157,112,7,232,224,20
1630 DATA 208,248,162,0,157,72,7,232
1640 DATA 224,19,208,248,162,0,157,32
1650 DATA 7,232,224,17,208,248,162,0
1660 DATA 157,248,6,232,224,15,208,248
1670 DATA 169,9,162,0,162,0,157,192
1680 DATA 219,232,224,40,208,248,162,0
1690 DATA 157,152,219,232,224,40,208,248
1700 DATA 162,0,157,112,219,232,224,20
1710 DATA 208,248,162,0,157,72,219,232
1720 DATA 224,19,208,248,162,0,157,32
1730 DATA 219,232,224,17,208,248,162,0
1740 DATA 157,248,218,232,224,15,208,248
1750 DATA 169,255,205,18,208,208,251,169
1760 DATA 17,141,21,208,169,0,141,139
1770 DATA 193,169,1,141,140,193,169,1
1780 DATA 44,31,208,240,20,169,48,141
1790 DATA 21,208,173,0,208,141,10,208
1800 DATA 173,1,208,141,11,208,76,138
1810 DATA 193,169,16,44,30,208,240,3
1820 DATA 238,33,208,169,1,44,0,220
1830 DATA 208,10,169,19,141,21,208,169
1840 DATA 252,141,140,193,169,2,44,0
1850 DATA 220,208,5,169,2,141,140,193
1860 DATA 169,4,44,0,220,208,10,169
1870 DATA 25,141,21,208,169,255,141,139
1880 DATA 193,169,8,44,0,220,208,10
1890 DATA 169,21,141,21,208,169,1,141
1900 DATA 139,193,24,173,141,193,109,139
1910 DATA 193,141,141,193,44,139,193,48
1920 DATA 4,169,0,16,2,169,255,109
1930 DATA 142,193,141,142,193,24,173,143
1940 DATA 193,109,140,193,141,143,193,44
1950 DATA 140,193,48,4,169,0,16,2
1960 DATA 169,255,109,144,193,141,144,193
1970 DATA 24,173,145,193,109,141,193,141
1980 DATA 145,193,173,0,208,109,142,193
1990 DATA 141,0,208,141,2,208,141,4
2000 DATA 208,141,6,208,24,173,146,193
2010 DATA 109,143,193,141,146,193,173,1
2020 DATA 208,109,144,193,141,1,208,141
2030 DATA 3,208,141,5,208,141,7,208
2040 DATA 169,16,44,0,220,240,3,76
2050 DATA 152,192,96,0,0,0,0,0
2060 DATA 0,0,0