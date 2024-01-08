;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module tiles_gbr
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _tiles
	.globl ___bank_tiles
	.globl _tiles_tiles
	.globl _tilesCGB
	.globl _tiles_palettes
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
	.area _CODE_255
_tiles_palettes:
	.dw #0x17bc
	.dw #0x22e7
	.dw #0x19c4
	.dw #0x14e0
_tilesCGB:
	.db #0x00	; 0
	.db #0x00	; 0
_tiles_tiles:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0xcf	; 207
	.db #0x20	; 32
	.db #0xc3	; 195
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xfb	; 251
	.db #0x04	; 4
	.db #0xf9	; 249
	.db #0x04	; 4
	.db #0x78	; 120	'x'
	.db #0x04	; 4
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xdf	; 223
	.db #0x20	; 32
___bank_tiles	=	0x00ff
_tiles:
	.db #0x02	; 2
	.dw _tiles_tiles
	.db #0x01	; 1
	.dw _tiles_palettes
	.dw _tilesCGB
	.area _INITIALIZER
	.area _CABS (ABS)
