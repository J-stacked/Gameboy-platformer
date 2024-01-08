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
	.globl _collision_tiles
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
G$collision_tiles$0_0$0==.
_collision_tiles::
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
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE_255
	G$Start_StateGame$0$0	= .
	.globl	G$Start_StateGame$0$0
	C$StateGame.c$11$0_0$177	= .
	.globl	C$StateGame.c$11$0_0$177
;StateGame.c:11: void START() {
;	---------------------------------
; Function Start_StateGame
; ---------------------------------
_Start_StateGame::
	C$StateGame.c$12$1_0$177	= .
	.globl	C$StateGame.c$12$1_0$177
;StateGame.c:12: scroll_target = SpriteManagerAdd(SpritePlayer, 50, 50);
	ld	de, #0x0032
	push	de
	xor	a, a
	call	_SpriteManagerAdd
	ld	hl, #_scroll_target
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	C$StateGame.c$13$1_0$177	= .
	.globl	C$StateGame.c$13$1_0$177
;StateGame.c:13: InitScroll(BANK(map), &map, collision_tiles, 0);
	ld	c, #<(___bank_map)
	ld	de, #0x0000
	push	de
	ld	de, #_collision_tiles
	push	de
	ld	de, #_map
	ld	a, c
	call	_InitScroll
	C$StateGame.c$14$1_0$177	= .
	.globl	C$StateGame.c$14$1_0$177
;StateGame.c:14: }
	C$StateGame.c$14$1_0$177	= .
	.globl	C$StateGame.c$14$1_0$177
	XG$Start_StateGame$0$0	= .
	.globl	XG$Start_StateGame$0$0
	ret
G$__bank_StateGame$0_0$0 == 0x00ff
___bank_StateGame	=	0x00ff
	G$Update_StateGame$0$0	= .
	.globl	G$Update_StateGame$0$0
	C$StateGame.c$16$1_0$179	= .
	.globl	C$StateGame.c$16$1_0$179
;StateGame.c:16: void UPDATE() {
;	---------------------------------
; Function Update_StateGame
; ---------------------------------
_Update_StateGame::
	C$StateGame.c$18$1_0$179	= .
	.globl	C$StateGame.c$18$1_0$179
;StateGame.c:18: }
	C$StateGame.c$18$1_0$179	= .
	.globl	C$StateGame.c$18$1_0$179
	XG$Update_StateGame$0$0	= .
	.globl	XG$Update_StateGame$0$0
	ret
	.area _CODE_255
	.area _INITIALIZER
FStateGame$__xinit_collision_tiles$0_0$0 == .
__xinit__collision_tiles:
	.db #0x01	; 1
	.db #0x00	; 0
	.area _CABS (ABS)
