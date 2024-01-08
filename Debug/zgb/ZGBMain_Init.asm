;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module ZGBMain_Init
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _InitSprites
	.globl _Destroy_SpritePlayer
	.globl _Update_SpritePlayer
	.globl _Start_SpritePlayer
	.globl _InitStates
	.globl _Update_StateGame
	.globl _Start_StateGame
	.globl _spritePalsOffset
	.globl _spriteIdxs
	.globl _spriteDatas
	.globl _spriteDestroyFuncs
	.globl _spriteUpdateFuncs
	.globl _spriteStartFuncs
	.globl _spriteDataBanks
	.globl _spriteBanks
	.globl _updateFuncs
	.globl _startFuncs
	.globl _stateBanks
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$stateBanks$0_0$0==.
_stateBanks::
	.ds 1
G$startFuncs$0_0$0==.
_startFuncs::
	.ds 2
G$updateFuncs$0_0$0==.
_updateFuncs::
	.ds 2
G$spriteBanks$0_0$0==.
_spriteBanks::
	.ds 1
G$spriteDataBanks$0_0$0==.
_spriteDataBanks::
	.ds 1
G$spriteStartFuncs$0_0$0==.
_spriteStartFuncs::
	.ds 2
G$spriteUpdateFuncs$0_0$0==.
_spriteUpdateFuncs::
	.ds 2
G$spriteDestroyFuncs$0_0$0==.
_spriteDestroyFuncs::
	.ds 2
G$spriteDatas$0_0$0==.
_spriteDatas::
	.ds 2
G$spriteIdxs$0_0$0==.
_spriteIdxs::
	.ds 1
G$spritePalsOffset$0_0$0==.
_spritePalsOffset::
	.ds 1
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
	.area _CODE_1
	G$InitStates$0$0	= .
	.globl	G$InitStates$0$0
	C$ZGBMain_Init.c$16$0_0$158	= .
	.globl	C$ZGBMain_Init.c$16$0_0$158
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:16: void InitStates() {
;	---------------------------------
; Function InitStates
; ---------------------------------
_InitStates::
	C$ZGBMain_Init.c$17$1_0$158	= .
	.globl	C$ZGBMain_Init.c$17$1_0$158
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:17: STATES
	ld	hl, #_startFuncs
	ld	(hl), #<(_Start_StateGame)
	inc	hl
	ld	(hl), #>(_Start_StateGame)
	ld	hl, #_updateFuncs
	ld	(hl), #<(_Update_StateGame)
	inc	hl
	ld	(hl), #>(_Update_StateGame)
	ld	bc, #_stateBanks+0
	ld	a, #<(___bank_StateGame)
	ld	(bc), a
	C$ZGBMain_Init.c$18$1_0$158	= .
	.globl	C$ZGBMain_Init.c$18$1_0$158
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:18: }
	C$ZGBMain_Init.c$18$1_0$158	= .
	.globl	C$ZGBMain_Init.c$18$1_0$158
	XG$InitStates$0$0	= .
	.globl	XG$InitStates$0$0
	ret
	G$InitSprites$0$0	= .
	.globl	G$InitSprites$0$0
	C$ZGBMain_Init.c$49$1_0$159	= .
	.globl	C$ZGBMain_Init.c$49$1_0$159
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:49: void InitSprites() {
;	---------------------------------
; Function InitSprites
; ---------------------------------
_InitSprites::
	C$ZGBMain_Init.c$50$1_0$159	= .
	.globl	C$ZGBMain_Init.c$50$1_0$159
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:50: SPRITES
	ld	bc, #_spriteBanks+0
	ld	a, #<(___bank_SpritePlayer)
	ld	(bc), a
	ld	hl, #_spriteStartFuncs
	ld	(hl), #<(_Start_SpritePlayer)
	inc	hl
	ld	(hl), #>(_Start_SpritePlayer)
	ld	hl, #_spriteUpdateFuncs
	ld	(hl), #<(_Update_SpritePlayer)
	inc	hl
	ld	(hl), #>(_Update_SpritePlayer)
	ld	hl, #_spriteDestroyFuncs
	ld	(hl), #<(_Destroy_SpritePlayer)
	inc	hl
	ld	(hl), #>(_Destroy_SpritePlayer)
	ld	bc, #_spriteDataBanks+0
	ld	a, #<(___bank_player)
	ld	(bc), a
	ld	hl, #_spriteDatas
	ld	(hl), #<(_player)
	inc	hl
	ld	(hl), #>(_player)
	C$ZGBMain_Init.c$51$1_0$159	= .
	.globl	C$ZGBMain_Init.c$51$1_0$159
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:51: }
	C$ZGBMain_Init.c$51$1_0$159	= .
	.globl	C$ZGBMain_Init.c$51$1_0$159
	XG$InitSprites$0$0	= .
	.globl	XG$InitSprites$0$0
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
