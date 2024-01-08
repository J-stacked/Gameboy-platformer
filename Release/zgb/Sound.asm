;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module Sound
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _hUGE_mute_channel
	.globl _FX_ADDRESS
	.globl _FX_REG_SIZES
	.globl _PlayFx
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
;C:/gbdk/ZGB/common/src/Sound.c:13: void PlayFx(SOUND_CHANNEL channel, UINT8 mute_frames, ...) {
;	---------------------------------
; Function PlayFx
; ---------------------------------
_PlayFx::
	add	sp, #-6
;C:/gbdk/ZGB/common/src/Sound.c:15: REG_PTR reg = (REG_PTR)FX_ADDRESS[channel];
	ld	bc, #_FX_ADDRESS+0
	ldhl	sp,	#8
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/gbdk/ZGB/common/src/Sound.c:18: if(channel != CHANNEL_5) {
	ldhl	sp,	#8
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00104$
;C:/gbdk/ZGB/common/src/Sound.c:19: MUTE_CHANNEL(channel);
	ld	hl, #_last_music + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00104$
	push	bc
	ld	e, #0x01
	ldhl	sp,	#10
	ld	a, (hl)
	call	_hUGE_mute_channel
	pop	bc
00104$:
;C:/gbdk/ZGB/common/src/Sound.c:21: music_mute_frames = mute_frames;
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(#_music_mute_frames),a
;C:/gbdk/ZGB/common/src/Sound.c:23: va_start(list, mute_frames);
	ldhl	sp,#10
	ld	e, l
	ld	d, h
	inc	sp
	inc	sp
	push	de
;C:/gbdk/ZGB/common/src/Sound.c:24: for(i = 0; i < FX_REG_SIZES[channel]; ++i, ++reg) {
	ld	de, #_FX_REG_SIZES
	ldhl	sp,	#8
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl+), a
	inc	hl
	ld	(hl), #0x00
00107$:
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl+), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00109$
;C:/gbdk/ZGB/common/src/Sound.c:25: *reg = va_arg(list, INT16);
;C:/gbdk/ZGB/common/src/Sound.c:24: for(i = 0; i < FX_REG_SIZES[channel]; ++i, ++reg) {
	inc	hl
	pop	de
	push	de
	inc	de
	inc	de
	inc	sp
	inc	sp
	push	de
	dec	de
	dec	de
	ld	a, (de)
	ld	(bc), a
	inc	(hl)
	inc	bc
	jr	00107$
00109$:
;C:/gbdk/ZGB/common/src/Sound.c:28: }
	add	sp, #6
	ret
_FX_REG_SIZES:
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x05	; 5
	.db #0x04	; 4
	.db #0x03	; 3
_FX_ADDRESS:
	.dw #0xff10
	.dw #0xff16
	.dw #0xff1a
	.dw #0xff20
	.dw #0xff24
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
