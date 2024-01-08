;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module SpritePlayer
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _Destroy_SpritePlayer
	.globl _Update_SpritePlayer
	.globl _Start_SpritePlayer
	.globl _TranslateSprite
	.globl _SetSpriteAnim
	.globl _airborne
	.globl _y_vel
	.globl _x_vel
	.globl _min_y_vel
	.globl _min_x_vel
	.globl _max_y_vel
	.globl _max_x_vel
	.globl _anim_walk
	.globl _anim_idle
	.globl ___bank_SpritePlayer
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
G$x_vel$0_0$0==.
_x_vel::
	.ds 1
G$y_vel$0_0$0==.
_y_vel::
	.ds 1
G$airborne$0_0$0==.
_airborne::
	.ds 1
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
	G$Start_SpritePlayer$0$0	= .
	.globl	G$Start_SpritePlayer$0$0
	C$SpritePlayer.c$18$0_0$162	= .
	.globl	C$SpritePlayer.c$18$0_0$162
;SpritePlayer.c:18: void START() {
;	---------------------------------
; Function Start_SpritePlayer
; ---------------------------------
_Start_SpritePlayer::
	C$SpritePlayer.c$20$0_0$162	= .
	.globl	C$SpritePlayer.c$20$0_0$162
;SpritePlayer.c:20: }
	C$SpritePlayer.c$20$0_0$162	= .
	.globl	C$SpritePlayer.c$20$0_0$162
	XG$Start_SpritePlayer$0$0	= .
	.globl	XG$Start_SpritePlayer$0$0
	ret
G$__bank_SpritePlayer$0_0$0 == 0x00ff
___bank_SpritePlayer	=	0x00ff
G$anim_idle$0_0$0 == .
_anim_idle:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x01	; 1
G$anim_walk$0_0$0 == .
_anim_walk:
	.db #0x02	; 2
	.db #0x00	; 0
	.db #0x02	; 2
G$max_x_vel$0_0$0 == .
_max_x_vel:
	.db #0x0a	;  10
G$max_y_vel$0_0$0 == .
_max_y_vel:
	.db #0x0a	;  10
G$min_x_vel$0_0$0 == .
_min_x_vel:
	.db #0xf6	; -10
G$min_y_vel$0_0$0 == .
_min_y_vel:
	.db #0xf6	; -10
	G$Update_SpritePlayer$0$0	= .
	.globl	G$Update_SpritePlayer$0$0
	C$SpritePlayer.c$22$0_0$163	= .
	.globl	C$SpritePlayer.c$22$0_0$163
