# GR load/save

The low resolution graphics screen shares the same memory as the text screen.
There are "text holes" that are NOT displayed and thus used by DOS3.3 / ProDOS.

To `save` the GR screen to HGR memory: `CALL 769`
To `load` the GR screen from HGR memory: `CALL 822`

```
5 D$=CHR$(4)
10 PRINT D$;"BLOAD GR_LOAD_SAVE.BIN"
20 GR
30 REM PLOT SOME STUFF
40 COLOR=2:HLIN 0,39 AT 20
50 COLOR=3:VLIN 0,39 AT 20
60 COLOR=1:FOR I=0 TO 23:PLOT I,I:NEXT
70 CALL 768: REM MOVE GR TO HGR
80 ? D$;"BSAVE DEMO.GR,A$2000,L$3C0"
90 GR
100 CALL 822: REM MOVE HGR TO GR
```

See the [gr_demo.dsk](gr_demo.dsk)

# License

[WTFPL](http://www.wtfpl.net/)

