; Michaelangel007
; https://github.com/Michaelangel007/apple2_gr_load_save
; Packs non-linear GR screen to linear buffer and back
;
; Packs the GR screen from $400..$7F7 to be linear at HGR $2000..$23BF
; Unpacks the GR screen from HGR $2000..$23BF to GR $400..$7F7
; Skips all TEXT screen holes
;
;Row Text Address | Screen Hole 
; 0  $400    $427 | n/a 
; 1  $480    $4A7 | n/a 
; 2  $500    $527 | n/a 
; 3  $580    $5A7 | n/a 
; 4  $600    $627 | n/a 
; 5  $600    $6A7 | n/a 
; 6  $700    $727 | n/a 
; 7  $780    $7A7 | n/a 
; 8  $428    $44F | n/a 
; 9  $4A8    $4CF | n/a 
;10  $528    $54F | n/a 
;11  $5A8    $5CF | n/a 
;12  $628    $64F | n/a 
;13  $6A8    $6CF | n/a 
;14  $728    $74F | n/a 
;15  $7A8    $7CF | n/a 
;16  $450    $477 | $478 .. $47F 
;17  $4D0    $4F7 | $4F8 .. $4FF 
;18  $550    $577 | $578 .. $57F 
;19  $5D0    $5F7 | $5F8 .. $5FF 
;20  $650    $677 | $678 .. $67F 
;21  $6D0    $6F7 | $6F8 .. $6FF 
;22  $750    $777 | $778 .. $77F 
;23  $7D0    $7F7 | $7F8 .. $7FF 


WIDTH   = $78
BUFFER  = $2000

        ORG $300

; GR
; CALL  768:REM $300
; BSAVE DEMO.GR,$2000,L$1E0
SaveGR
        LDX #$77
MoveUp
        LDA $0400,X
        STA WIDTH*0 + BUFFER,X
        LDA $0480,X
        STA WIDTH*1 + BUFFER,X

        LDA $0500,X
        STA WIDTH*2 + BUFFER,X
        LDA $0580,X
        STA WIDTH*3 + BUFFER,X

        LDA $0600,X
        STA WIDTH*4 + BUFFER,X
        LDA $0680,X
        STA WIDTH*5 + BUFFER,X

        LDA $0700,X
        STA WIDTH*6 + BUFFER,X
        LDA $0780,X
        STA WIDTH*7 + BUFFER,X

        DEX
        BPL MoveUp
        RTS       

; GR
; BLOAD DEMO.GR
; CALL 822:REM $336

LoadGR
        LDX #$77
MoveDown
        LDA WIDTH*0 + BUFFER,X
        STA $0400,X
        LDA WIDTH*1 + BUFFER,X
        STA $0480,X

        LDA WIDTH*2 + BUFFER,X
        STA $0500,X
        LDA WIDTH*3 + BUFFER,X
        STA $0580,X

        LDA WIDTH*4 + BUFFER,X
        STA $0600,X
        LDA WIDTH*5 + BUFFER,X
        STA $0680,X

        LDA WIDTH*6 + BUFFER,X
        STA $0700,X
        LDA WIDTH*7 + BUFFER,X
        STA $0780,X

        DEX
        BPL MoveDown
        RTS       