;SpritePlayer.c:22: void UPDATE() {
;	---------------------------------
; Function Update_SpritePlayer
; ---------------------------------
_Update_SpritePlayer::
	dec	sp
	dec	sp
	C$SpritePlayer.c$23$1_0$163	= .
	.globl	C$SpritePlayer.c$23$1_0$163
;SpritePlayer.c:23: if (KEY_PRESSED(J_UP)) {
	ld	a, (#_keys)
	bit	2, a
	jr	Z, 00102$
	C$SpritePlayer.c$24$2_0$164	= .
	.globl	C$SpritePlayer.c$24$2_0$164
;SpritePlayer.c:24: y_vel -= 1;
	ld	hl, #_y_vel
	dec	(hl)
	C$SpritePlayer.c$25$2_0$164	= .
	.globl	C$SpritePlayer.c$25$2_0$164
;SpritePlayer.c:25: SetSpriteAnim(THIS, anim_walk, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	bc, #_anim_walk
	ld	hl, #_THIS
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_SetSpriteAnim
00102$:
	C$SpritePlayer.c$27$1_0$163	= .
	.globl	C$SpritePlayer.c$27$1_0$163
;SpritePlayer.c:27: if (KEY_PRESSED(J_DOWN)) {
	ld	a, (#_keys)
	bit	3, a
	jr	Z, 00104$
	C$SpritePlayer.c$28$2_0$165	= .
	.globl	C$SpritePlayer.c$28$2_0$165
;SpritePlayer.c:28: y_vel += 1;
	ld	hl, #_y_vel
	inc	(hl)
	C$SpritePlayer.c$29$2_0$165	= .
	.globl	C$SpritePlayer.c$29$2_0$165
;SpritePlayer.c:29: SetSpriteAnim(THIS, anim_walk, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	bc, #_anim_walk
	ld	hl, #_THIS
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_SetSpriteAnim
00104$:
	C$SpritePlayer.c$31$1_0$163	= .
	.globl	C$SpritePlayer.c$31$1_0$163
;SpritePlayer.c:31: if (KEY_PRESSED(J_LEFT)) {
	ld	a, (#_keys)
	bit	1, a
	jr	Z, 00106$
	C$SpritePlayer.c$32$2_0$166	= .
	.globl	C$SpritePlayer.c$32$2_0$166
;SpritePlayer.c:32: x_vel -= 1;
	ld	hl, #_x_vel
	dec	(hl)
	C$SpritePlayer.c$33$2_0$166	= .
	.globl	C$SpritePlayer.c$33$2_0$166
;SpritePlayer.c:33: SetSpriteAnim(THIS, anim_walk, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	bc, #_anim_walk
	ld	hl, #_THIS
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_SetSpriteAnim
00106$:
	C$SpritePlayer.c$35$1_0$163	= .
	.globl	C$SpritePlayer.c$35$1_0$163
;SpritePlayer.c:35: if (KEY_PRESSED(J_RIGHT)) {
	ld	a, (#_keys)
	rrca
	jr	NC, 00108$
	C$SpritePlayer.c$36$2_0$167	= .
	.globl	C$SpritePlayer.c$36$2_0$167
;SpritePlayer.c:36: x_vel += 1;
	ld	hl, #_x_vel
	inc	(hl)
	C$SpritePlayer.c$37$2_0$167	= .
	.globl	C$SpritePlayer.c$37$2_0$167
;SpritePlayer.c:37: SetSpriteAnim(THIS, anim_walk, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	bc, #_anim_walk
	ld	hl, #_THIS
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_SetSpriteAnim
00108$:
	C$SpritePlayer.c$39$1_0$163	= .
	.globl	C$SpritePlayer.c$39$1_0$163
;SpritePlayer.c:39: if (keys == 0) {
	ld	a, (#_keys)
	or	a, a
	jr	NZ, 00110$
	C$SpritePlayer.c$40$2_0$168	= .
	.globl	C$SpritePlayer.c$40$2_0$168
;SpritePlayer.c:40: x_vel = 0;
	ld	hl, #_x_vel
	ld	(hl), #0x00
	C$SpritePlayer.c$41$2_0$168	= .
	.globl	C$SpritePlayer.c$41$2_0$168
;SpritePlayer.c:41: SetSpriteAnim(THIS, anim_idle, 15);
	ld	a, #0x0f
	push	af
	inc	sp
	ld	bc, #_anim_idle
	ld	hl, #_THIS
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_SetSpriteAnim
00110$:
	C$SpritePlayer.c$44$1_0$163	= .
	.globl	C$SpritePlayer.c$44$1_0$163
;SpritePlayer.c:44: if (x_vel < min_x_vel) { x_vel += 1; }
	ld	hl, #_x_vel
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x76
	jr	NC, 00112$
	inc	(hl)
00112$:
	C$SpritePlayer.c$45$1_0$163	= .
	.globl	C$SpritePlayer.c$45$1_0$163
;SpritePlayer.c:45: if (x_vel > max_x_vel) { x_vel -= 1; }
	ld	hl, #_x_vel
	ld	e, (hl)
	ld	a,#0x0a
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00215$
	bit	7, d
	jr	NZ, 00216$
	cp	a, a
	jr	00216$
00215$:
	bit	7, d
	jr	Z, 00216$
	scf
00216$:
	jr	NC, 00114$
	ld	hl, #_x_vel
	dec	(hl)
00114$:
	C$SpritePlayer.c$46$1_0$163	= .
	.globl	C$SpritePlayer.c$46$1_0$163
;SpritePlayer.c:46: if (y_vel < min_y_vel) { y_vel += 1; }
	ld	hl, #_y_vel
	ld	a, (hl)
	xor	a, #0x80
	sub	a, #0x76
	jr	NC, 00116$
	inc	(hl)
00116$:
	C$SpritePlayer.c$47$1_0$163	= .
	.globl	C$SpritePlayer.c$47$1_0$163
;SpritePlayer.c:47: if (y_vel > max_y_vel) { y_vel -= 1; }
	ld	hl, #_y_vel
	ld	e, (hl)
	ld	a,#0x0a
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00217$
	bit	7, d
	jr	NZ, 00218$
	cp	a, a
	jr	00218$
00217$:
	bit	7, d
	jr	Z, 00218$
	scf
00218$:
	jr	NC, 00118$
	ld	hl, #_y_vel
	dec	(hl)
00118$:
	C$SpritePlayer.c$49$1_0$163	= .
	.globl	C$SpritePlayer.c$49$1_0$163
;SpritePlayer.c:49: if (airborne) { y_vel += 1; }
	ld	a, (#_airborne)
	or	a, a
	jr	Z, 00120$
	ld	hl, #_y_vel
	inc	(hl)
00120$:
	C$SpritePlayer.c$50$1_0$163	= .
	.globl	C$SpritePlayer.c$50$1_0$163
;SpritePlayer.c:50: if (y_vel < min_y_vel+2) { airborne = 1; }
	ld	a, (#_y_vel)
	ldhl	sp,	#0
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, #0xf8
	ld	a, (hl)
	sbc	a, #0xff
	ld	d, (hl)
	ld	a, #0xff
	bit	7,a
	jr	Z, 00219$
	bit	7, d
	jr	NZ, 00220$
	cp	a, a
	jr	00220$
00219$:
	bit	7, d
	jr	Z, 00220$
	scf
00220$:
	jr	NC, 00122$
	ld	hl, #_airborne
	ld	(hl), #0x01
00122$:
	C$SpritePlayer.c$51$1_0$163	= .
	.globl	C$SpritePlayer.c$51$1_0$163
;SpritePlayer.c:51: if (y_vel > max_y_vel-2) { airborne = 0; }
	ldhl	sp,	#0
	ld	a, #0x08
	sub	a, (hl)
	inc	hl
	ld	a, #0x00
	sbc	a, (hl)
	ld	a, #0x00
	ld	d, a
	bit	7, (hl)
	jr	Z, 00221$
	bit	7, d
	jr	NZ, 00222$
	cp	a, a
	jr	00222$
00221$:
	bit	7, d
	jr	Z, 00222$
	scf
00222$:
	jr	NC, 00124$
	ld	hl, #_airborne
	ld	(hl), #0x00
00124$:
	C$SpritePlayer.c$53$1_0$163	= .
	.globl	C$SpritePlayer.c$53$1_0$163
;SpritePlayer.c:53: TranslateSprite(THIS, x_vel / 5, y_vel / 5);
	ld	bc, #0x0005
	pop	de
	push	de
	call	__divsint
	ld	d, c
	ld	a, (#_x_vel)
	ld	e, a
	rlca
	sbc	a, a
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	de
	ld	bc, #0x0005
	ld	d, l
	call	__divsint
	inc	sp
	ld	a, c
	ld	hl, #_THIS
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	C$SpritePlayer.c$54$1_0$163	= .
	.globl	C$SpritePlayer.c$54$1_0$163
;SpritePlayer.c:54: }
	call	_TranslateSprite
	pop	hl
	C$SpritePlayer.c$54$1_0$163	= .
	.globl	C$SpritePlayer.c$54$1_0$163
	XG$Update_SpritePlayer$0$0	= .
	.globl	XG$Update_SpritePlayer$0$0
	ret
	G$Destroy_SpritePlayer$0$0	= .
	.globl	G$Destroy_SpritePlayer$0$0
	C$SpritePlayer.c$56$1_0$177	= .
	.globl	C$SpritePlayer.c$56$1_0$177
;SpritePlayer.c:56: void DESTROY() { }
;	---------------------------------
; Function Destroy_SpritePlayer
; ---------------------------------
_Destroy_SpritePlayer::
	C$SpritePlayer.c$56$1_0$177	= .
	.globl	C$SpritePlayer.c$56$1_0$177
	XG$Destroy_SpritePlayer$0$0	= .
	.globl	XG$Destroy_SpritePlayer$0$0
	ret
	.area _CODE_255
	.area _INITIALIZER
FSpritePlayer$__xinit_x_vel$0_0$0 == .
__xinit__x_vel:
	.db #0x00	;  0
FSpritePlayer$__xinit_y_vel$0_0$0 == .
__xinit__y_vel:
	.db #0x00	;  0
FSpritePlayer$__xinit_airborne$0_0$0 == .
__xinit__airborne:
	.db #0x00	;  0
	.area _CABS (ABS)
