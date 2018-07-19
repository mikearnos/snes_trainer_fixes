;xkas v0.06
lorom

org $FFF0
	JMP.l intro

org $FFFC					;reset vector
	dw $FFF0

org $FFD6
	db $02					;ROM+RAM+SRAM
	
org $FFD8
	db $01					;2KB SRAM

org $FFDC
	db $5B, $64, $A4, $9B	;good checksum ;)

org $3FFFFF					;pad to 16 mbit
	db $00


org $C860
	JSR $FFA0

org $FFA0
	LDA $4218,x
	JSL intro+2
	RTS


org $308000
intro:
	incbin intro.bin


org $3080FD					;original trainer just sets life to $30 repeatedly
	JSL life_meter

org $30FFFD					;this was just at the end of the file
	db $80, $00, $00

life_meter:
	LDA $7E00A0				;load max life value
	STA $7E009F				;save as current life value
	RTL
