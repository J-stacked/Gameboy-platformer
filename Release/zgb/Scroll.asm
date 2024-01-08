;--------------------------------------------------------
; File Created by SDCC : free open source ISO C Compiler 
; Version 4.3.2 #14228 (MINGW32)
;--------------------------------------------------------
	.module Scroll
	.optsdcc -msm83
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _ScrollUpdateColumnWithDelay
	.globl _ScrollUpdateColumnR
	.globl _ScrollUpdateRowWithDelay
	.globl _ScrollUpdateRowR
	.globl _ClampScrollLimits
	.globl _UPDATE_TILE
	.globl _SetTile
	.globl _GetTileReplacement
	.globl _memset
	.globl _PopBank
	.globl _PushBank
	.globl _SpriteManagerAdd
	.globl _set_win_tile_xy
	.globl _set_bkg_tile_xy
	.globl _set_bkg_data
	.globl _clamp_enabled
	.globl _scroll_h_border
	.globl _last_bg_pal_loaded
	.globl _last_tile_loaded
	.globl _pending_w_map
	.globl _pending_h_map
	.globl _scroll_offset_y
	.globl _scroll_offset_x
	.globl _scroll_target
	.globl _scroll_y_vblank
	.globl _scroll_x_vblank
	.globl _scroll_y
	.globl _scroll_x
	.globl _scroll_cmap
	.globl _scroll_map
	.globl _scroll_bottom_movement_limit
	.globl _scroll_top_movement_limit
	.globl _current_vbl_count
	.globl _tiles_0
	.globl _tiles_bank_0
	.globl _hud_map_offset
	.globl _pending_w_i
	.globl _pending_w_y
	.globl _pending_w_x
	.globl _pending_h_i
	.globl _pending_h_y
	.globl _pending_h_x
	.globl _scroll_bank
	.globl _scroll_tile_info
	.globl _scroll_collisions_down
	.globl _scroll_collisions
	.globl _scroll_tiles_h
	.globl _scroll_tiles_w
	.globl _scroll_h
	.globl _scroll_w
	.globl _ScrollSetTiles
	.globl _UpdateMapTile
	.globl _LoadMap
	.globl _ScrollSetMap
	.globl _InitScroll
	.globl _InitScrollWithTiles
	.globl _ScrollUpdateRow
	.globl _ScrollUpdateColumn
	.globl _RefreshScroll
	.globl _MoveScroll
	.globl _GetScrollTilePtr
	.globl _GetScrollTile
	.globl _GetMapSize
	.globl _ScrollFindTile
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_scroll_w::
	.ds 2
_scroll_h::
	.ds 2
_scroll_tiles_w::
	.ds 2
_scroll_tiles_h::
	.ds 2
_scroll_collisions::
	.ds 256
_scroll_collisions_down::
	.ds 256
_scroll_tile_info::
	.ds 256
_scroll_bank::
	.ds 1
_pending_h_x::
	.ds 2
_pending_h_y::
	.ds 2
_pending_h_i::
	.ds 1
_pending_w_x::
	.ds 2
_pending_w_y::
	.ds 2
_pending_w_i::
	.ds 1
_hud_map_offset::
	.ds 2
_tiles_bank_0::
	.ds 1
_tiles_0::
	.ds 2
_current_vbl_count::
	.ds 1
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
_scroll_top_movement_limit::
	.ds 1
_scroll_bottom_movement_limit::
	.ds 1
_scroll_map::
	.ds 2
_scroll_cmap::
	.ds 2
_scroll_x::
	.ds 2
_scroll_y::
	.ds 2
_scroll_x_vblank::
	.ds 1
_scroll_y_vblank::
	.ds 1
_scroll_target::
	.ds 2
_scroll_offset_x::
	.ds 1
_scroll_offset_y::
	.ds 1
_pending_h_map::
	.ds 2
_pending_w_map::
	.ds 2
_last_tile_loaded::
	.ds 1
_last_bg_pal_loaded::
	.ds 1
_scroll_h_border::
	.ds 1
_clamp_enabled::
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
	.area _CODE
