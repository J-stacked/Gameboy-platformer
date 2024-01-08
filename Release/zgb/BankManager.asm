;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module BankManager
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _empty
	.globl _bank_stack
	.globl _bank_stackSTACK
	.globl _PushBank
	.globl _PopBank
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_bank_stackSTACK::
	.ds 10
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_bank_stack::
	.ds 2
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
;C:/gbdk/ZGB/common/src/BankManager.c:5: void empty(void) __nonbanked {}
;	---------------------------------
; Function empty
; ---------------------------------
_empty::
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/BankManager.c:7: void PushBank(UINT8 b) OLDCALL{
;	---------------------------------
; Function PushBank
; ---------------------------------
_PushBank::
;C:/gbdk/ZGB/common/src/BankManager.c:25: __endasm;
	ld	hl, #_bank_stack
	inc	(hl)
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (#__current_bank)
	ld	(bc), a
	ldhl	sp, #2
	ld	a, (hl)
	ld	(#__current_bank), a
	ld	(#0x2000), a
;C:/gbdk/ZGB/common/src/BankManager.c:26: }
	ret
;C:/gbdk/ZGB/common/src/BankManager.c:28: void PopBank() OLDCALL{
;	---------------------------------
; Function PopBank
; ---------------------------------
_PopBank::
;C:/gbdk/ZGB/common/src/BankManager.c:42: __endasm;
	ld	hl, #_bank_stack
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
	ld	a, (bc)
	ld	(#__current_bank), a
	ld	(#0x2000), a
	dec	hl
	dec	(hl)
;C:/gbdk/ZGB/common/src/BankManager.c:43: }
	ret
	.area _CODE
	.area _INITIALIZER
__xinit__bank_stack:
	.dw (_bank_stackSTACK - 1)
	.area _CABS (ABS)
