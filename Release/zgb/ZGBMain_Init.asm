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
_stateBanks::
	.ds 1
_startFuncs::
	.ds 2
_updateFuncs::
	.ds 2
_spriteBanks::
	.ds 1
_spriteDataBanks::
	.ds 1
_spriteStartFuncs::
	.ds 2
_spriteUpdateFuncs::
	.ds 2
_spriteDestroyFuncs::
	.ds 2
_spriteDatas::
	.ds 2
_spriteIdxs::
	.ds 1
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
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:16: void InitStates() {
;	---------------------------------
; Function InitStates
; ---------------------------------
_InitStates::
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
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:18: }
	ret
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:49: void InitSprites() {
;	---------------------------------
; Function InitSprites
; ---------------------------------
_InitSprites::
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
;C:/gbdk/ZGB/common/src/ZGBMain_Init.c:51: }
	ret
	.area _CODE_1
	.area _INITIALIZER
	.area _CABS (ABS)