;C:/gbdk/ZGB/common/src/Scroll.c:66: void SetTile(UINT16 r, UINT8 t) OLDCALL{
;	---------------------------------
; Function SetTile
; ---------------------------------
_SetTile::
;C:/gbdk/ZGB/common/src/Scroll.c:88: __endasm;
;bc	= r, hl = t
	ldhl	sp,#2
	ld	c,(hl)
	inc	hl
	ld	b,(hl)
	ldhl	sp,#4
;while	0xff41 & 02 != 0 (cannot write)
1$:
	ld	a,(#_STAT_REG)
	and	a, #0x02
	jr	NZ,1$
;Write	tile
	ld	a,(hl)
	ld	(bc),a
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:89: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:91: void UPDATE_TILE(INT16 x, INT16 y, UINT8* t, UINT8* c) {
;	---------------------------------
; Function UPDATE_TILE
; ---------------------------------
_UPDATE_TILE::
	add	sp, #-10
	ldhl	sp,	#7
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ldhl	sp,	#5
	ld	a, c
	ld	(hl+), a
;C:/gbdk/ZGB/common/src/Scroll.c:100: if((UINT16)x >= scroll_tiles_w || (UINT16)y >= scroll_tiles_h) { //This also checks x < 0 || y < 0
	ld	a, b
	ld	(hl+), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_tiles_w
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	NC, 00109$
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_tiles_h
	ld	a, c
	sub	a, (hl)
	inc	hl
	ld	a, b
	sbc	a, (hl)
	jr	C, 00110$
00109$:
;C:/gbdk/ZGB/common/src/Scroll.c:101: replacement = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
	jp	00111$
00110$:
;C:/gbdk/ZGB/common/src/Scroll.c:103: replacement = *t;
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
;C:/gbdk/ZGB/common/src/Scroll.c:104: type = GetTileReplacement(t, &replacement);
	ldhl	sp,#0
	ld	(hl), a
	ld	c, l
	ld	b, h
	call	_GetTileReplacement
;C:/gbdk/ZGB/common/src/Scroll.c:105: if(type != 255u) {
	ld	c, a
	inc	a
	jp	Z,00111$
;C:/gbdk/ZGB/common/src/Scroll.c:106: id = SPRITE_UNIQUE_ID(x, y);
	ldhl	sp,	#7
	ld	a, (hl-)
	dec	hl
	ld	e, a
	ld	b, (hl)
	ld	l, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ldhl	sp,	#3
	ld	(hl), e
	pop	hl
	push	hl
	ld	a, h
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
;C:/gbdk/ZGB/common/src/Scroll.c:107: for(i = 0u; i != sprite_manager_updatables[0]; ++i) {
	ldhl	sp,	#9
	ld	(hl), #0x00
00114$:
	ld	hl, #_sprite_manager_updatables
	ld	b, (hl)
	ldhl	sp,	#9
	ld	a, (hl)
	sub	a, b
	ld	a, #0x01
	jr	Z, 00163$
	xor	a, a
00163$:
	ld	b, a
	bit	0, b
	jr	NZ, 00104$
;C:/gbdk/ZGB/common/src/Scroll.c:108: s = sprite_manager_sprites[sprite_manager_updatables[i + 1]];
	ldhl	sp,	#9
	ld	e, (hl)
	ld	d, #0x00
	inc	de
	ld	hl, #_sprite_manager_updatables
	add	hl, de
	ld	l, (hl)
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_sprite_manager_sprites
	add	hl, de
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;C:/gbdk/ZGB/common/src/Scroll.c:109: if((s->type == type) && (s->unique_id == id)) {
	ld	l, a
	add	a, #0x13
	ld	e, a
	ld	a, h
	adc	a, #0x00
	ld	d, a
	ld	a, (de)
	ld	e, a
	ld	a, c
	sub	a, e
	jr	NZ, 00115$
	ld	de, #0x0019
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#3
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00166$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	Z, 00104$
00166$:
;C:/gbdk/ZGB/common/src/Scroll.c:110: break;
00115$:
;C:/gbdk/ZGB/common/src/Scroll.c:107: for(i = 0u; i != sprite_manager_updatables[0]; ++i) {
	ldhl	sp,	#9
	inc	(hl)
	jr	00114$
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:114: if(i == sprite_manager_updatables[0]) {
	ld	a, b
	or	a, a
	jr	Z, 00111$
;C:/gbdk/ZGB/common/src/Scroll.c:115: PUSH_BANK(spriteDataBanks[type]);
	ld	hl, #_spriteDataBanks
	ld	b, #0x00
	add	hl, bc
	ld	a, (hl)
	push	bc
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:116: sprite_y = ((y + 1) << 3) - spriteDatas[type]->height;
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ldhl	sp,	#1
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	ld	de, #_spriteDatas
	add	hl, de
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	b, e
	ldhl	sp,	#3
	ld	(hl), b
	inc	hl
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:117: POP_BANK;
	push	bc
	call	_PopBank
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:118: s = SpriteManagerAdd(type, x << 3, sprite_y);
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sla	e
	rl	d
	sla	e
	rl	d
	sla	e
	rl	d
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	a, c
	call	_SpriteManagerAdd
00111$:
;C:/gbdk/ZGB/common/src/Scroll.c:123: id = 0x9800 + (0x1F & (x + scroll_offset_x)) + ((0x1F & (y + scroll_offset_y)) << 5);
	ld	hl, #_scroll_offset_x
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	a, l
	and	a, #0x1f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
;	spillPairReg hl
	ld	c, a
	ld	a, h
	add	a, #0x98
	ld	b, a
	ld	hl, #_scroll_offset_y
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#5
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	a, l
	and	a, #0x1f
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
	ld	c, l
	ld	b, h
;C:/gbdk/ZGB/common/src/Scroll.c:124: SetTile(id, replacement);
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	call	_SetTile
;C:/gbdk/ZGB/common/src/Scroll.c:137: }
	add	sp, #13
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:140: UINT16 ScrollSetTiles(UINT8 first_tile, UINT8 tiles_bank, const struct TilesInfo* tiles) {
;	---------------------------------
; Function ScrollSetTiles
; ---------------------------------
_ScrollSetTiles::
	add	sp, #-7
	ldhl	sp,	#6
;C:/gbdk/ZGB/common/src/Scroll.c:145: UINT16 offset = first_tile;
	ld	(hl), a
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:150: tiles_0 = tiles;
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
;C:/gbdk/ZGB/common/src/Scroll.c:147: if(first_tile == 0)
	ldhl	sp,	#6
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:149: tiles_bank_0 = tiles_bank;
	ld	hl, #_tiles_bank_0
	ld	(hl), e
;C:/gbdk/ZGB/common/src/Scroll.c:150: tiles_0 = tiles;
	ld	hl, #_tiles_0
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:153: PUSH_BANK(tiles_bank);
	push	bc
	ld	a, e
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:154: n_tiles = tiles->num_frames;
	ld	a, (bc)
	ldhl	sp,	#5
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:155: palette_entries = tiles->color_data;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:157: set_bkg_data(first_tile, n_tiles, tiles->data);
	ld	l, c
	ld	h, b
	inc	hl
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	push	bc
	ldhl	sp,	#7
	ld	a, (hl+)
	ld	d, a
	ld	e, (hl)
	push	de
	call	_set_bkg_data
	add	sp, #4
;C:/gbdk/ZGB/common/src/Scroll.c:158: last_tile_loaded = first_tile + n_tiles;
	ldhl	sp,	#6
	ld	a, (hl-)
	add	a, (hl)
	ld	(#_last_tile_loaded),a
;C:/gbdk/ZGB/common/src/Scroll.c:159: for(i = first_tile; i != last_tile_loaded; ++i) {
	ldhl	sp,	#6
	ld	c, (hl)
00105$:
	ld	a, (#_last_tile_loaded)
	sub	a, c
	jr	Z, 00103$
;C:/gbdk/ZGB/common/src/Scroll.c:160: scroll_tile_info[i] = palette_entries ? palette_entries[i - first_tile] : 0;
	ld	de, #_scroll_tile_info
	ld	l, c
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	dec	hl
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00109$
	ld	a, c
	ld	b, #0x00
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	d, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, (de)
	jr	00110$
00109$:
	xor	a, a
00110$:
	ld	b, a
	ldhl	sp,	#4
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	ld	(hl), b
;C:/gbdk/ZGB/common/src/Scroll.c:159: for(i = first_tile; i != last_tile_loaded; ++i) {
	inc	c
	jr	00105$
00103$:
;C:/gbdk/ZGB/common/src/Scroll.c:179: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:181: return offset;
	pop	bc
	push	bc
;C:/gbdk/ZGB/common/src/Scroll.c:182: }
	add	sp, #7
	pop	hl
	pop	af
	jp	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:184: void UpdateMapTile(UINT8 bg_or_win, UINT8 x, UINT8 y, UINT16 map_offset, UINT8 data, UINT8* attr)
;	---------------------------------
; Function UpdateMapTile
; ---------------------------------
_UpdateMapTile::
	ld	c, a
	ld	b, e
;C:/gbdk/ZGB/common/src/Scroll.c:187: UINT8* offsetts = &map_offset;
;C:/gbdk/ZGB/common/src/Scroll.c:188: data += offsetts[0];
	ldhl	sp,	#3
	ld	a, (hl+)
	inc	hl
	add	a, (hl)
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:189: if(bg_or_win == 0)
	ld	a, c
	or	a, a
	jr	NZ, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:190: set_bkg_tile_xy(x, y, data);
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_bkg_tile_xy
	add	sp, #3
	jr	00104$
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:192: set_win_tile_xy(x, y, data);
	ldhl	sp,	#5
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#3
	ld	a, (hl)
	push	af
	inc	sp
	push	bc
	inc	sp
	call	_set_win_tile_xy
	add	sp, #3
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:208: }
	pop	hl
	add	sp, #6
	jp	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:210: UINT16 LoadMap(UINT8 bg_or_win, UINT8 x, UINT8 y, UINT8 map_bank, struct MapInfo* map) {
;	---------------------------------
; Function LoadMap
; ---------------------------------
_LoadMap::
	add	sp, #-17
	ldhl	sp,	#10
	ld	(hl-), a
	ld	(hl), e
;C:/gbdk/ZGB/common/src/Scroll.c:211: PUSH_BANK(map_bank);
	ldhl	sp,	#20
	ld	a, (hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:214: UINT8 load_tiles = tiles_bank_0 != map->tiles_bank || tiles_0 != map->tiles; //If the tile set is the same as the one used for the scroll or the bg (which is stored in tiles_bank_0 and tiles0) then do not load the tiles again
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0006
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ld	hl, #0x0007
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#17
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#16
	ld	(hl), a
	ld	a, (#_tiles_bank_0)
	ldhl	sp,	#14
	sub	a, (hl)
	jr	NZ, 00116$
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_tiles_0)
	ldhl	sp,	#12
	sub	a, (hl)
	jr	NZ, 00116$
	ld	a, (#_tiles_0 + 1)
	ldhl	sp,	#13
	sub	a, (hl)
	jr	NZ, 00116$
	xor	a, a
	jr	00117$
00116$:
	ld	a, #0x01
00117$:
;C:/gbdk/ZGB/common/src/Scroll.c:215: UINT16 map_offset = 0;
	ldhl	sp,	#2
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:216: if(load_tiles)
	or	a, a
	jr	Z, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:217: map_offset = ScrollSetTiles(last_tile_loaded, map->tiles_bank, map->tiles);
	ldhl	sp,#15
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	bc
	push	hl
	ldhl	sp,	#18
	ld	e, (hl)
	ld	a, (#_last_tile_loaded)
	call	_ScrollSetTiles
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	pop	bc
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:220: UINT8* data = map->data;
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:221: UINT8* attrs = map->attributes;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:222: for(UINT8 j = 0; j < map->height; ++j) {
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl+), a
	inc	bc
	inc	bc
	inc	bc
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
	ldhl	sp,	#11
	ld	(hl), #0x00
00111$:
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#11
	ld	a, (hl)
	sub	a, c
	jr	NC, 00106$
;C:/gbdk/ZGB/common/src/Scroll.c:223: for(UINT8 i = 0; i < map->width; ++i) {
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#11
	add	a, (hl)
	ldhl	sp,	#8
	ld	(hl), a
	ldhl	sp,	#0
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#1
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl+), a
	ld	(hl), #0x00
00108$:
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	ldhl	sp,	#16
	ld	a, (hl)
	sub	a, c
	jr	NC, 00126$
;C:/gbdk/ZGB/common/src/Scroll.c:224: UpdateMapTile(bg_or_win, x + i, y + j, map_offset, *data, attrs);
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,	#9
	ld	a, (hl)
	ldhl	sp,	#16
	add	a, (hl)
	ld	c, a
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#13
	ld	a, (hl+)
	inc	hl
	push	af
	inc	sp
	ld	e, c
	ld	a, (hl)
	call	_UpdateMapTile
;C:/gbdk/ZGB/common/src/Scroll.c:226: ++ data;
	ldhl	sp,	#14
	inc	(hl)
	jr	NZ, 00180$
	inc	hl
	inc	(hl)
00180$:
;C:/gbdk/ZGB/common/src/Scroll.c:227: if(attrs)
	ldhl	sp,	#13
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00109$
;C:/gbdk/ZGB/common/src/Scroll.c:228: ++ attrs;
	inc	(hl)
	jr	NZ, 00181$
	inc	hl
	inc	(hl)
00181$:
00109$:
;C:/gbdk/ZGB/common/src/Scroll.c:223: for(UINT8 i = 0; i < map->width; ++i) {
	ldhl	sp,	#16
	inc	(hl)
	jr	00108$
00126$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:222: for(UINT8 j = 0; j < map->height; ++j) {
	ldhl	sp,	#11
	inc	(hl)
	jp	00111$
00106$:
;C:/gbdk/ZGB/common/src/Scroll.c:232: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:235: return map_offset;
	ldhl	sp,	#2
	ld	c, (hl)
	inc	hl
	ld	b, (hl)
;C:/gbdk/ZGB/common/src/Scroll.c:236: }
	add	sp, #17
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:240: void ClampScrollLimits() {
;	---------------------------------
; Function ClampScrollLimits
; ---------------------------------
_ClampScrollLimits::
;C:/gbdk/ZGB/common/src/Scroll.c:241: if(clamp_enabled) {
	ld	a, (#_clamp_enabled)
	or	a, a
	ret	Z
;C:/gbdk/ZGB/common/src/Scroll.c:242: if(U_LESS_THAN(scroll_x, 0u)) {
	ld	hl, #_scroll_x
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	jr	NC, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:243: scroll_x = 0u;		
	xor	a, a
	ld	hl, #_scroll_x
	ld	(hl+), a
	ld	(hl), a
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:245: if(scroll_x > (scroll_w - SCREENWIDTH)) {
	ld	hl, #_scroll_w
	ld	a, (hl+)
	add	a, #0x60
	ld	c, a
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	hl, #_scroll_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	jr	NC, 00104$
;C:/gbdk/ZGB/common/src/Scroll.c:246: scroll_x = (scroll_w - SCREENWIDTH);
	dec	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:248: if(U_LESS_THAN(scroll_y, 0u)) {
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	jr	NC, 00106$
;C:/gbdk/ZGB/common/src/Scroll.c:249: scroll_y = 0u;		
	xor	a, a
	ld	hl, #_scroll_y
	ld	(hl+), a
	ld	(hl), a
00106$:
;C:/gbdk/ZGB/common/src/Scroll.c:251: if(scroll_y > (scroll_h - SCREENHEIGHT + scroll_h_border)) {
	ld	hl, #_scroll_h
	ld	a, (hl+)
	add	a, #0x70
	ld	c, a
	ld	a, (hl)
	adc	a, #0xff
	ld	b, a
	ld	a, (#_scroll_h_border)
	ld	e, a
	rlca
	sbc	a, a
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, c
	sub	a, e
	ld	a, b
	sbc	a, d
	ret	NC
;C:/gbdk/ZGB/common/src/Scroll.c:252: scroll_y = (scroll_h - SCREENHEIGHT + scroll_h_border);
	dec	hl
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/gbdk/ZGB/common/src/Scroll.c:255: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:257: void ScrollSetMap(UINT8 map_bank, const struct MapInfo* map) {
;	---------------------------------
; Function ScrollSetMap
; ---------------------------------
_ScrollSetMap::
	add	sp, #-3
	ldhl	sp,	#2
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:258: PUSH_BANK(map_bank);
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:259: scroll_tiles_w = map->width;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	hl, #_scroll_tiles_w
	ld	(hl+), a
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:260: scroll_tiles_h = map->height;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	hl, #_scroll_tiles_h
	ld	(hl+), a
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:261: scroll_map = map->data;
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	hl, #_scroll_map
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:262: scroll_cmap = map->attributes;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	e, c
	ld	d, b
	ld	a, (de)
	ld	hl, #_scroll_cmap
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:263: scroll_x = 0;
	xor	a, a
	ld	hl, #_scroll_x
	ld	(hl+), a
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:264: scroll_y = 0;
	xor	a, a
	ld	hl, #_scroll_y
	ld	(hl+), a
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:265: scroll_w = scroll_tiles_w << 3;
	ld	a, (#_scroll_tiles_w)
	ld	(#_scroll_w),a
	ld	a, (#_scroll_tiles_w + 1)
	ld	(#_scroll_w + 1),a
	ld	a, #0x03
00112$:
	ld	hl, #_scroll_w
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00112$
;C:/gbdk/ZGB/common/src/Scroll.c:266: scroll_h = scroll_tiles_h << 3;
	ld	a, (#_scroll_tiles_h)
	ld	(#_scroll_h),a
	ld	a, (#_scroll_tiles_h + 1)
	ld	(#_scroll_h + 1),a
	ld	a, #0x03
00113$:
	ld	hl, #_scroll_h
	sla	(hl)
	inc	hl
	rl	(hl)
	dec	a
	jr	NZ, 00113$
;C:/gbdk/ZGB/common/src/Scroll.c:267: scroll_bank = map_bank;
	ldhl	sp,	#2
	ld	a, (hl)
	ld	(#_scroll_bank),a
;C:/gbdk/ZGB/common/src/Scroll.c:268: if(scroll_target) {
	ld	hl, #_scroll_target + 1
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:269: scroll_x = scroll_target->x - (SCREENWIDTH >> 1);
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000c
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	pop	de
	push	de
	ld	hl, #0x0050
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ld	hl, #_scroll_x + 1
	ld	(hl-), a
	ld	(hl), e
;C:/gbdk/ZGB/common/src/Scroll.c:270: scroll_y = scroll_target->y - scroll_bottom_movement_limit; //Move the camera to its bottom limit
	ld	hl, #0x000e
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_bottom_movement_limit
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	hl, #_scroll_y
	ld	(hl+), a
	ld	a, b
	sbc	a, d
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:271: ClampScrollLimits();
	call	_ClampScrollLimits
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:273: pending_h_i = 0;
	ld	hl, #_pending_h_i
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:274: pending_w_i = 0;
	ld	hl, #_pending_w_i
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:275: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:276: }
	add	sp, #3
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:278: void InitScroll(UINT8 map_bank, const struct MapInfo* map, const UINT8* coll_list, const UINT8* coll_list_down) {
;	---------------------------------
; Function InitScroll
; ---------------------------------
_InitScroll::
	add	sp, #-4
	ldhl	sp,	#3
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:283: PUSH_BANK(map_bank)
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:284: tiles_bank = map->tiles_bank;
	ld	hl, #0x0006
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:285: tiles = map->tiles;
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ld	a, (de)
	ldhl	sp,	#1
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:286: POP_BANK;
	push	bc
	call	_PopBank
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:288: InitScrollWithTiles(map_bank, map, tiles_bank, tiles, coll_list, coll_list_down);
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	ld	d, a
	push	de
	ld	a, (hl)
	push	af
	inc	sp
	ld	e, c
	ld	d, b
	ldhl	sp,	#10
	ld	a, (hl)
	call	_InitScrollWithTiles
;C:/gbdk/ZGB/common/src/Scroll.c:289: }
	add	sp, #4
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:291: void InitScrollWithTiles(UINT8 map_bank, const struct MapInfo* map, UINT8 tiles_info_bank, const struct TilesInfo* tiles_info, const UINT8* coll_list, const UINT8* coll_list_down)
;	---------------------------------
; Function InitScrollWithTiles
; ---------------------------------
_InitScrollWithTiles::
	add	sp, #-4
	ldhl	sp,	#0
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:296: ScrollSetTiles(0, tiles_info_bank, tiles_info);
	push	de
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	push	bc
	ld	e, (hl)
	xor	a, a
	call	_ScrollSetTiles
	pop	de
;C:/gbdk/ZGB/common/src/Scroll.c:298: ScrollSetMap(map_bank, map);
	ldhl	sp,	#0
	ld	a, (hl)
	call	_ScrollSetMap
;C:/gbdk/ZGB/common/src/Scroll.c:300: memset(scroll_collisions, 0, sizeof(scroll_collisions));
	xor	a, a
	inc	a
	push	af
	ld	de, #0x0000
	push	de
	ld	de, #_scroll_collisions
	push	de
	call	_memset
	add	sp, #6
;C:/gbdk/ZGB/common/src/Scroll.c:301: memset(scroll_collisions_down, 0, sizeof(scroll_collisions_down));
	xor	a, a
	inc	a
	push	af
	ld	de, #0x0000
	push	de
	ld	de, #_scroll_collisions_down
	push	de
	call	_memset
	add	sp, #6
;C:/gbdk/ZGB/common/src/Scroll.c:303: if(coll_list) {
	ldhl	sp,	#10
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00103$
;C:/gbdk/ZGB/common/src/Scroll.c:304: for(i = 0u; coll_list[i] != 0u; ++i) {
	ld	e, #0x00
00109$:
	push	de
	ld	d, #0x00
	ldhl	sp,	#11
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00103$
;C:/gbdk/ZGB/common/src/Scroll.c:305: scroll_collisions[coll_list[i]] = 1u;
	add	a, #<(_scroll_collisions)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, #>(_scroll_collisions)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0x01
;C:/gbdk/ZGB/common/src/Scroll.c:306: scroll_collisions_down[coll_list[i]] = 1u;
	ld	a, (bc)
	ld	c, a
	ld	hl, #_scroll_collisions_down
	ld	b, #0x00
	add	hl, bc
	ld	(hl), #0x01
;C:/gbdk/ZGB/common/src/Scroll.c:304: for(i = 0u; coll_list[i] != 0u; ++i) {
	inc	e
	jr	00109$
00103$:
;C:/gbdk/ZGB/common/src/Scroll.c:309: if(coll_list_down) {
	ldhl	sp,	#12
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00106$
;C:/gbdk/ZGB/common/src/Scroll.c:310: for(i = 0u; coll_list_down[i] != 0u; ++i) {
	ld	e, #0x00
00112$:
	push	de
	ld	d, #0x00
	ldhl	sp,	#13
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	pop	de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	or	a, a
	jr	Z, 00106$
;C:/gbdk/ZGB/common/src/Scroll.c:311: scroll_collisions_down[coll_list_down[i]] = 1u;
	add	a, #<(_scroll_collisions_down)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #0x00
	adc	a, #>(_scroll_collisions_down)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	(hl), #0x01
;C:/gbdk/ZGB/common/src/Scroll.c:310: for(i = 0u; coll_list_down[i] != 0u; ++i) {
	inc	e
	jr	00112$
00106$:
;C:/gbdk/ZGB/common/src/Scroll.c:316: PUSH_BANK(map_bank);
	ldhl	sp,	#0
	ld	a, (hl)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:317: y = scroll_y >> 3;
	ld	a, (#_scroll_y)
	ldhl	sp,	#1
	ld	(hl), a
	ld	a, (#_scroll_y + 1)
	ldhl	sp,	#2
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:318: for(i = 0u; i != (SCREEN_TILE_REFRES_H) && y != scroll_h; ++i, y ++) {
	inc	hl
	inc	hl
	ld	(hl), #0x00
00116$:
	ldhl	sp,	#3
	ld	a, (hl)
	sub	a, #0x15
	jr	Z, 00107$
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_scroll_h
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00187$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00107$
00187$:
;C:/gbdk/ZGB/common/src/Scroll.c:319: ScrollUpdateRow((scroll_x >> 3) - SCREEN_PAD_LEFT,  y - SCREEN_PAD_TOP);
	ldhl	sp,#1
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	dec	bc
	ld	hl, #_scroll_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	sra	d
	rr	e
	sra	d
	rr	e
	sra	d
	rr	e
	dec	de
	call	_ScrollUpdateRow
;C:/gbdk/ZGB/common/src/Scroll.c:318: for(i = 0u; i != (SCREEN_TILE_REFRES_H) && y != scroll_h; ++i, y ++) {
	ldhl	sp,	#3
	inc	(hl)
	dec	hl
	dec	hl
	inc	(hl)
	jr	NZ, 00116$
	inc	hl
	inc	(hl)
	jr	00116$
00107$:
;C:/gbdk/ZGB/common/src/Scroll.c:321: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:322: }
	add	sp, #4
	pop	hl
	add	sp, #7
	jp	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:324: void ScrollUpdateRowR() {
;	---------------------------------
; Function ScrollUpdateRowR
; ---------------------------------
_ScrollUpdateRowR::
	dec	sp
;C:/gbdk/ZGB/common/src/Scroll.c:327: for(i = 0u; i != 5 && pending_w_i != 0; ++i, -- pending_w_i)  {
	ldhl	sp,	#0
	ld	(hl), #0x00
00104$:
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, #0x05
	jr	Z, 00106$
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00106$
;C:/gbdk/ZGB/common/src/Scroll.c:331: UPDATE_TILE(pending_w_x ++, pending_w_y, pending_w_map ++,0);
	ld	hl, #_pending_w_map
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	(hl)
	jr	NZ, 00131$
	inc	hl
	inc	(hl)
00131$:
	ld	hl, #_pending_w_x
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	(hl)
	jr	NZ, 00132$
	inc	hl
	inc	(hl)
00132$:
	ld	hl, #0x0000
	push	hl
	push	bc
	ld	hl, #_pending_w_y
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_UPDATE_TILE
;C:/gbdk/ZGB/common/src/Scroll.c:327: for(i = 0u; i != 5 && pending_w_i != 0; ++i, -- pending_w_i)  {
	ldhl	sp,	#0
	inc	(hl)
	ld	hl, #_pending_w_i
	dec	(hl)
	jr	00104$
00106$:
;C:/gbdk/ZGB/common/src/Scroll.c:334: }
	inc	sp
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:336: void ScrollUpdateRowWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRowWithDelay
; ---------------------------------
_ScrollUpdateRowWithDelay::
;C:/gbdk/ZGB/common/src/Scroll.c:337: while(pending_w_i) {
00101$:
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00103$
;C:/gbdk/ZGB/common/src/Scroll.c:338: ScrollUpdateRowR();
	push	bc
	push	de
	call	_ScrollUpdateRowR
	pop	de
	pop	bc
	jr	00101$
00103$:
;C:/gbdk/ZGB/common/src/Scroll.c:341: pending_w_x = x;
	ld	hl, #_pending_w_x
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/gbdk/ZGB/common/src/Scroll.c:342: pending_w_y = y;
	ld	hl, #_pending_w_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/gbdk/ZGB/common/src/Scroll.c:343: pending_w_i = SCREEN_TILE_REFRES_W;
	ld	hl, #_pending_w_i
	ld	(hl), #0x17
;C:/gbdk/ZGB/common/src/Scroll.c:344: pending_w_map = scroll_map + scroll_tiles_w * y + x;
	push	de
	ld	hl, #_scroll_tiles_w
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	pop	de
	ld	a, c
	ld	hl, #_scroll_map
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ld	a, c
	add	a, e
	ld	hl, #_pending_w_map
	ld	(hl+), a
	ld	a, b
	adc	a, d
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:349: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:351: void ScrollUpdateRow(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateRow
; ---------------------------------
_ScrollUpdateRow::
	add	sp, #-7
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	inc	sp
	inc	sp
	push	bc
	ld	hl, #_scroll_tiles_w
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ld	a, c
	ld	hl, #_scroll_map
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
;C:/gbdk/ZGB/common/src/Scroll.c:359: PUSH_BANK(scroll_bank);
	push	hl
	ld	a, (#_scroll_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:360: for(i = 0u; i != SCREEN_TILE_REFRES_W; ++i) {
	ldhl	sp,	#4
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl+), a
	ld	(hl), #0x00
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:364: UPDATE_TILE(x + i, y, map ++, 0);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	(hl)
	jr	NZ, 00121$
	inc	hl
	inc	(hl)
00121$:
	ldhl	sp,	#6
	ld	e, (hl)
	ld	d, #0x00
	ldhl	sp,	#2
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, de
	ld	e, l
	ld	d, h
	ld	hl, #0x0000
	push	hl
	push	bc
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_UPDATE_TILE
;C:/gbdk/ZGB/common/src/Scroll.c:360: for(i = 0u; i != SCREEN_TILE_REFRES_W; ++i) {
	ldhl	sp,	#6
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x17
	jr	NZ, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:367: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:368: }
	add	sp, #7
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:370: void ScrollUpdateColumnR() {
;	---------------------------------
; Function ScrollUpdateColumnR
; ---------------------------------
_ScrollUpdateColumnR::
;C:/gbdk/ZGB/common/src/Scroll.c:373: for(i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i --) {
	ld	e, #0x00
00104$:
	ld	a, e
	sub	a, #0x05
	ret	Z
	ld	a, (#_pending_h_i)
	or	a, a
	ret	Z
;C:/gbdk/ZGB/common/src/Scroll.c:379: UPDATE_TILE(pending_h_x, pending_h_y ++, pending_h_map, 0);
	ld	hl, #_pending_h_y
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	ld	b, a
	inc	(hl)
	jr	NZ, 00131$
	inc	hl
	inc	(hl)
00131$:
	push	de
	ld	hl, #0x0000
	push	hl
	ld	hl, #_pending_h_map
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	a, (_pending_h_map + 1)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	ld	hl, #_pending_h_x
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_UPDATE_TILE
	pop	de
;C:/gbdk/ZGB/common/src/Scroll.c:380: pending_h_map += scroll_tiles_w;
	ld	a, (#_pending_h_map)
	ld	hl, #_scroll_tiles_w
	add	a, (hl)
	ld	hl, #_pending_h_map
	ld	(hl+), a
	ld	a, (hl)
	ld	hl, #_scroll_tiles_w + 1
	adc	a, (hl)
	ld	(#_pending_h_map + 1),a
;C:/gbdk/ZGB/common/src/Scroll.c:373: for(i = 0u; i != 5 && pending_h_i != 0; ++i, pending_h_i --) {
	inc	e
	ld	hl, #_pending_h_i
	dec	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:383: }
	jr	00104$
;C:/gbdk/ZGB/common/src/Scroll.c:385: void ScrollUpdateColumnWithDelay(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumnWithDelay
; ---------------------------------
_ScrollUpdateColumnWithDelay::
;C:/gbdk/ZGB/common/src/Scroll.c:386: while(pending_h_i) {
00101$:
	ld	a, (#_pending_h_i)
	or	a, a
	jr	Z, 00103$
;C:/gbdk/ZGB/common/src/Scroll.c:387: ScrollUpdateColumnR();
	push	bc
	push	de
	call	_ScrollUpdateColumnR
	pop	de
	pop	bc
	jr	00101$
00103$:
;C:/gbdk/ZGB/common/src/Scroll.c:390: pending_h_x = x;
	ld	hl, #_pending_h_x
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/gbdk/ZGB/common/src/Scroll.c:391: pending_h_y = y;
	ld	hl, #_pending_h_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/gbdk/ZGB/common/src/Scroll.c:392: pending_h_i = SCREEN_TILE_REFRES_H;
	ld	hl, #_pending_h_i
	ld	(hl), #0x15
;C:/gbdk/ZGB/common/src/Scroll.c:393: pending_h_map = scroll_map + scroll_tiles_w * y + x;
	push	de
	ld	hl, #_scroll_tiles_w
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	pop	de
	ld	a, c
	ld	hl, #_scroll_map
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
	ld	a, c
	add	a, e
	ld	hl, #_pending_h_map
	ld	(hl+), a
	ld	a, b
	adc	a, d
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:398: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:400: void ScrollUpdateColumn(INT16 x, INT16 y) {
;	---------------------------------
; Function ScrollUpdateColumn
; ---------------------------------
_ScrollUpdateColumn::
	add	sp, #-5
	ldhl	sp,	#2
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
	inc	sp
	inc	sp
	push	bc
	ld	hl, #_scroll_tiles_w
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, (hl)
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	a, c
	ld	hl, #_scroll_map
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, b
	adc	a, (hl)
	ld	d, a
;C:/gbdk/ZGB/common/src/Scroll.c:407: PUSH_BANK(scroll_bank);
	push	de
	ld	a, (#_scroll_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;C:/gbdk/ZGB/common/src/Scroll.c:408: for(i = 0u; i != SCREEN_TILE_REFRES_H; ++i) {
	ldhl	sp,	#4
	ld	(hl), #0x00
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:414: UPDATE_TILE(x, y + i, map, 0);
	ldhl	sp,	#4
	ld	c, (hl)
	ld	b, #0x00
	pop	hl
	push	hl
	add	hl, bc
	ld	c, l
	ld	b, h
	push	de
	ld	hl, #0x0000
	push	hl
	push	de
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_UPDATE_TILE
	pop	de
;C:/gbdk/ZGB/common/src/Scroll.c:415: map += scroll_tiles_w;
	ld	a, e
	ld	hl, #_scroll_tiles_w
	add	a, (hl)
	inc	hl
	ld	e, a
	ld	a, d
	adc	a, (hl)
	ld	d, a
;C:/gbdk/ZGB/common/src/Scroll.c:408: for(i = 0u; i != SCREEN_TILE_REFRES_H; ++i) {
	ldhl	sp,	#4
	inc	(hl)
	ld	a, (hl)
	sub	a, #0x15
	jr	NZ, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:418: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:419: }
	add	sp, #5
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:421: void RefreshScroll() {
;	---------------------------------
; Function RefreshScroll
; ---------------------------------
_RefreshScroll::
	add	sp, #-10
;C:/gbdk/ZGB/common/src/Scroll.c:422: UINT16 ny = scroll_y;
	ld	a, (#_scroll_y)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_scroll_y + 1)
	ldhl	sp,	#1
	ld	(hl), a
;C:/gbdk/ZGB/common/src/Scroll.c:424: if(scroll_target) {
	ld	hl, #_scroll_target + 1
	ld	a, (hl-)
	or	a, (hl)
	jp	Z, 00108$
;C:/gbdk/ZGB/common/src/Scroll.c:425: if(U_LESS_THAN(scroll_bottom_movement_limit, scroll_target->y - scroll_y)) {
	ld	a, (#_scroll_bottom_movement_limit)
	ldhl	sp,	#9
	ld	(hl), a
	ld	a, (#_scroll_target)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_scroll_target + 1)
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000e
	add	hl, de
	ld	c, l
	ld	b, h
	ld	e, c
	ld	d, b
	ld	a, (de)
	ldhl	sp,	#4
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	hl, #_scroll_y
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
	ldhl	sp,	#9
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	c, a
	ld	b, #0x00
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ld	(hl-), a
	ld	(hl), e
	push	hl
	inc	hl
	bit	7, (hl)
	pop	hl
	jr	Z, 00104$
;C:/gbdk/ZGB/common/src/Scroll.c:426: ny = scroll_target->y - scroll_bottom_movement_limit;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
	jr	00105$
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:427: } else if(U_LESS_THAN(scroll_target->y - scroll_y, scroll_top_movement_limit)) {
	ld	hl, #_scroll_top_movement_limit
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	inc	hl
	ld	d, a
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ld	(hl-), a
	ld	(hl), e
	push	hl
	inc	hl
	bit	7, (hl)
	pop	hl
	jr	Z, 00105$
;C:/gbdk/ZGB/common/src/Scroll.c:428: ny = scroll_target->y - scroll_top_movement_limit;
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, e
	sub	a, c
	ld	e, a
	ld	a, d
	sbc	a, b
	ldhl	sp,	#1
	ld	(hl-), a
	ld	(hl), e
00105$:
;C:/gbdk/ZGB/common/src/Scroll.c:431: MoveScroll(scroll_target->x - (SCREENWIDTH >> 1), ny);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x000c
	add	hl, de
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, c
	add	a, #0xb0
	ld	e, a
	ld	a, b
	adc	a, #0xff
	ld	d, a
	pop	bc
	push	bc
	call	_MoveScroll
00108$:
;C:/gbdk/ZGB/common/src/Scroll.c:433: }
	add	sp, #10
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:435: void MoveScroll(INT16 x, INT16 y) {
;	---------------------------------
; Function MoveScroll
; ---------------------------------
_MoveScroll::
	add	sp, #-10
;C:/gbdk/ZGB/common/src/Scroll.c:438: PUSH_BANK(scroll_bank);
	push	bc
	push	de
	ld	a, (#_scroll_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:440: current_column = scroll_x >> 3;
	ld	a, (#_scroll_x)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_scroll_x + 1)
	ldhl	sp,	#1
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:441: current_row    = scroll_y >> 3;
	ld	a, (#_scroll_y)
	ldhl	sp,	#2
	ld	(hl), a
	ld	a, (#_scroll_y + 1)
	ldhl	sp,	#3
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:443: scroll_x = x;
	ld	hl, #_scroll_x
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;C:/gbdk/ZGB/common/src/Scroll.c:444: scroll_y = y;
	ld	hl, #_scroll_y
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;C:/gbdk/ZGB/common/src/Scroll.c:445: ClampScrollLimits();
	call	_ClampScrollLimits
;C:/gbdk/ZGB/common/src/Scroll.c:447: new_column     = scroll_x >> 3;
	ld	hl, #_scroll_x
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	sra	b
	rr	c
	sra	b
	rr	c
	sra	b
	rr	c
;C:/gbdk/ZGB/common/src/Scroll.c:448: new_row        = scroll_y >> 3;
	ld	a, (#_scroll_y)
	ldhl	sp,	#4
	ld	(hl), a
	ld	a, (#_scroll_y + 1)
	ldhl	sp,	#5
	ld	(hl), a
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
	inc	hl
	sra	(hl)
	dec	hl
	rr	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:452: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	(hl), e
;C:/gbdk/ZGB/common/src/Scroll.c:454: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ld	de, #0x0001
	ld	a, c
	sub	a, e
	ld	e, a
	ld	a, b
	sbc	a, d
	ldhl	sp,	#9
	ld	(hl-), a
	ld	(hl), e
;C:/gbdk/ZGB/common/src/Scroll.c:450: if(current_column != new_column) {
	ldhl	sp,	#0
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00159$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jr	Z, 00105$
00159$:
;C:/gbdk/ZGB/common/src/Scroll.c:451: if(new_column > current_column) {
	ldhl	sp,	#0
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00160$
	bit	7, d
	jr	NZ, 00161$
	cp	a, a
	jr	00161$
00160$:
	bit	7, d
	jr	Z, 00161$
	scf
00161$:
	jr	NC, 00102$
;C:/gbdk/ZGB/common/src/Scroll.c:452: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT + SCREEN_TILE_REFRES_W - 1, new_row - SCREEN_PAD_TOP);
	ld	hl, #0x0015
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	call	_ScrollUpdateColumnWithDelay
	jr	00105$
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:454: ScrollUpdateColumnWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_ScrollUpdateColumnWithDelay
00105$:
;C:/gbdk/ZGB/common/src/Scroll.c:458: if(current_row != new_row) {
	ldhl	sp,	#2
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	NZ, 00162$
	dec	hl
	ld	a, (hl+)
	inc	hl
	sub	a, (hl)
	jr	Z, 00110$
00162$:
;C:/gbdk/ZGB/common/src/Scroll.c:459: if(new_row > current_row) {
	ldhl	sp,	#2
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00163$
	bit	7, d
	jr	NZ, 00164$
	cp	a, a
	jr	00164$
00163$:
	bit	7, d
	jr	Z, 00164$
	scf
00164$:
	jr	NC, 00107$
;C:/gbdk/ZGB/common/src/Scroll.c:460: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP + SCREEN_TILE_REFRES_H - 1);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0013
	add	hl, de
	ld	c, l
	ld	b, h
	ldhl	sp,	#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_ScrollUpdateRowWithDelay
	jr	00110$
00107$:
;C:/gbdk/ZGB/common/src/Scroll.c:462: ScrollUpdateRowWithDelay(new_column - SCREEN_PAD_LEFT, new_row - SCREEN_PAD_TOP);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	_ScrollUpdateRowWithDelay
00110$:
;C:/gbdk/ZGB/common/src/Scroll.c:466: if(pending_w_i) {
	ld	a, (#_pending_w_i)
	or	a, a
	jr	Z, 00112$
;C:/gbdk/ZGB/common/src/Scroll.c:467: ScrollUpdateRowR();
	call	_ScrollUpdateRowR
00112$:
;C:/gbdk/ZGB/common/src/Scroll.c:469: if(pending_h_i) {
	ld	a, (#_pending_h_i)
	or	a, a
	jr	Z, 00114$
;C:/gbdk/ZGB/common/src/Scroll.c:470: ScrollUpdateColumnR();
	call	_ScrollUpdateColumnR
00114$:
;C:/gbdk/ZGB/common/src/Scroll.c:472: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:473: }
	add	sp, #10
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:475: UINT8* GetScrollTilePtr(UINT16 x, UINT16 y) {
;	---------------------------------
; Function GetScrollTilePtr
; ---------------------------------
_GetScrollTilePtr::
;C:/gbdk/ZGB/common/src/Scroll.c:479: return scroll_map + (scroll_tiles_w * y + x); //TODO: fix this mult!!
	push	de
	ld	hl, #_scroll_tiles_w
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	call	__mulint
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	pop	de
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, c
	ld	hl, #_scroll_map
	add	a, (hl)
	inc	hl
	ld	c, a
	ld	a, b
	adc	a, (hl)
	ld	b, a
;C:/gbdk/ZGB/common/src/Scroll.c:480: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:482: UINT8 GetScrollTile(UINT16 x, UINT16 y) {
;	---------------------------------
; Function GetScrollTile
; ---------------------------------
_GetScrollTile::
;C:/gbdk/ZGB/common/src/Scroll.c:484: PUSH_BANK(scroll_bank);
	push	bc
	push	de
	ld	a, (#_scroll_bank)
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:485: ret = *GetScrollTilePtr(x, y);
	call	_GetScrollTilePtr
	ld	a, (bc)
	ld	c, a
;C:/gbdk/ZGB/common/src/Scroll.c:486: POP_BANK;
	push	bc
	call	_PopBank
	pop	bc
;C:/gbdk/ZGB/common/src/Scroll.c:487: return ret;
	ld	a, c
;C:/gbdk/ZGB/common/src/Scroll.c:488: }
	ret
;C:/gbdk/ZGB/common/src/Scroll.c:490: void GetMapSize(UINT8 map_bank, const struct MapInfo* map, UINT8* tiles_w, UINT8* tiles_h)
;	---------------------------------
; Function GetMapSize
; ---------------------------------
_GetMapSize::
;C:/gbdk/ZGB/common/src/Scroll.c:492: PUSH_BANK(map_bank);
	push	de
	push	af
	inc	sp
	call	_PushBank
	inc	sp
	pop	de
;C:/gbdk/ZGB/common/src/Scroll.c:493: if(tiles_w) *tiles_w = map->width;
	ldhl	sp,	#3
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00102$
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, e
;	spillPairReg hl
;	spillPairReg hl
	ld	h, d
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, (hl)
	ld	(bc), a
00102$:
;C:/gbdk/ZGB/common/src/Scroll.c:494: if(tiles_h) *tiles_h = map->height;
	ldhl	sp,	#5
	ld	a, (hl-)
	or	a, (hl)
	jr	Z, 00104$
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	(bc), a
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:495: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:496: }
	pop	hl
	add	sp, #4
	jp	(hl)
;C:/gbdk/ZGB/common/src/Scroll.c:498: UINT8 ScrollFindTile(UINT8 map_bank, const struct MapInfo* map, UINT8 tile,
;	---------------------------------
; Function ScrollFindTile
; ---------------------------------
_ScrollFindTile::
	add	sp, #-16
	ldhl	sp,	#12
	ld	(hl), e
	inc	hl
	ld	(hl), d
;C:/gbdk/ZGB/common/src/Scroll.c:502: UINT16 yt = 0;
	ldhl	sp,	#0
	ld	(hl), #0x00
	inc	hl
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:503: UINT8 found = 1;
	inc	hl
	ld	(hl), #0x01
;C:/gbdk/ZGB/common/src/Scroll.c:505: PUSH_BANK(map_bank);
	push	af
	inc	sp
	call	_PushBank
	inc	sp
;C:/gbdk/ZGB/common/src/Scroll.c:506: for(xt = start_x; xt != start_x + w; ++ xt) {
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0002
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl), a
	ldhl	sp,	#3
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl+), a
	ld	(hl), #0x00
00110$:
	ldhl	sp,	#19
	ld	a, (hl+)
	inc	hl
	ld	b, #0x00
	ld	e, (hl)
	add	a, e
	ld	c, a
	jr	NC, 00149$
	inc	b
00149$:
	ldhl	sp,	#14
	ld	a, (hl)
	sub	a, c
	jr	NZ, 00150$
	inc	hl
	ld	a, (hl)
	sub	a, b
	jp	Z,00104$
00150$:
;C:/gbdk/ZGB/common/src/Scroll.c:507: for(yt = start_y; yt != start_y + h; ++ yt) {
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl-), a
	dec	hl
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#9
	ld	(hl), a
	pop	de
	push	de
00107$:
	ldhl	sp,	#20
	ld	a, (hl)
	ldhl	sp,	#10
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#22
	ld	c, (hl)
	ld	b, #0x00
	ldhl	sp,	#10
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, c
	sub	a, e
	jr	NZ, 00151$
	ld	a, b
	sub	a, d
	jr	Z, 00111$
00151$:
;C:/gbdk/ZGB/common/src/Scroll.c:508: if(map->data[map->width * yt + xt] == (UINT16)tile) { //That cast over there is mandatory and gave me a lot of headaches
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	push	de
	ld	c, e
	ld	b, d
	ld	e, (hl)
	ld	d, #0x00
	call	__mulint
	pop	de
	ldhl	sp,	#14
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#7
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	add	hl, bc
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	c, a
	ldhl	sp,	#18
	ld	a, (hl)
	sub	a, c
	jr	Z, 00105$
;C:/gbdk/ZGB/common/src/Scroll.c:507: for(yt = start_y; yt != start_y + h; ++ yt) {
	inc	de
	inc	sp
	inc	sp
	push	de
	jr	00107$
00111$:
;C:/gbdk/ZGB/common/src/Scroll.c:506: for(xt = start_x; xt != start_x + w; ++ xt) {
	ldhl	sp,	#14
	inc	(hl)
	jr	NZ, 00153$
	inc	hl
	inc	(hl)
00153$:
	ldhl	sp,	#14
	ld	a, (hl)
	ldhl	sp,	#3
	ld	(hl), a
	ldhl	sp,	#15
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl), a
	jp	00110$
00104$:
;C:/gbdk/ZGB/common/src/Scroll.c:513: found = 0;
	ldhl	sp,	#2
	ld	(hl), #0x00
;C:/gbdk/ZGB/common/src/Scroll.c:515: done:
00105$:
;C:/gbdk/ZGB/common/src/Scroll.c:516: POP_BANK;
	call	_PopBank
;C:/gbdk/ZGB/common/src/Scroll.c:517: *x = xt;
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;C:/gbdk/ZGB/common/src/Scroll.c:518: *y = yt;
	ldhl	sp,	#25
	ld	a, (hl)
	ldhl	sp,	#14
	ld	(hl), a
	ldhl	sp,	#26
	ld	a, (hl)
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(de), a
	inc	de
;C:/gbdk/ZGB/common/src/Scroll.c:520: return found;
	ld	a, (hl+)
	ld	(de), a
	ld	a, (hl)
;C:/gbdk/ZGB/common/src/Scroll.c:521: }
	add	sp, #16
	pop	hl
	add	sp, #9
	jp	(hl)
	.area _CODE
	.area _INITIALIZER
__xinit__scroll_top_movement_limit:
	.db #0x1e	; 30
__xinit__scroll_bottom_movement_limit:
	.db #0x64	; 100	'd'
__xinit__scroll_map:
	.dw #0x0000
__xinit__scroll_cmap:
	.dw #0x0000
__xinit__scroll_x:
	.dw #0x0000
__xinit__scroll_y:
	.dw #0x0000
__xinit__scroll_x_vblank:
	.db #0x00	; 0
__xinit__scroll_y_vblank:
	.db #0x00	; 0
__xinit__scroll_target:
	.dw #0x0000
__xinit__scroll_offset_x:
	.db #0x00	; 0
__xinit__scroll_offset_y:
	.db #0x00	; 0
__xinit__pending_h_map:
	.dw #0x0000
__xinit__pending_w_map:
	.dw #0x0000
__xinit__last_tile_loaded:
	.db #0x00	; 0
__xinit__last_bg_pal_loaded:
	.db #0x00	; 0
__xinit__scroll_h_border:
	.db #0x00	;  0
__xinit__clamp_enabled:
	.db #0x01	; 1
	.area _CABS (ABS)
