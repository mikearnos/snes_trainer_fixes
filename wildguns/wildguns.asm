;xkas v0.06
lorom

;=======================
;internal header updates
;=======================
org $FFF0
	JMP.l intro
org $FFFC					;reset vector
	db $F0, $FF
org $FFD6
	db $02					;ROM+RAM+SRAM
org $FFD7
	db $0B					;12 mbit
org $FFD8
	db $01					;2KB SRAM
org $FFDC
	db $8D, $25, $72, $DA	;good checksum ;)

org $AFFFFF					;pad to 12 mbit
	db $00


;========================
;pass SRAM (piracy) check
;========================
org $82CF
	JMP $82E6


;==================
;options run ingame
;==================
org $B9DC					;hook: press X, dynamite $79:10F2
	NOP
	NOP
	JSL $208767

org $48822					;hook: death; infinite lives $70:10F0
	JSL $208758

org $48838					;hook: death; keep special guns $70:10F4
	JSL $20877B

org $494D5					;hook: infinite ammo $70:10F6
	NOP
	NOP
	NOP
	JSL $208786


;==========================
;original intro by elitendo
;==========================
org $208000
intro:
	incbin elitendo_intro.bin
