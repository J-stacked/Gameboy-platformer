;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module StateGame
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Update_StateGame
	.globl _Start_StateGame
	.globl _SpriteManagerAdd
	.globl _InitScroll
	.globl ___bank_StateGame
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_255
;StateGame.c:9: void START() {
;	---------------------------------
; Function Start_StateGame
; ---------------------------------
_Start_StateGame::
;StateGame.c:10: scroll_target = SpriteManagerAdd(SpritePlayer, 50, 50);
	ld	de, #0x0032
	push	de
	xor	a, a
	call	_SpriteManagerAdd
	ld	hl, #_scroll_target
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;StateGame.c:11: InitScroll(BANK(map), &map, 0, 0);
	ld	c, #<(___bank_map)
	ld	de, #0x0000
	push	de
	push	de
	ld	de, #_map
	ld	a, c
	call	_InitScroll
;StateGame.c:12: }
	ret
___bank_StateGame	=	0x00ff
;StateGame.c:14: void UPDATE() {
;	---------------------------------
; Function Update_StateGame
; ---------------------------------
_Update_StateGame::
;StateGame.c:15: }
	ret
	.area _CODE_255
	.area _INITIALIZER
	.area _CABS (ABS)
