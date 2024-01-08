;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _InitSprites
	.globl _InitStates
	.globl _vbl_update
	.globl _FadeOut
	.globl _FadeIn
	.globl _PopBank
	.globl _PushBank
	.globl _SpriteManagerUpdate
	.globl _SpriteManagerReset
	.globl _hUGE_mute
	.globl _MusicCallback
	.globl _display_off
	.globl _wait_vbl_done
	.globl _set_interrupts
	.globl _joypad
	.globl _add_low_priority_TIM
	.globl _add_LCD
	.globl _add_VBL
	.globl _default_palette
	.globl _music_mute_frames
	.globl _vbl_count
	.globl _state_running
	.globl _current_state
	.globl _delta_time
	.globl _SetState
	.globl _LCD_isr
	.globl _SetWindowY
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_delta_time::
	.ds 1
_current_state::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_state_running::
	.ds 1
_vbl_count::
	.ds 1
_music_mute_frames::
	.ds 1
_default_palette::
	.ds 8
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
;C:/gbdk/ZGB/common/src/main.c:69: void LCD_isr() NONBANKED {
;	---------------------------------
; Function LCD_isr
; ---------------------------------
_LCD_isr::
;C:/gbdk/ZGB/common/src/main.c:70: if (LYC_REG == 0) {
	ld	a, (#_LYC_REG)
	or	a, a
	jr	NZ, 00105$
;C:/gbdk/ZGB/common/src/main.c:71: if (WY_REG == 0) {
	ld	a, (#_WY_REG)
	or	a, a
	jr	NZ, 00102$
;C:/gbdk/ZGB/common/src/main.c:72: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
	ret
00102$:
;C:/gbdk/ZGB/common/src/main.c:74: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:75: LYC_REG = WY_REG - 1;
	ldh	a, (_WY_REG + 0)
	dec	a
	ldh	(_LYC_REG + 0), a
	ret
00105$:
;C:/gbdk/ZGB/common/src/main.c:78: HIDE_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xfd
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:79: LYC_REG = 0;
	xor	a, a
	ldh	(_LYC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:81: }
	ret
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;C:/gbdk/ZGB/common/src/main.c:26: void SetState(UINT8 state) {
;	---------------------------------
; Function SetState
; ---------------------------------
_SetState::
	ld	(#_next_state),a
;C:/gbdk/ZGB/common/src/main.c:27: state_running = 0;
	ld	hl, #_state_running
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/main.c:28: next_state = state;
;C:/gbdk/ZGB/common/src/main.c:29: }
	ret
;C:/gbdk/ZGB/common/src/main.c:33: void vbl_update() {
;	---------------------------------
; Function vbl_update
; ---------------------------------
_vbl_update::
;C:/gbdk/ZGB/common/src/main.c:34: vbl_count ++;
	ld	hl, #_vbl_count
	inc	(hl)
;C:/gbdk/ZGB/common/src/main.c:36: SCX_REG = scroll_x_vblank + (scroll_offset_x << 3);
	ld	a, (#_scroll_offset_x)
	add	a, a
	add	a, a
	add	a, a
	ld	hl, #_scroll_x_vblank
	ld	c, (hl)
	add	a, c
	ldh	(_SCX_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:37: SCY_REG = scroll_y_vblank + (scroll_offset_y << 3);
	ld	a, (#_scroll_offset_y)
	add	a, a
	add	a, a
	add	a, a
	ld	hl, #_scroll_y_vblank
	ld	c, (hl)
	add	a, c
	ldh	(_SCY_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:39: if(music_mute_frames != 0) {
	ld	hl, #_music_mute_frames
	ld	a, (hl)
	or	a, a
	ret	Z
;C:/gbdk/ZGB/common/src/main.c:40: music_mute_frames --;
;C:/gbdk/ZGB/common/src/main.c:41: if(music_mute_frames == 0) {
	dec	(hl)
	ld	a, (hl)
	ret	NZ
;C:/gbdk/ZGB/common/src/main.c:42: UNMUTE_ALL_CHANNELS;
	xor	a, a
;C:/gbdk/ZGB/common/src/main.c:45: }
	jp	_hUGE_mute
;C:/gbdk/ZGB/common/src/main.c:83: void SetWindowY(UINT8 y) {
;	---------------------------------
; Function SetWindowY
; ---------------------------------
_SetWindowY::
;C:/gbdk/ZGB/common/src/main.c:84: WY_REG = y;
	ld	c, a
	ldh	(_WY_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:85: LYC_REG = y - 1;
	ld	a, c
	dec	a
	ldh	(_LYC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:86: if (y < 144u) {
	ld	a, c
	sub	a, #0x90
	jr	NC, 00102$
;C:/gbdk/ZGB/common/src/main.c:87: SHOW_WIN; 
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x20
	ldh	(_LCDC_REG + 0), a
	ret
00102$:
;C:/gbdk/ZGB/common/src/main.c:89: HIDE_WIN; 
	ldh	a, (_LCDC_REG + 0)
	and	a, #0xdf
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:90: LYC_REG = 160u; 
	ld	a, #0xa0
	ldh	(_LYC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:92: }
	ret
;C:/gbdk/ZGB/common/src/main.c:97: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;C:/gbdk/ZGB/common/src/main.c:99: for (UINT8 i = 4; i != 0; i--) {
	ld	c, #0x04
00115$:
	ld	a, c
	or	a, a
	jr	Z, 00101$
;C:/gbdk/ZGB/common/src/main.c:100: wait_vbl_done();
	call	_wait_vbl_done
;C:/gbdk/ZGB/common/src/main.c:99: for (UINT8 i = 4; i != 0; i--) {
	dec	c
	jr	00115$
00101$:
;C:/gbdk/ZGB/common/src/main.c:113: PUSH_BANK(1);
	ld	a, #0x01
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:114: InitStates();
	call	_InitStates
;C:/gbdk/ZGB/common/src/main.c:115: InitSprites();
	call	_InitSprites
;C:/gbdk/ZGB/common/src/main.c:116: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/main.c:133: }
	di
;C:/gbdk/ZGB/common/src/main.c:122: TMA_REG = 0xBCU;
	ld	a, #0xbc
	ldh	(_TMA_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:124: TAC_REG = 0x04U;
	ld	a, #0x04
	ldh	(_TAC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:127: add_low_priority_TIM(MusicCallback); 
	ld	de, #_MusicCallback
	call	_add_low_priority_TIM
;C:/gbdk/ZGB/common/src/main.c:129: add_VBL(vbl_update);
	ld	de, #_vbl_update
	call	_add_VBL
;C:/gbdk/ZGB/common/src/main.c:131: STAT_REG |= 0x40; 
	ldh	a, (_STAT_REG + 0)
	or	a, #0x40
	ldh	(_STAT_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:132: add_LCD(LCD_isr);
	ld	de, #_LCD_isr
	call	_add_LCD
	ei
;C:/gbdk/ZGB/common/src/main.c:135: set_interrupts(VBL_IFLAG | TIM_IFLAG | LCD_IFLAG);
	ld	a, #0x07
	call	_set_interrupts
;C:/gbdk/ZGB/common/src/main.c:137: LCDC_REG |= LCDCF_OBJDEFAULT | LCDCF_OBJON | LCDCF_BGON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x07
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:138: WY_REG = 145;
	ld	a, #0x91
	ldh	(_WY_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:140: while(1) {
00112$:
;C:/gbdk/ZGB/common/src/main.c:141: DISPLAY_OFF
	call	_display_off
;C:/gbdk/ZGB/common/src/main.c:143: if(stop_music_on_new_state)
	ld	a, (#_stop_music_on_new_state)
	or	a, a
	jr	Z, 00103$
;C:/gbdk/ZGB/common/src/main.c:145: StopMusic;
	ld	hl, #_hUGE_paused
	ld	(hl), #0x01
	ld	a, #0x01
	call	_hUGE_mute
	xor	a, a
	ld	hl, #_last_music
	ld	(hl+), a
	ld	(hl), a
00103$:
;C:/gbdk/ZGB/common/src/main.c:148: SpriteManagerReset();
	call	_SpriteManagerReset
;C:/gbdk/ZGB/common/src/main.c:149: state_running = 1;
	ld	hl, #_state_running
	ld	(hl), #0x01
;C:/gbdk/ZGB/common/src/main.c:150: current_state = next_state;
	ld	a, (#_next_state)
	ld	(#_current_state),a
;C:/gbdk/ZGB/common/src/main.c:151: scroll_target = 0;
	xor	a, a
	ld	hl, #_scroll_target
	ld	(hl+), a
	ld	(hl), a
;C:/gbdk/ZGB/common/src/main.c:152: last_bg_pal_loaded = 0;
	ld	hl, #_last_bg_pal_loaded
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/main.c:153: last_tile_loaded = 0;
	ld	hl, #_last_tile_loaded
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/main.c:164: BGP_REG = OBP0_REG = OBP1_REG = PAL_DEF(0, 1, 2, 3);
	ld	a, #0xe4
	ldh	(_OBP1_REG + 0), a
	ld	a, #0xe4
	ldh	(_OBP0_REG + 0), a
	ld	a, #0xe4
	ldh	(_BGP_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:166: PUSH_BANK(stateBanks[current_state]);
	ld	a, #<(_stateBanks)
	ld	hl, #_current_state
	add	a, (hl)
	ld	c, a
	ld	a, #>(_stateBanks)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:167: (startFuncs[current_state])();
	ld	bc, #_startFuncs+0
	ld	hl, #_current_state
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, bc
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
;C:/gbdk/ZGB/common/src/main.c:168: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/main.c:169: scroll_x_vblank = scroll_x;
	ld	a, (#_scroll_x)
	ld	(#_scroll_x_vblank),a
;C:/gbdk/ZGB/common/src/main.c:170: scroll_y_vblank = scroll_y;
	ld	a, (#_scroll_y)
	ld	(#_scroll_y_vblank),a
;C:/gbdk/ZGB/common/src/main.c:172: if(state_running) {
	ld	a, (#_state_running)
	or	a, a
	jr	Z, 00128$
;C:/gbdk/ZGB/common/src/main.c:173: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
;C:/gbdk/ZGB/common/src/main.c:174: FadeOut();
	call	_FadeOut
;C:/gbdk/ZGB/common/src/main.c:177: while (state_running) {
00128$:
00108$:
	ld	a, (#_state_running)
	or	a, a
	jr	Z, 00110$
;C:/gbdk/ZGB/common/src/main.c:178: if(!vbl_count)
	ld	a, (#_vbl_count)
	or	a, a
	jr	NZ, 00107$
;C:/gbdk/ZGB/common/src/main.c:179: wait_vbl_done();
	call	_wait_vbl_done
00107$:
;C:/gbdk/ZGB/common/src/main.c:180: delta_time = vbl_count == 1u ? 0u : 1u;
	ld	a, (#_vbl_count)
	dec	a
	jr	Z, 00120$
	ld	a, #0x01
00120$:
	ld	(#_delta_time),a
;C:/gbdk/ZGB/common/src/main.c:181: vbl_count = 0;
	ld	hl, #_vbl_count
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/main.c:183: UPDATE_KEYS();
	ld	a, (#_keys)
	ld	(#_previous_keys),a
	call	_joypad
	ld	(#_keys),a
;C:/gbdk/ZGB/common/src/main.c:185: SpriteManagerUpdate();
	call	_SpriteManagerUpdate
;C:/gbdk/ZGB/common/src/main.c:186: PUSH_BANK(stateBanks[current_state]);
	ld	a, #<(_stateBanks)
	ld	hl, #_current_state
	add	a, (hl)
	ld	c, a
	ld	a, #>(_stateBanks)
	adc	a, #0x00
	ld	b, a
	ld	a, (bc)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/main.c:187: updateFuncs[current_state]();
	ld	hl, #_current_state
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_updateFuncs
	add	hl, de
	ld	c, (hl)
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	call	___sdcc_call_hl
;C:/gbdk/ZGB/common/src/main.c:188: POP_BANK;
	call	_PopBank
	jr	00108$
00110$:
;C:/gbdk/ZGB/common/src/main.c:191: FadeIn();
	call	_FadeIn
;C:/gbdk/ZGB/common/src/main.c:193: }
	jp	00112$
	.area _CODE
	.area _INITIALIZER
__xinit__state_running:
	.db #0x00	; 0
__xinit__vbl_count:
	.db #0x00	; 0
__xinit__music_mute_frames:
	.db #0x00	; 0
__xinit__default_palette:
	.dw #0x7fff
	.dw #0x5294
	.dw #0x294a
	.dw #0x0000
	.area _CABS (ABS)
