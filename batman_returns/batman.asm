;xkas v0.06
lorom

;=======================
;internal header updates
;=======================
org $FFF0
	JMP.l intro
org $FFFC					;reset vector
	db $F0, $FF
org $FFDC
	db $81, $4D, $7E, $B2	;good checksum ;)


org $80872B
	JSL $0FFC5A


org $8087FD
	JSL $0FFCF3


org $808A16
	NOP
	NOP


org $80AFA6
	NOP
	JSL $0FFD70


org $80BFD4					;death?
	NOP
	JSL $0FFC00
	LDA $8C
	BEQ +
	RTL
+	LDA #$0002


org $80C63F
	JSL $0FFC2D


org $80C97E					;death?
	NOP
	JSL $0FFC00
	LDA $8C
	BEQ +
	RTL
+	LDA #$0002


org $80D1C1
	JSL $0FFC37				;bat tube?


org $80EA09
	NOP
	NOP
	JSL $0FFC1B


org $84E7B3
	JSL $0FFC11


org $84E810
	NOP
	NOP
	NOP
	NOP
	JSL $0FFC41


org $87F91E					;continue?
	NOP
	JSL $0FFC4F


org $9FF29F
	PHX
	JSL $0FFD2E


;==========================
;original intro by elitendo
;==========================
org $0FF000
intro:
	incbin intro.bin
