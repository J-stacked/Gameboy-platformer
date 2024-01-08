#pragma bank 255

//AUTOGENERATED FILE FROM png2asset

#include <stdint.h>
#include <gbdk/platform.h>
#include <gbdk/metasprites.h>

BANKREF(player)

const palette_color_t player_palettes[8] = {
	RGB8(224,239, 41), RGB8( 56,184, 64), RGB8( 32,112, 48), RGB8(  0, 56, 40)
	,
	RGB8(224,239, 41), RGB8( 57,185, 66), RGB8( 32,117, 49), RGB8(  7, 57, 46)
	
};

const uint8_t player_tiles[128] = {
	0x00,0x00,0x07,0x07,
	0x0f,0x0f,0x1f,0x1f,
	0x17,0x1a,0x17,0x1a,
	0x18,0x1f,0x0b,0x0f,
	0x05,0x07,0x07,0x07,
	0x03,0x03,0x01,0x03,
	0x02,0x03,0x03,0x03,
	0x02,0x02,0x03,0x03,
	
0x00,0x00,0xc0,0xc0,
	0xe0,0xe0,0xf0,0xf0,
	0xf0,0x50,0xf0,0x50,
	0x10,0xf0,0x20,0xe0,
	0x40,0xc0,0x80,0x80,
	0xfc,0xfc,0x80,0xc0,
	0x00,0x80,0x80,0x80,
	0x80,0x80,0xc0,0xc0,
	
0x00,0x00,0x07,0x07,
	0x0f,0x0f,0x1f,0x1f,
	0x17,0x1a,0x17,0x1a,
	0x18,0x1f,0x0b,0x0f,
	0x05,0x07,0x07,0x07,
	0x03,0x03,0x01,0x03,
	0x02,0x03,0x03,0x03,
	0x06,0x06,0x04,0x04,
	
0x00,0x00,0xc0,0xc0,
	0xe0,0xe0,0xf0,0xf0,
	0xf0,0x50,0xf0,0x50,
	0x10,0xf0,0x20,0xe0,
	0x40,0xc0,0x80,0x80,
	0xfc,0xfc,0x80,0xc0,
	0x00,0x80,0x80,0x80,
	0x40,0x40,0x60,0x60
	
};

const metasprite_t player_metasprite0[] = {
	METASPR_ITEM(0, -3, 0, S_PAL(0)),
	METASPR_ITEM(0, 8, 2, S_PAL(0)),
	METASPR_TERM
};

const metasprite_t player_metasprite1[] = {
	METASPR_ITEM(0, -3, 0, S_PAL(1)),
	METASPR_ITEM(0, 8, 2, S_PAL(1)),
	METASPR_TERM
};

const metasprite_t player_metasprite2[] = {
	METASPR_ITEM(0, -3, 4, S_PAL(0)),
	METASPR_ITEM(0, 8, 6, S_PAL(0)),
	METASPR_TERM
};

const metasprite_t* const player_metasprites[3] = {
	player_metasprite0, player_metasprite1, player_metasprite2
};

#include "MetaSpriteInfo.h"
const struct MetaSpriteInfo player = {
	10, //width
	15, //height
	8, //num tiles
	player_tiles, //tiles
	2, //num palettes
	player_palettes, //CGB palette
	3, //num sprites
	player_metasprites, //metasprites
};
