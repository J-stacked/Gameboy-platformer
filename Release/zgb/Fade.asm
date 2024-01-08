;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module Fade
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl b_FadeOut_b
	.globl _FadeOut_b
	.globl b_FadeIn_b
	.globl _FadeIn_b
	.globl _FadeIn
	.globl _FadeOut
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
	.area _CODE
;C:/gbdk/ZGB/common/src/Fade.c:7: void FadeIn() {
;	---------------------------------
; Function FadeIn
; ---------------------------------
_FadeIn::
;C:/gbdk/ZGB/common/src/Fade.c:8: FadeIn_b();
	ld	e, #b_FadeIn_b
	ld	hl, #_FadeIn_b
;C:/gbdk/ZGB/common/src/Fade.c:9: }
	jp  ___sdcc_bcall_ehl
;C:/gbdk/ZGB/common/src/Fade.c:11: void FadeOut() {
;	---------------------------------
; Function FadeOut
; ---------------------------------
_FadeOut::
;C:/gbdk/ZGB/common/src/Fade.c:12: FadeOut_b();
	ld	e, #b_FadeOut_b
	ld	hl, #_FadeOut_b
;C:/gbdk/ZGB/common/src/Fade.c:13: }
	jp  ___sdcc_bcall_ehl
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
