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
	db $22, $B0, $DD, $4F	;good checksum ;)

org $AFFFFF					;pad to 12 mbit
	db $00


;====================
;options run pre-game
;====================
org $80811A					;hook
	NOP
	JSL slowrom_fix

org $80866E					;hook
	NOP
	NOP
	JSL level_select


;===============================
;original disabled ingame cheats
;add L button to enable
;===============================
org $808BFB					;enable built in cheats
	dw $00FF

org $808B2A
	NOP						;allow easier inputs
	NOP

org $808B37
	CMP #$0020|#$0080		;L + A - invincibility
org $808B3F
	CMP #$0020|#$0080		;L + A
org $808B50
	CMP #$0020|#$8000		;L + B - infinite health
org $808B58
	CMP #$0020|#$8000		;L + B
org $808B69
	CMP #$0020|#$0040		;L + X - infinite ammo
org $808B71
	CMP #$0020|#$0040		;L + X
org $808B82
	CMP #$0020|#$4000		;L + Y - unused?
org $808B8A
	CMP #$0020|#$4000		;L + Y


;==========================
;original intro by elitendo
;==========================
org $208000
intro:
	incbin elitendo_intro.bin


;=========================
;intro options storage
;change $70800x to $70000x
;=========================
org $20800D
	STA $700000				;initial slowrom fix value

org $208019
	STA $700001				;initial level value

org $208457
slowrom_fix:
	LDA $700000

org $208463
level_select:
	LDA $700001
	CMP #$FFFF
	BEQ +
	AND #$0007
	DEC A
	STA $0F28				;new address
	LDA #$FFFF
	STA $700001
+	LDA $0F28				;new address
	STA $0F90				;new address
	RTL

org $2081DC
	STA $700000,x			;change slowrom fix value


;==================
;intro menu changes
;==================
!up = $20					;move up one line

org $2081C9					;adjust "NO" vertical position
	LDA #$4E
	STA.w $10DB-!up,x
	LDA #$4F
	STA.w $10DC-!up,x
	LDA #$20
	STA.w $10DD-!up,x

org $208214					;adjust "YES" position
	LDA #$59
	STA.w $10DB-!up,x
	LDA #$45
	STA.w $10DC-!up,x
	LDA #$53
	STA.w $10DD-!up,x

org $208243					;adjust cursor position
	STA.w $10C3-!up
	STA.w $10E3-!up
	LDA #$3E
	STA.w $10C3-!up,x

org $208287					;adjust level number position
	LDA #$30
	STA.w $10FB-!up
	LDA $14
	CMP #$0A
	BCS $07
	CLC
	ADC #$30
	STA.w $10FC-!up

org $208720
	db "           PRESENTS YOU         "
	db "                                "
	db "              ALIEN 3           "
	db "                                "
	db "                                "
	db "     SLOWROM FIX        -  NO   "		;\
	db "     START LEVEL        -  01   "		; | moved these up a line
	db "                                "		; |
	db " ACTIVATE CHEATMODES BY PRESSING"		;/
	db "                                "
	db "    L + A FOR INVINCIBILITY     "		;added this line
	db "    L + B FOR UNLIMTED ENERGY   "
	db "    L + X FOR UNLIMTED WEAPONS  "
