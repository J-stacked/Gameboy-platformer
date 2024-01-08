;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module player_gbr
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _player
	.globl _player_metasprites
	.globl _player_metasprite0
	.globl _player_tiles
	.globl _player_palettes
	.globl b___func_player
	.globl ___func_player
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
;../Release/res/sprites/player.gbr.c:9: BANKREF(player)
;	---------------------------------
; Function __func_player
; ---------------------------------
	b___func_player	= 255
___func_player::
	.local b___func_player 
	___bank_player = b___func_player 
	.globl ___bank_player 
	.area _CODE_255
_player_palettes:
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
_player_tiles:
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x2f	; 47
	.db #0x30	; 48	'0'
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x2e	; 46
	.db #0x3f	; 63
	.db #0x24	; 36
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x26	; 38
	.db #0x3f	; 63
	.db #0x20	; 32
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x1f	; 31
	.db #0xf8	; 248
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0xf4	; 244
	.db #0x0c	; 12
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0x14	; 20
	.db #0xfc	; 252
	.db #0x44	; 68	'D'
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xc4	; 196
	.db #0xfc	; 252
	.db #0x04	; 4
	.db #0xfc	; 252
	.db #0xf8	; 248
	.db #0xf8	; 248
_player_metasprite0:
	.db #0x00	;  0
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	;  0
	.db #0x08	;  8
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x80	; -128
	.db #0x00	;  0
	.db #0x00	; 0
	.db #0x00	; 0
_player_metasprites:
	.dw _player_metasprite0
_player:
	.db #0x10	; 16
	.db #0x10	; 16
	.db #0x04	; 4
	.dw _player_tiles
	.db #0x01	; 1
	.dw _player_palettes
	.db #0x01	; 1
	.dw _player_metasprites
	.area _INITIALIZER
	.area _CABS (ABS)
